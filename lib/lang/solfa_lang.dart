import 'package:antlr4/antlr4.dart';
import './parser/solfaParser.dart';
import './parser/solfaLexer.dart';
import './solfa_parse_listener.dart';
import './language_objects.dart';

class ParseResult {
  final List<dynamic> forms;
  final List<SFError> errors;

  bool get anyErrors => errors.isNotEmpty;

  ParseResult(this.forms, this.errors);
}

class SolfaLang {
  SolfaLang() {
    solfaLexer.checkVersion();
    solfaParser.checkVersion();
  }

  ParseResult parse(String input) {
    final SolfaParseListener solfaListener = SolfaParseListener();
    final lexer = solfaLexer(InputStream.fromString(input));
    final tokens = CommonTokenStream(lexer);
    final parser = solfaParser(tokens);
    parser.addParseListener(solfaListener);
    parser.removeErrorListeners();
    parser.addErrorListener(solfaListener);
    parser.buildParseTree = true;
    parser.script();

    return ParseResult(solfaListener.formList, solfaListener.errorList);
  }
}
