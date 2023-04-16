// ignore_for_file: avoid_print

import 'solfa_lang.dart';
import 'language_objects.dart';
import 'built_ins.dart' as built_ins;

class SFInterpreter {
  final Environment globalEnv = Environment();
  final solfa = SolfaLang();

  SFInterpreter() {
    for (String key in built_ins.functions.keys) {
      BuiltInFunction fn = built_ins.functions[key]!;
      SFBuiltIn builtIn = SFBuiltIn(key, fn);
      globalEnv.def(key, builtIn);
    }
  }

  void evalString(String script) {
    ParseResult result = solfa.parse(script);
    dynamic value;
    for (var form in result.forms) {
      value = eval(form, globalEnv);
    }

    // eventually return this to display in IDE:
    print("> ${debugStr(value)}");
  }

  dynamic eval(dynamic obj, Environment env) {
    while (true) {
      if (obj is SFList) {
        SFList list = obj;
        if (list.size == 0) {
          return null;
        }
        dynamic fn = eval(list.first, env);
        SFSequence args = list.rest;
        obj = apply(fn, args, env);
        continue;
      }
      if (obj is SFSymbol) {
        dynamic value = env.get(obj.name);
        if (value == null) {
          print("Undefined Symbol ${obj.name}");
        }
        obj = value;
        continue;
      }
      return obj;
    }
  }

  dynamic apply(dynamic fn, SFSequence args, Environment env) {
    if (fn is SFBuiltIn) {
      return fn.func(args.elements, env);
    } else if (fn is SFFunc) {
      print("User-Defined Functions not yet implemented...");
      return null;
    }
  }
}
