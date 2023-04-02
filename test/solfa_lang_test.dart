import 'package:flutter_test/flutter_test.dart';
// import 'package:solfa/lang/solfa_parser.dart';
import 'package:solfa/lang/language_objects.dart';

// Parser setup() {
//   var definition = SolFaParser();
//   Parser p = definition.build();
//   return p;
// }

void myTest(String s, dynamic key) {
  test("test: '$s'", () {
    // Parser p = setup();
    // // var result = trace(p).parse(s);
    // List<dynamic> result = p.parse(s).value;
    // expect(debugStr(result), key);
  });
}

void main() {
  group('cons sequence testing', () {
    myTest('a', 'List[note(a:null)]');
    myTest('a a', 'List[note(a:null) note(a:null)]');
    myTest('a4', 'List[note(a:4)]');
    myTest(' a', 'List[note(a:null)]');
    myTest('a ', 'List[note(a:null)]');
    myTest('  a   ', 'List[note(a:null)]');
    myTest(' a a    a  ', 'List[note(a:null) note(a:null) note(a:null)]');
    myTest('', 'List[]');
    myTest('   ', 'List[]');
  });

  // group('numbers', () {
  //   myTest('0', ['0']);
  //   myTest('123', ['123']);
  // });
}
