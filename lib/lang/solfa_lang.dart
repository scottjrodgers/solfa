import 'dart:io';
import 'dart:convert';
import 'language_objects.dart';
// import 'solfa_parser.dart';
// import 'package:petitparser/debug.dart';

void testWholeSong() async {
  String input = '';
  // String docPath = 'examples/silent_night.solfa';
  String docPath = 'examples/factorial.solfa';
  File f = File(docPath);
  input = await f.openRead().map(utf8.decode).join();
  // var definition = SolFaParser();
  // var parser = definition.build();
  //
  // var r1 = parser.parse(input);
  // // var r1 = trace(parser).parse(input);
  // if (r1 is Failure) {
  //   print(r1);
  // } else {
  //   List<dynamic> result = r1.value;
  //   print(debugStr(result));
  // }
}

void main() {
  testWholeSong();
  return;

  // var definition = SolFaParser();
  // var parser = definition.build(start: definition.cells);
  // var parser = definition.build();

  // String input = '';
  // input = '(1 2 3 a8b (abc_3 a95))';
  // input = 'c+4 b- a';
  // input = '[mi4 fa so2 la8 ti do1]';
  // input = '[1 2]';
  // input = '[do8 re mi4 fa4 so mi8 re do1]';
  // input = '[do8 re mi fa4. so4. la8 re mi do2.]';
  // input = 're4.';
  // input = 'fa2~4..';
  // input = '[do8 re mi fa4. so7 la8 re mi do2.]'; // error
  // input = 'mi4 so4 re';
  // input = '(mi4 so4 re) ';
  // input = '(play [[do8 re mi4 fa2] [so8 la8 re4 mi] do1])';

  // var r1 = progress(trace(parser)).parse(input);
  // var r1 = trace(parser).parse(input);
  // var r1 = parser.parse(input);
  // List<dynamic> result = r1.value;
  // print(debugStr(result));
}
