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

  String dump() => "<Invalid: SFBase>";
}

class SFSequence extends SFBase {
  final List<dynamic> _elements = [];

  SFSequence({super.line, super.column});

  SFSequence.withContent(List<dynamic> input, {super.line, super.column}) {
    for (dynamic x in input) {
      if (x != null) {
        _elements.add(x);
      }
    }
  }

  void add(dynamic x) {
    _elements.add(x);
  }

  int get size => _elements.length;

  dynamic get first => _elements[0];
  SFSequence get rest {
    if (_elements.length > 1) {
      return SFSequence.withContent(_elements.sublist(1));
    } else {
      return SFSequence();
    }
  }

  @override
  String dump() {
    String out = "seq[";
    bool first = true;
    for (var e in _elements) {
      if (first) {
        out = "$out${debugStr(e)}";
      } else {
        out = "$out ${debugStr(e)}";
      }
      first = false;
    }
    return "$out]";
  }
}

class SFSquash extends SFSequence {
  String? duration;
  SFSquash({super.line, super.column});

  @override
  String dump() {
    String out = "{";
    bool first = true;
    for (var e in _elements) {
      if (first) {
        out = "$out${debugStr(e)}";
      } else {
        out = "$out ${debugStr(e)}";
      }
      first = false;
    }
    out = "$out}";
    if (duration != null) {
      out = "$out:${duration!}";
    }
    return out;
  }
}

class SFList extends SFSequence {
  SFList({super.line, super.column});

  // @override
  // SFExpression.withContents(super.input, {super.line, super.column});

  @override
  String dump() {
    String out = "expr(";
    bool first = true;
    for (var e in _elements) {
      if (first) {
        out = "$out${debugStr(e)}";
      } else {
        out = "$out ${debugStr(e)}";
      }
      first = false;
    }
    return "$out)";
  }
}

class SFConcurrent extends SFSequence {
  // final List<dynamic> _elements = [];

  SFConcurrent({super.line, super.column});

  @override
  String dump() {
    String out = "&[";
    bool first = true;
    for (var e in _elements) {
      if (first) {
        out = "$out${debugStr(e)}";
      } else {
        out = "$out ${debugStr(e)}";
      }
      first = false;
    }
    return "$out]";
  }
}

class SFSymbol extends SFBase {
  final String _name;

  SFSymbol(this._name, {super.line, super.column});

  @override
  String toString() => _name;

  @override
  String dump() => "sym:$_name";
}

class SFNote extends SFBase {
  final String note;
  final String? duration;
  SFNote(this.note, this.duration, {super.line, super.column});

  @override
  String dump() => "note($note:$duration)";
}

class SFStepNote extends SFBase {
  final String note;
  final String? duration;
  SFStepNote(this.note, this.duration, {super.line, super.column});

  @override
  String dump() => "step($note:$duration)";
}

class SFSolfegeNote extends SFBase {
  final String note;
  final String? duration;
  SFSolfegeNote(this.note, this.duration, {super.line, super.column});

  @override
  String dump() => "solf($note:$duration)";
}

class SFRest extends SFBase {
  final String? duration;
  SFRest(this.duration, {super.line, super.column});

  @override
  String dump() => "rest($duration)";
}

class SFOctave extends SFBase {
  final int octave;
  SFOctave(this.octave, {super.line, super.column});

  @override
  String dump() => "octave($octave)";
}

class SFOctaveChange extends SFBase {
  final bool up;
  bool get down => !up;
  SFOctaveChange(this.up, {super.line, super.column});

  @override
  String dump() => "oct-change(up=$up)";
}

class SFMarker extends SFBase {
  String name;
  SFMarker(this.name);

  @override
  String dump() => "<%$name>";
}

class SFReference extends SFBase {
  String name;
  SFReference(this.name);

  @override
  String dump() => "<@$name>";
}

abstract class SFFunc extends SFBase {}

//--------------------------------------------------------------------------------------

String debugStr(dynamic obj) {
  String type = "${obj.runtimeType}";
  switch (type) {
    case "int":
    case "double":
    case "num":
      return "$obj";
    case "String":
      return '"$obj"';
    case "List<dynamic>":
      return _dumpList(obj);
  }
  return obj.dump();
}

