/// Sol-Fa Language
///
/// Todos / Ideas:
/// 1. Do I want to differentiate between sequences of each type of note?
///   - Perhaps all three are different from a sequence of something else like numbers
///   - What about a sequence of durations or sequence of intervals or sequence of chords?
///   - Probably not.  Let the error checking go somewhere else for that

import 'package:petitparser/petitparser.dart';

class SolFaGrammar extends GrammarDefinition {
  @override
  Parser start() => ref0(cons).end();
  Parser cons() => ref0(cell) & (ref0(space) & ref0(cons)).optional();
  Parser list() => char('(') & ref0(cons) & char(')');
  Parser vector() => char('[') & ref0(cons) & char(']');
  Parser bag() => char('{') & ref0(cons) & char('}');
  Parser cell() => ref0(atom).optional();
  Parser atom() =>
      ref0(symbol) |
      ref0(solfegeNote) |
      ref0(numeralNote) |
      ref0(regularNote) |
      ref0(restNote) |
      ref0(octaveNumber) |
      ref0(octaveChange) |
      ref0(number) |
      ref0(list) |
      ref0(vector) |
      ref0(bag) |
      ref0(unknown);
  Parser regularNote() =>
      ref0(octaveChange).optional() & ref0(noteName) & ref0(duration).optional();
  Parser numeralNote() =>
      ref0(octaveChange).optional() & ref0(numeralNoteName) & ref0(duration).optional();
  Parser solfegeNote() => ref0(octaveChange).optional() & ref0(solfege) & ref0(duration).optional();
  Parser octaveNumber() => (char('o') & pattern('0-8')).flatten('Invalid octave number');
  Parser octaveChange() => pattern('\\/');
  Parser restNote() => char('r') & ref0(duration).optional();
  Parser barLine() => char('|');
  Parser number() => ref0(numberToken);
  Parser symbol() => ref0(symbolToken);
  Parser duration() =>
      (ref0(durationPart) & (char('~') & ref0(durationPart)).star()).flatten('Invalid duration');
  Parser durationPart() => (ref0(durationToken) & char('.').star()).flatten('Invalid duration');
  Parser noteName() => (pattern('cdefgab') & pattern('+-').star()).flatten();
  Parser numeralNoteName() => (ref0(romanNumeral) & pattern('+-').star()).flatten();
  Parser romanNumeral() =>
      char('i') |
      string('ii') |
      string('iii') |
      string('iv') |
      char('v') |
      string('vi') |
      string('vii');
  Parser solfege() =>
      string('do') |
      string('di') |
      string('ra') |
      string('re') |
      string('ri') |
      string('me') |
      string('mi') |
      string('fa') |
      string('fi') |
      string('se') |
      string('so') |
      string('si') |
      string('le') |
      string('la') |
      string('li') |
      string('te') |
      string('ti');
  Parser durationToken() =>
      string('64') | string('32') | string('16') | char('8') | char('4') | char('2') | char('1');
  Parser numberToken() => digit().plus().flatten('Number Expected'); // numberToken
  Parser symbolToken() =>
      (letter().times(3).flatten().where((x) => x != 'vii') & pattern('a-zA-Z0-9_-').star())
          .flatten('Symbol Expected');
  Parser space() => (char(' ') | char('\t') | char('\n') | char(',') | ref0(comment)).plus();
  Parser comment() => char(';') & Token.newlineParser().neg().star();
  Parser unknown() => pattern('a-zA-Z0-9_+-.').plus().flatten();
}
