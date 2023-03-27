///
/// the data objects for the Sol-Fa language
/// TODO: Need "dump" procedure for each object to aid with debugging structure or unit testing.
///

class SFBase {
  int? line;
  int? column;

  SFBase({this.line, this.column});

  String get loc {
    return "<line: $line, column: $column>";
  }

  String debugStr() => "<Invalid: SFBase>";
}

class SFSequence extends SFBase {
  final List<dynamic> _elements = [];

  SFSequence(List<dynamic> input, {super.line, super.column}) {
    for (dynamic x in input) {
      if (x != null) {
        _elements.add(x);
      }
    }
  }

  int get size => _elements.length;

  dynamic get first => _elements[0];
  SFSequence get rest {
    if (_elements.length > 1) {
      return SFSequence(_elements.sublist(1));
    } else {
      return SFSequence([]);
    }
  }

  @override
  String debugStr() {
    String out = "seq[";
    bool first = true;
    for (var e in _elements) {
      if (first) {
        out = "$out${e.debugStr()}";
      } else {
        out = "$out ${e.debugStr()}";
      }
      first = false;
    }
    return "$out]";
  }
}

class SFExpression extends SFSequence {
  @override
  SFExpression(super.input, {super.line, super.column});

  @override
  String debugStr() {
    String out = "expr(";
    bool first = true;
    for (var e in _elements) {
      if (first) {
        out = "$out${e.debugStr()}";
      } else {
        out = "$out ${e.debugStr()}";
      }
      first = false;
    }
    return "$out)";
  }
}

class SFBag extends SFBase {
  final List<dynamic> _elements = [];

  SFBag(List<dynamic> input, {super.line, super.column}) {
    for (dynamic x in input) {
      if (x != null) {
        _elements.add(x);
      }
    }
  }

  int get size => _elements.length;

  @override
  String debugStr() {
    String out = "bag{";
    bool first = true;
    for (var e in _elements) {
      if (first) {
        out = "$out${e.debugStr()}";
      } else {
        out = "$out ${e.debugStr()}";
      }
      first = false;
    }
    return "$out}";
  }
}

class SFSymbol extends SFBase {
  final String _name;

  SFSymbol(this._name, {super.line, super.column});

  @override
  String toString() => _name;

  @override
  String debugStr() => "sym:$_name";
}

class SFNote extends SFBase {
  final String note;
  final String? duration;
  SFNote(this.note, this.duration, {super.line, super.column});

  @override
  String debugStr() => "note($note:$duration)";
}

class SFStepNote extends SFBase {
  final String note;
  final String? duration;
  SFStepNote(this.note, this.duration, {super.line, super.column});

  @override
  String debugStr() => "step($note:$duration)";
}

class SFSolfegeNote extends SFBase {
  final String note;
  final String? duration;
  SFSolfegeNote(this.note, this.duration, {super.line, super.column});

  @override
  String debugStr() => "solf($note:$duration)";
}

class SFRest extends SFBase {
  final String? duration;
  SFRest(this.duration, {super.line, super.column});

  @override
  String debugStr() => "rest($duration)";
}

class SFOctave extends SFBase {
  final int octave;
  SFOctave(this.octave, {super.line, super.column});

  @override
  String debugStr() => "octave($octave)";
}

class SFOctaveChange extends SFBase {
  final bool up;
  bool get down => !up;
  SFOctaveChange(this.up, {super.line, super.column});

  @override
  String debugStr() => "oct-change(up=$up)";
}

extension ListDebug on List<dynamic> {
  String debugStr() {
    String out = "List[";
    bool first = true;
    for (var e in this) {
      if (first) {
        out = "$out${e.debugStr()}";
      } else {
        out = "$out ${e.debugStr()}";
      }
      first = false;
    }
    return "$out]";
  }
}

class SFUnknownToken extends SFBase {
  final String token;
  SFUnknownToken(this.token, {super.line, super.column});

  @override
  String debugStr() => "Unknown<$token>)";
}

abstract class SFFunc extends SFBase {}

//--------------------------------------------------------------------------------------

extension NumberDebug on num {
  String debugStr() => "$this";
}

extension StrDebug on String {
  String debugStr() => this;
}
