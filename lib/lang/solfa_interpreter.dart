import 'environment.dart';
import 'solfa_parser.dart';
import 'language_objects.dart';

class SFInterpreter {
  final Environment globalEnv = Environment();

  // TODO: should be some return value
  void evalString(String script) {}

  dynamic eval(dynamic obj, Environment env) {}

  dynamic apply(SFFunc fn, Environment env) {}
}
