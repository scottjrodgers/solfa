// ignore_for_file: avoid_print, unused_local_variable

import "built_ins.dart" as built_ins;
import "solfa_reader.dart";
part "language_objects.dart";

class SFInterpreter {
  final Environment globalEnv = Environment();
  final solfa = SolfaReader();

  SFInterpreter() {
    for (String key in built_ins.functions.keys) {
      BuiltInFunction fn = built_ins.functions[key]!;
      SFBuiltIn builtIn = SFBuiltIn(key, fn, environment: globalEnv);
      globalEnv.def(key, builtIn);
    }
  }

  void evalString(String script) {
    ParseResult result = solfa.parse(script);
    print("debug: ${debugStr(result.forms)}");
    dynamic value;
    for (var form in result.forms) {
      value = eval(form, globalEnv);
    }

    // eventually return this to display in IDE:
    print("> ${debugStr(value)}");
  }
}

dynamic showEnv(Environment env) {
  env.dump();
  return null;
}

bool isSelfEvaluating(dynamic exp) {
  if (exp == null ||
      exp is int ||
      exp is double ||
      exp is num ||
      exp is String ||
      exp is SFSequence ||
      exp is SFBaseFunc ||
      exp is SFBaseNote ||
      exp is SFRest ||
      exp is SFOctave ||
      exp is SFOctaveChange) {
    return true;
  }
  return false;
}

bool isQuoted(dynamic exp) {
  return false;
}

bool isTruthy(dynamic exp) {
  return true;
}

dynamic evalAssignment(dynamic exp, Environment env) {
  // assignment:
  // first is a symbol, from which I'll take the name
  // second is a value
  // shouldn't be any additional arguments
  assert(exp is SFList, "Must be a list");
  assert(exp.size == 3, "Must have 2 arguments");
  assert(exp.rest.first is SFSymbol, "First argument must be a valid symbol");
  String name = exp.rest.first.name;
  dynamic value = eval(exp.rest.rest.first, env);
  env.set(name, value);
  return value;
}

dynamic evalDefinition(dynamic exp, Environment env) {
  // Definition:
  // first is a symbol, from which I'll take the name
  // second is a value
  // shouldn't be any additional arguments
  assert(exp is SFList, "Must be a list");
  assert(exp.size == 3, "Must have 2 arguments");
  assert(exp.nth(2) is SFSymbol, "First argument must be a valid symbol");
  String name = exp.nth(2).name;
  dynamic value = eval(exp.nth(3), env);
  env.def(name, value);
  return value;
}

dynamic evalDefFunction(dynamic exp, Environment env) {
  throw UnimplementedError("evalDefFunction not implemented");
}

dynamic evalIf(dynamic exp, Environment env) {
  // IF statement
  // arg 1 is the condition
  // arg 2 is the consequent (only evaluated if condition is true)
  // arg 3 is the alternative (only evaluated if condition is false)
  //       Arg 3 is also optional, taken to be null if not present.
  // IF returns the value of the evaluation of consequent or alternative;
  assert(exp is SFList, "Must be a list");
  assert(exp.size == 3 || exp.size == 4, "Must have 2 or 3 arguments");
  dynamic conditionExpr = exp.nth(2);
  dynamic consequentExpr = exp.nth(3);
  dynamic alternativeExpr;
  if (exp.size == 4) {
    alternativeExpr = exp.nth(4);
  }
  dynamic condition = eval(conditionExpr, env);
  assert(condition is bool, "Condition must evaluate to a boolean value");
  if (condition as bool) {
    return eval(consequentExpr, env);
  } else {
    return eval(alternativeExpr, env);
  }
}

