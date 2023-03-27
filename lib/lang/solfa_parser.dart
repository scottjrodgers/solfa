import 'package:petitparser/petitparser.dart';
import 'solfa_grammar.dart';
import 'language_objects.dart';

class SolFaParser extends SolFaGrammar {
  bool debug = false;

  void debugPrint(String s) {
    if (debug) {
      print(s);
    }
  }

  /// parser overrides of base grammar
  @override
  Parser cons() => super.cons().map((x) => parseCons(x));

  @override
  Parser list() =>
      super.list().token().map((t) => SFExpression(t.value[1], line: t.line, column: t.column));

  @override
  Parser vector() =>
      super.vector().token().map((t) => SFSequence(t.value[1], line: t.line, column: t.column));

  @override
  Parser bag() => super.bag().token().map((t) => SFBag(t.value[1], line: t.line, column: t.column));

  @override
  Parser regularNote() => super
      .regularNote()
      .token()
      .map((t) => SFNote(t.value[1], t.value[2], line: t.line, column: t.column));

  @override
  Parser numeralNote() => super
      .numeralNote()
      .token()
      .map((t) => SFStepNote(t.value[0], t.value[1], line: t.line, column: t.column));

  @override
  Parser solfegeNote() => super
      .solfegeNote()
      .token()
      .map((t) => SFSolfegeNote(t.value[0], t.value[1], line: t.line, column: t.column));

  @override
  Parser octaveNumber() => super.octaveNumber().token().map((t) => parseOctaveNumber(t));

  @override
  Parser octaveChange() => super.octaveChange().token().map((t) => parseOctaveChange(t));

  @override
  Parser restNote() => super.restNote().token().map((t) => parseRest(t));

  @override
  Parser barLine() => super.barLine().token();

  @override
  Parser number() => super.number().map((x) => num.parse(x)).token();

  @override
  Parser symbol() =>
      super.symbol().token().map((t) => SFSymbol(t.value, line: t.line, column: t.column));

  @override
  Parser space() => super.space().flatten().map((x) => parseSpace(x));

  @override
  Parser unknown() => super.unknown().token().map((t) => parseUnknown(t));

  /// Solfa parsing functions
  List<dynamic> parseCons(dynamic x) {
    var a = x[0];
    var b = x[1];
    // print("a = $a,  b = $b");

    List<dynamic> out = [];
    if (a != null) {
      assert(a is! List);
      assert(a != ' ');
      out.add(a);
    }
    if (b is List) {
      List<dynamic> flat = flattenLists(b);
      for (var e in flat) {
        if (e != null) {
          out.add(e);
        }
      }
    }
    debugPrint('built Cons: ${out.debugStr()}');
    return out;
  }

  SFExpression parseList(dynamic t) {
    SFExpression obj = SFExpression(t.value[1], line: t.line, column: t.column);

    return obj;
  }

  // SFSequence parseSequence(dynamic t) {}
  // SFBag parseBag(dynamic t) {}
  // SFNote parseNote(dynamic t) {}
  // SFStepNote parseNumeralNote(dynamic t) {}
  // SFSolfegeNote parseSolfegeNote(dynamic t) {}
  SFOctave parseOctaveNumber(dynamic t) {
    SFOctave out = SFOctave(int.parse(t.value.substring(1)), line: t.line, column: t.column);
    return out;
  }

  SFOctaveChange parseOctaveChange(dynamic t) {
    SFOctaveChange out = SFOctaveChange(t.value == '/', line: t.line, column: t.column);
    return out;
  }

  dynamic parseRest(dynamic t) {
    SFRest out = SFRest(t.value[1], line: t.line, column: t.column);
    return out;
  }

  // dynamic parseBarline(dynamic t) {}
  // dynamic parseNumber(dynamic t) {}
  // SFSymbol parseSymbol(dynamic t) {}
  dynamic parseSpace(dynamic x) {
    debugPrint("Found Spaces: '$x'");
    return null;
  }

  dynamic parseUnknown(dynamic t) {
    return SFUnknownToken(t.value, line: t.line, column: t.column);
  }
}

/// Helper functions
void processList(List<dynamic> out, List<dynamic> input) {
  for (var e in input) {
    if (e is List) {
      processList(out, e);
    } else {
      out.add(e);
    }
  }
}

List<dynamic> flattenLists(List<dynamic> input) {
  List<dynamic> out = [];
  processList(out, input);
  return out;
}
