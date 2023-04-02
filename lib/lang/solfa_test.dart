import 'package:antlr4/antlr4.dart';
import './parser/solfaParser.dart';
import './parser/solfaLexer.dart';
import './solfa_parse_listener.dart';
import './language_objects.dart';

void main(List<String> args) async {
  String fname = '';
  if (args.isEmpty) {
    // fname = './examples/factorial.solfa';
    fname = './examples/basic_tests.solfa';
    // fname = './examples/silent_night.solfa';
  } else {
    fname = args[0];
  }
  solfaLexer.checkVersion();
  solfaParser.checkVersion();
  final SolfaParseListener solfaListener = SolfaParseListener();
  final input = await InputStream.fromPath(fname);
  final lexer = solfaLexer(input);
  final tokens = CommonTokenStream(lexer);
  final parser = solfaParser(tokens);
  parser.addParseListener(solfaListener);
  // parser.addErrorListener(DiagnosticErrorListener());
  parser.buildParseTree = true;
  parser.script();

  print(debugStr(solfaListener.formList));
}