dynamic evalLambda(dynamic exp, Environment env) {
  // Lambda / FN
  // arg 1 = sequence of parameters
  // arg 2+ = body of function
  assert(exp is SFList, "must be a list");
  assert(exp.size >= 3, "must have sequence of parameters and at least 1 body expression");
  assert(exp.nth(2) is SFSequence || exp.nth(3) is SFSequence,
      "argument 1 or 2 must be a sequence of parameters");
  String? name;
  late SFSequence parameterSeq;

  if (exp.nth(2) is SFSymbol) {
    name = (exp.nth(2) as SFSymbol).name;
    parameterSeq = exp.nth(3);
  } else {
    parameterSeq = exp.nth(2);
  }
  List<String> parameters = [];
  List<dynamic> forms = [];

  for (dynamic p in parameterSeq.elements) {
    assert(p is SFSymbol, "function parameters must be valid Symbols");
    parameters.add(p.name);
  }
  for (int i = 3; i <= exp.size; i++) {
    forms.add(exp.nth(i));
  }
  SFFunc fn = SFFunc(parameters, forms, environment: env);
  if (name != null) {
    fn.name = name;
  }
  return fn;
}

dynamic evalBegin(dynamic exp, Environment env) {
  // BEGIN - evaluates each of the arguments in sequence
  //         as a way of grouping a sequence of expressions
  // Returns the value of the final expression
  assert(exp is SFList, "must be a list");
  dynamic value;
  for (int i = 2; i <= exp.size; i++) {
    value = eval(exp.nth(i), env);
  }
  return value;
}

dynamic evalCond(dynamic exp, Environment env) {
  //
}

dynamic evalSequence(List<dynamic> forms, Environment env) {
  dynamic value;
  for (dynamic form in forms) {
    value = eval(form, env);
  }
  return value;
}

dynamic getOperator(dynamic exp) {
  return exp.first;
}

SFSequence getOperands(dynamic exp) {
  return exp.rest;
}

List<dynamic> listOfValues(SFSequence expressions, Environment env) {
  List<dynamic> values = [];
  for (dynamic obj in expressions.elements) {
    values.add(eval(obj, env));
  }
  return values;
}

dynamic eval(dynamic exp, Environment env) {
  if (exp is SFSymbol) {
    return env.get(exp.name);
  } else if (exp is SFList) {
    if (exp.size >= 0) {
      if (exp.first is SFSymbol) {
        String first = exp.first.name;
        switch (first) {
          case 'set!':
            return evalAssignment(exp, env);
          case 'def':
            return evalDefinition(exp, env);
          case 'if':
            return evalIf(exp, env);
          case 'cond':
            return evalCond(exp, env);
          case 'begin':
            return evalBegin(exp, env);
          case 'fn':
            return evalLambda(exp, env);
          case 'show-env':
            return showEnv(env);
          case 'apply':
            dynamic operator = eval(getOperator(exp.rest), env);
            return apply(operator, listOfValues(getOperands(exp.rest), env));
          default:
            dynamic operator = eval(exp.first, env);
            if (operator is SFBaseFunc) {
              return apply(operator, listOfValues(getOperands(exp), env));
            } else {
              assert(false, "ERROR: non-function first position of an expression");
            }
        }
      } else {
        dynamic operator = eval(exp.first, env);
        if (operator is SFBaseFunc) {
          return apply(operator, listOfValues(getOperands(exp), env));
        } else {
          print("ERROR: First item in list is not a symbol");
          assert(false);
        }
      }
    } else {
      return null;
    }
  } else if (!isSelfEvaluating(exp)) {
    print("ERROR: non-self-evaluating object remains: '${debugStr(exp)}'");
  }
  return exp;
}

dynamic apply(dynamic function, List<dynamic> arguments) {
  if (function is SFBaseFunc) {
    if (function is SFBuiltIn) {
      // built-in function
      return function.func(arguments, function.environment);
    } else {
      SFFunc userFunc = function as SFFunc;
      Environment newEnv = function.environment.extend();
      // define the parameters in new environment assigned to the provided arguments
      int nParams = userFunc.parameters.length;
      int nArguments = arguments.length;
      if (nParams == nArguments) {
        for (int i = 0; i < nParams; i++) {
          newEnv.def(userFunc.parameters[i], arguments[i]);
        }
      } else {
        print("Error: mismatching number of arguments vs. parameters");
        assert(false);
      }
      return evalSequence(function.forms, newEnv);
    }
  }
  print("Error, apply called with non-function in first position");
  assert(false);
  return null;
}