String _dumpList(List<dynamic> l) {
  String out = "List[";
  bool first = true;
  for (var e in l) {
    if (first) {
      out = "$out${debugStr(e)}";
    } else {
      out = "$out ${debugStr(e)}";
    }
    first = false;
  }
  return "$out]";
}

final Set<String> solfegeSyllables = {
  'do',
  'di',
  'ra',
  're',
  'ri',
  'me',
  'mi',
  'fa',
  'fi',
  'se',
  'so',
  'si',
  'le',
  'la',
  'li',
  'te',
  'ti'
};

void error(String msg, String token) {
  print("ERROR: $msg - ($token)");
}

SFBase? buildSymbolLike(String sym, int? line, int? column) {
  int len = sym.length;

  RegExp durationRE = RegExp(r'[0-9]+\.*(~[0-9]+\.*)*');
  RegExp toneRE = RegExp(r'[cdefgabr][_+\-]*');
  RegExp solfegeRE = RegExp(r'[a-z]{2}');
  RegExp octaveRE = RegExp(r'o[0-8+\-]');
  RegExp markerRE = RegExp(r'[@%][a-zA-Z][a-zA-Z0-9_\-]*');

  RegExpMatch? toneMatch = toneRE.firstMatch(sym);
  RegExpMatch? durMatch = durationRE.firstMatch(sym);
  RegExpMatch? solfegeMatch = solfegeRE.firstMatch(sym);
  RegExpMatch? octaveMatch = octaveRE.firstMatch(sym);
  RegExpMatch? markerMatch = markerRE.firstMatch(sym);

  // solfege
  if (solfegeMatch != null) {
    if (solfegeSyllables.contains(sym.substring(0, 2))) {
      if (durMatch != null) {
        if (solfegeMatch.start == 0 && solfegeMatch.end == durMatch.start && durMatch.end == len) {
          String s = sym.substring(solfegeMatch.start, solfegeMatch.end);
          String d = sym.substring(durMatch.start, durMatch.end);
          return SFSolfegeNote(s, d);
        } else {
          error("Bad solfege note with duration", sym);
          return null;
        }
      } else {
        if (solfegeMatch.start == 0 && solfegeMatch.end == len) {
          String s = sym.substring(solfegeMatch.start, solfegeMatch.end);
          return SFSolfegeNote(s, null);
        }
      }
    }
  }

  // regular note
  if (toneMatch != null) {
    if (durMatch != null) {
      if (toneMatch.start == 0 && toneMatch.end == durMatch.start && durMatch.end == len) {
        String n = sym.substring(toneMatch.start, toneMatch.end);
        String d = sym.substring(durMatch.start, durMatch.end);
        if (n == 'r') {
          return SFRest(d);
        } else {
          return SFNote(n, d);
        }
      } else {
        error("Bad note with duration", sym);
        return null;
      }
    } else {
      if (toneMatch.start == 0 && toneMatch.end == len) {
        String n = sym.substring(toneMatch.start, toneMatch.end);
        if (n == 'r') {
          return SFRest(null);
        } else {
          return SFNote(n, null);
        }
      }
    }
  }

  // octave token
  if (octaveMatch != null) {
    if (octaveMatch.start == 0 && octaveMatch.end == len) {
      String c2 = sym[1];
      if (c2 == '+') {
        return SFOctaveChange(true);
      } else if (c2 == '-') {
        return SFOctaveChange(false);
      } else {
        int oct = int.parse(c2);
        return SFOctave(oct);
      }
    } else {
      error("Bad octave operation", sym);
      return null;
    }
  }

  // marker token
  if (markerMatch != null) {
    if (markerMatch.start == 0 && markerMatch.end == len) {
      if (sym[0] == '%') {
        return SFMarker(sym.substring(1));
      } else {
        assert(sym[0] == '@');
        return SFReference(sym.substring(1));
      }
    } else {
      error("Improper marker definition / reference", sym);
    }
  }
  if (sym[0] == '@') {
    error("Improper marker reference", sym);
    return null;
  } else if (sym[0] == '%') {
    error("Improper marker definition", sym);
    return null;
  }

  return SFSymbol(sym);
}
