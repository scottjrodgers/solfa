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
  final List<dynamic> elements = [];

  SFSequence({super.line, super.column});

  SFSequence.withContent(List<dynamic> input, {super.line, super.column}) {
    for (dynamic x in input) {
      if (x != null) {
        elements.add(x);
      }
    }
  }

  void add(dynamic x) {
    elements.add(x);
  }

  int get size => elements.length;

  dynamic get first => elements[0];
  SFSequence get rest {
    if (elements.length > 1) {
      return SFSequence.withContent(elements.sublist(1));
    } else {
      return SFSequence();
    }
  }

  @override
  String dump() {
    String out = "seq[";
    bool first = true;
    for (var e in elements) {
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
    for (var e in elements) {
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
    for (var e in elements) {
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
  // final List<dynamic> elements = [];

  SFConcurrent({super.line, super.column});

  @override
  String dump() {
    String out = "&[";
    bool first = true;
    for (var e in elements) {
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

  String get name => _name;

  @override
  String toString() => _name;

  @override
  String dump() => "sym:$_name";
}

abstract class SFBaseNote extends SFBase {
  final String note;
  final String? duration;
  SFBaseNote(this.note, this.duration, {super.line, super.column});
}

class SFNote extends SFBaseNote {
  SFNote(super.note, super.duration, {super.line, super.column});

  @override
  String dump() => "note($note:$duration)";
}

class SFStepNote extends SFBaseNote {
  SFStepNote(super.note, super.duration, {super.line, super.column});

  @override
  String dump() => "step($note:$duration)";
}

class SFSolfegeNote extends SFBaseNote {
  SFSolfegeNote(super.note, super.duration, {super.line, super.column});

  @override
  String dump() => "solf($note:$duration)";
}

class SFRest extends SFBase {
  String? duration;

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
  SFMarker(this.name, {super.line, super.column});

  @override
  String dump() => "<%$name>";
}

class SFReference extends SFBase {
  String name;
  SFReference(this.name, {super.line, super.column});

  @override
  String dump() => "<@$name>";
}

class SFError extends SFBase {
  String message;
  SFError(this.message, {super.line, super.column});

  @override
  String toString() => "$message ($line:$column)";

  @override
  dump() => toString();
}

class Environment {
  final Map<String, dynamic> _scope = {};
  Environment? parent;

  Environment();

  Environment extend() {
    Environment newEnv = Environment();
    newEnv.parent = this;
    return newEnv;
  }

  /// finds and returns the value associated with the given key (name)
  dynamic get(String key) {
    if (_scope.containsKey(key)) {
      return _scope[key];
    } else if (parent != null) {
      return parent!.get(key);
    } else {
      return null;
    }
  }

  /// assigns a value to a name (key) in the local scope (this environment)
  void def(String key, SFBase value) {
    _scope[key] = value;
  }

  /// set
  /// - Sets the value of a key in the first environment it's found in.
  /// - If not found, it's created in the local scope
  /// key: String - the name of the value to set
  /// value: The value to be stored
  void set(String key, dynamic value) {
    Environment e = this;
    while (e.parent != null) {
      if (e._scope.containsKey(key)) {
        e.def(key, value);
        return;
      }
      e = e.parent!;
    }
    def(key, value);
  }

  /// setBang
  /// - Sets the value of a key in the first environment it's found in.
  /// - If not found, it's created in the global scope
  /// key: String - the name of the value to set
  /// value: The value to be stored
  void setBang(String key, dynamic value) {
    Environment e = this;
    while (e.parent != null) {
      if (e._scope.containsKey(key)) {
        e.def(key, value);
        return;
      }
      e = e.parent!;
    }
    e.def(key, value);
  }
}

abstract class SFBaseFunc extends SFBase {
  // Environment env;
  SFBaseFunc({super.line, super.column});
  // SFBaseFunc({required this.env, super.line, super.column});
}

class SFFunc extends SFBaseFunc {
  String name;
  final List<dynamic> forms;
  final List<String> parameters;

  SFFunc(
    this.parameters,
    this.forms, {
    this.name = "Unnamed-Function",
    // required super.env,
    super.line,
    super.column,
  });

  @override
  String toString() => "<<$name>>";

  @override
  dump() => toString();
}

typedef BuiltInFunction = dynamic Function(List<dynamic> args, Environment env);

class SFBuiltIn extends SFBaseFunc {
  String name;
  BuiltInFunction func;

  SFBuiltIn(this.name, this.func);

  @override
  String toString() => "<<Built-In:$name>>";

  @override
  dump() => toString();
}

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
  if (obj == null) {
    return "<nil>";
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

  // octave token
  if (octaveMatch != null) {
    if (octaveMatch.start == 0 && octaveMatch.end == len) {
      String c2 = sym[1];
      if (c2 == '+') {
        return SFOctaveChange(true, line: line, column: column);
      } else if (c2 == '-') {
        return SFOctaveChange(false, line: line, column: column);
      } else {
        int oct = int.parse(c2);
        return SFOctave(oct, line: line, column: column);
      }
    } else {
      return SFError("Bad octave operation ($sym)", line: line, column: column);
    }
  }

  // marker token
  if (markerMatch != null) {
    if (markerMatch.start == 0 && markerMatch.end == len) {
      if (sym[0] == '%') {
        return SFMarker(sym.substring(1), line: line, column: column);
      } else {
        assert(sym[0] == '@');
        return SFReference(sym.substring(1), line: line, column: column);
      }
    } else {
      return SFError("Improper marker definition / reference ($sym)", line: line, column: column);
    }
  }
  if (sym[0] == '@') {
    return SFError("Improper marker reference ($sym)", line: line, column: column);
  } else if (sym[0] == '%') {
    return SFError("Improper marker definition ($sym)", line: line, column: column);
  }

  // solfege
  if (solfegeMatch != null) {
    if (solfegeSyllables.contains(sym.substring(0, 2))) {
      if (durMatch != null) {
        if (solfegeMatch.start == 0 && solfegeMatch.end == durMatch.start && durMatch.end == len) {
          String s = sym.substring(solfegeMatch.start, solfegeMatch.end);
          String d = sym.substring(durMatch.start, durMatch.end);
          return SFSolfegeNote(s, d);
        } else {
          return SFError("Bad solfege note with duration ($sym)", line: line, column: column);
        }
      } else {
        if (solfegeMatch.start == 0 && solfegeMatch.end == len) {
          String s = sym.substring(solfegeMatch.start, solfegeMatch.end);
          return SFSolfegeNote(s, null, line: line, column: column);
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
          return SFRest(d, line: line, column: column);
        } else {
          return SFNote(n, d, line: line, column: column);
        }
      } else {
        return SFError("Bad note with duration ($sym)", line: line, column: column);
      }
    } else {
      if (toneMatch.start == 0 && toneMatch.end == len) {
        String n = sym.substring(toneMatch.start, toneMatch.end);
        if (n == 'r') {
          return SFRest(null, line: line, column: column);
        } else {
          return SFNote(n, null, line: line, column: column);
        }
      }
    }
  }

  return SFSymbol(sym, line: line, column: column);
}
