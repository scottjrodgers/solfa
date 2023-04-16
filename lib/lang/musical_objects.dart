class MusicalObject {
  MusicalObject? next;

  /// start is measured in beats
  double start;

  /// duration is measured in beats
  double duration;

  MusicalObject(this.start, this.duration);

  double get end => start + duration;
}

class Note extends MusicalObject {
  int midiNote;
  int velocity;
  double span;
  int device;
  int channel;

  Note(double start, this.device, this.channel, this.midiNote, double duration, this.velocity,
      {this.span = 0.9})
      : super(start, duration);
}

class Rest extends MusicalObject {
  Rest(super.start, super.duration);
}

class MusicalSequence extends MusicalObject {
  MusicalObject? first;
  MusicalObject? last;
  MusicalSequence(super.start, super.duration);
}

class MusicalConsequent extends MusicalObject {
  final List<MusicalObject> objects = [];
  MusicalConsequent(super.start, super.duration);
}
