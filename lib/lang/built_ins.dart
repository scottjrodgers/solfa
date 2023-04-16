import 'dart:math';
import 'language_objects.dart';
import '../midi/midi_interface.dart';

Map<String, BuiltInFunction> functions = {
  'fn': lambda,
  'def': def,
  'play': play,
  'instrument': instrument,
};

BuiltInFunction lambda = (args, env) {
  assert(args.length > 1);
  List<dynamic> paramSymbols = args[0];
  List<dynamic> forms = args.sublist(1);
  List<String> paramList = [];
  for (var sym in paramSymbols) {
    paramList.add(sym.name);
  }
  return SFFunc(paramList, forms);
};

BuiltInFunction def = (args, env) {};

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

BuiltInFunction play = (args, env) {
  // playing logic
  MidiInterface midi = MidiInterface();
  int beatTicks = 36;
  int time = beatTicks * (midi.lastTick ~/ beatTicks) + beatTicks;

  int device = 0;
  int channel = 3;
  int octave = 5;
  double noteBeats = 1.0;

  for (var obj in args) {
    if (obj is SFNote) {
      if (obj.duration != null) {
        noteBeats = computeBeats(obj.duration!);
      }
      int durationTicks = (beatTicks * noteBeats).round();
      int note = octave * 12 + octaveInterval(obj.note);
      int noteOffTime = time + (durationTicks * 1.1).round();

      midi.queue(NoteOnEvent(time, note, 100, device: device, channel: channel));
      midi.queue(NoteOffEvent(noteOffTime, note, 100, device: device, channel: channel));
      time += durationTicks;
    }
  }
};

BuiltInFunction instrument = (args, env) {};
