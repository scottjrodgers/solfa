import 'solfa_lang.dart';

class MusicalObject extends SFBase {
  /// start is measured in beats
  double start;

  /// duration is measured in beats
  double duration;

  MusicalObject(this.start, this.duration);

  double get end => start + duration;

  @override
  String dump() => "<<Musical Object>>";
}

class MidiNote extends MusicalObject {
  int midiNote;
  int velocity;
  double span;
  int device;
  int channel;

  MidiNote(double start, this.device, this.channel, this.midiNote, double duration, this.velocity,
      {this.span = 0.9})
      : super(start, duration);
}

class MidiRest extends MusicalObject {
  MidiRest(super.start, super.duration);
}

class MidiSequence extends MusicalObject {
  MusicalObject? first;
  MusicalObject? last;
  final List<MusicalObject> objects = [];
  MidiSequence(super.start, super.duration);
}

class MidiConcurrent extends MusicalObject {
  final List<MusicalObject> objects = [];
  MidiConcurrent(super.start, super.duration);
}
