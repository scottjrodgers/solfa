// ignore_for_file: avoid_print

import 'package:antlr4/antlr4.dart';
// import './parser/solfaParser.dart';
// import './parser/solfaLexer.dart';
// import './solfa_parse_listener.dart';
import './language_objects.dart';
import './solfa_lang.dart';

void main(List<String> args) async {
  String fname = '';
  if (args.isEmpty) {
    // fname = './examples/factorial.solfa';
    fname = './examples/basic_tests.solfa';
    // fname = './examples/silent_night.solfa';
    // fname = './examples/many_errors.sf';
  } else {
    fname = args[0];
  }

  SolfaLang sf = SolfaLang();

  for (int i = 0; i < 1; i++) {
    var input = await InputStream.fromPath(fname);
    String inputStr = input.toString();

    ParseResult result = sf.parse(inputStr);

    print(debugStr(result.forms));
    if (result.anyErrors) {
      print("Errors:");
      for (SFError err in result.errors) {
        print(err);
      }
    }
  }
}
