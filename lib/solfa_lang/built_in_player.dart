part of "built_ins.dart";

BuiltInFunction instrument = (args, env) {
  assert(args.length == 2);
  assert(args[0] is int);
  assert(args[1] is int);
  int device = args[0];
  int channel = args[1];

  return SFInstrument(device, channel);
};

double computeBeats(String duration) {
  double beats = 0;
  duration = duration.replaceAll(' ', '');
  List<String> parts = duration.split('~');
  for (String part in parts) {
    int dots = 0;
    while (part[part.length - 1 - dots] == '.') {
      dots++;
    }
    String numString = part.substring(0, part.length - dots);
    int durNum = int.parse(numString);

    beats += (4.0 / durNum) * (2.0 - pow(0.5, dots));
  }
  return beats;
}

int octaveInterval(String note) {
  int semitone = 0;
  // assert(note.length == 1);

  switch (note[0]) {
    case 'c':
      semitone = 0;
      break;
    case 'd':
      semitone = 2;
      break;
    case 'e':
      semitone = 4;
      break;
    case 'f':
      semitone = 5;
      break;
    case 'g':
      semitone = 7;
      break;
    case 'a':
      semitone = 9;
      break;
    case 'b':
      semitone = 11;
      break;
    default:
      assert(false, "Bad note name.");
  }
  int accidentals = 0;
  for (int i = 1; i < note.length; i++) {
    switch (note[i]) {
      case '_':
        accidentals = 0;
        break;
      case '+':
        accidentals += 1;
        break;
      case '-':
        accidentals -= 1;
        break;
    }
  }

  return semitone + accidentals;
}

MusicalObject compileScore() {
  return MidiNote(0.0, 0, 1, 60, 1, 92);
}

HeapPriorityQueue<MidiEvent> makeQueue() {
  return HeapPriorityQueue<MidiEvent>((a, b) {
    if (a.time > b.time) {
      return 1;
    } else if (a.time < b.time) {
      return -1;
    }
    return 0;
  });
}

class MidiContext {
  // double time;
  double duration;
  double span;
  int velocity;
  int octave;
  int device;
  int channel;

  MidiContext({
    // this.time = 0.0,
    this.duration = 1.0,
    this.span = 0.9, // Need a better name for this, a small span is staccato, a long span is legato
    this.velocity = 80,
    this.octave = 4,
    this.device = 0,
    this.channel = 1,
  });

  MidiContext clone() {
    MidiContext newContext = MidiContext(
      duration: duration,
      span: span,
      velocity: velocity,
      octave: octave,
      device: device,
      channel: channel,
    );
    return newContext;
  }
}

/// compile
/// - intended to walk through the SolFa data structures and build out the set of midi messages to
///   perform the score.
/// inputs:
/// - obj: a SolFa object, typically a Sequence or Concurrent
/// - start: the startTime
/// - queue (optional) - a PriorityQueue for storing the MIDI events generated
/// - context (optional) - the context of the current instrument, duration, octave, etc.
///   - contexts continue moving through a sequence
///   - new contexts are generated for each object within a Concurrent, derived from the
///     active context.  The active context is pushed on a stack for the duration of the
///     concurrent, and popped off at the end.  All values will return to what they were before
///     the concurrent section.
double compile(dynamic obj, Environment env, double start,
    {HeapPriorityQueue? queue, MidiContext? context}) {
  HeapPriorityQueue pq = queue ?? makeQueue();
  MidiContext ctx = context ?? MidiContext();
  double time = start;

  if (obj is SFSymbol || obj is SFList) {
    return compile(eval(obj, env), env, start, queue: pq, context: ctx);
  }
  if (obj is SFInstrument) {
    ctx.device = obj.device;
    ctx.channel = obj.channel;
    return time;
  }
  if (obj is SFNote) {
    if (obj.duration != null) {
      ctx.duration = computeBeats(obj.duration!);
    }
    String noteName = obj.note;
    while ([r'/', r'\'].contains(noteName[0])) {
      String ch = noteName[0];
      if (ch == r'/') {
        ctx.octave++;
      } else if (ch == r'\') {
        ctx.octave--;
      }
      noteName = noteName.substring(1);
    }
    int note = ctx.octave * 12 + octaveInterval(noteName);
    double noteStartTime = time;
    double noteOffTime = time + ctx.duration * ctx.span;

    print("Note: t:$noteStartTime, p:$note, d:${ctx.duration}, sp:${ctx.span}");
    pq.add(NoteOnEvent(
      noteStartTime,
      note,
      ctx.velocity,
      device: ctx.device,
      channel: ctx.channel,
    ));
    pq.add(NoteOffEvent(noteOffTime, note, 0, device: ctx.device, channel: ctx.channel));
    return time + ctx.duration;
  }
  if (obj is SFOctave) {
    ctx.octave = obj.octave;
    return time;
  }
  if (obj is SFOctaveChange) {
    if (obj.up) {
      ctx.octave++;
    } else {
      ctx.octave--;
    }
    return time;
  }
  if (obj is SFRest) {
    if (obj.duration != null) {
      ctx.duration = computeBeats(obj.duration!);
    }
    return time + ctx.duration;
  }
  if (obj is SFConcurrent) {
    assert(obj is! SFList);
    double maxTime = 0;
    for (dynamic o in obj.elements) {
      double aTime = compile(o, env, time, queue: pq, context: ctx.clone());
      if (aTime > maxTime) {
        maxTime = aTime;
      }
    }
    return maxTime;
  }
  if (obj is SFSequence) {
    assert(obj is! SFList);
    for (dynamic o in obj.elements) {
      time = compile(o, env, time, queue: pq, context: ctx);
    }
    return time;
  }
  return time;
}

BuiltInFunction play = (args, env) {
  return biPlay(args, env);
};

dynamic biPlay(List<dynamic> args, Environment env) {
  // playing logic
  MidiInterface midi = MidiInterface();
  midi.ready = false;
  HeapPriorityQueue<MidiEvent> queue = makeQueue();
  MidiContext context = MidiContext();
  double time = 0.0;
  for (dynamic arg in args) {
    time = compile(arg, env, time, queue: queue, context: context);
  }
  while (queue.isNotEmpty) {
    MidiEvent e = queue.removeFirst();
    midi.queue(e);
  }
  midi.start();
}
