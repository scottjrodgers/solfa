import 'dart:math';
import 'package:collection/collection.dart';
import 'solfa_lang.dart';
import '../midi/midi_interface.dart';
import "musical_objects.dart";

part "built_in_player.dart";

Map<String, BuiltInFunction> functions = {
  'play': play,
  'instrument': instrument,
  '+': add,
  '-': sub,
  '*': mult,
  '/': divide,
  'div': div,
  'mod': mod,
  '<': lessThan,
  '=': equal,
  '>': greaterThan,
  'and': andStmt,
  'or': orStmt,
  'first': firstElement,
  'rest': restOfSequence,
  'len': lengthOf,
  'nth': nthElement,
  'conj': conjoin,
  'print': printWriter,
  'let': letStmt,
  'loop': loop,
  'recur': recur,
  'import': importFile,
};

BuiltInFunction lambda = (args, env) {
  assert(args.length > 1);
  List<dynamic> paramSymbols = args[0];
  List<dynamic> forms = args.sublist(1);
  List<String> paramList = [];
  for (var sym in paramSymbols) {
    paramList.add(sym.name);
  }
  return SFFunc(paramList, forms, environment: env);
};

bool isNumeric(dynamic obj) {
  return (obj is num || obj is int || obj is double);
}

num generalArithmetic(List<dynamic> args, num Function(num, num) op, num initial) {
  num result = initial;
  if (args.isNotEmpty) {
    assert(isNumeric(args[0]), "Arguments to math functions must be numeric");
    result = args[0] as num;
  }
  for (int i = 1; i < args.length; i++) {
    assert(isNumeric(args[i]), "Arguments to math functions must be numeric");
    num term = args[i] as num;
    result = op(result, term);
  }
  return result;
}

BuiltInFunction add = (args, env) => generalArithmetic(args, (a, b) => a + b, 0);
BuiltInFunction sub = (args, env) => generalArithmetic(args, (a, b) => a - b, 0);
BuiltInFunction mult = (args, env) => generalArithmetic(args, (a, b) => a * b, 1);
BuiltInFunction divide = (args, env) => generalArithmetic(args, (a, b) => a / b, 1);

BuiltInFunction div = (args, env) => generalArithmetic(args, (a, b) => a ~/ b, 1);
BuiltInFunction mod = (args, env) => generalArithmetic(args, (a, b) => a % b, 0);

BuiltInFunction lessThan = (args, env) {
  if (args.length < 2) {
    return false;
  }
  for (int i = 1; i < args.length; i++) {
    if (args[i - 1] >= args[i]) {
      return false;
    }
  }
  return true;
};

BuiltInFunction greaterThan = (args, env) {
  if (args.length < 2) {
    return false;
  }
  for (int i = 1; i < args.length; i++) {
    if (args[i - 1] <= args[i]) {
      return false;
    }
  }
  return true;
};

BuiltInFunction equal = (args, env) {
  if (args.isEmpty) {
    return false;
  }
  if (args.length == 1) {
    return true;
  }
  for (int i = 1; i < args.length; i++) {
    if (args[i - 1] != args[i]) {
      return false;
    }
  }
  return true;
};

BuiltInFunction andStmt = (args, env) {
  for (dynamic arg in args) {
    assert(arg is bool);
    if (!arg) {
      return false;
    }
  }
  return true;
};

BuiltInFunction orStmt = (args, env) {
  for (dynamic arg in args) {
    assert(arg is bool);
    if (arg) {
      return true;
    }
  }
  return false;
};

BuiltInFunction firstElement = (args, env) {
  assert(args.length == 1);
  assert(args[0] is SFSequence);
  return (args[0] as SFSequence).first;
};

BuiltInFunction restOfSequence = (args, env) {
  assert(args.length == 1);
  assert(args[0] is SFSequence);
  return (args[0] as SFSequence).rest;
};

BuiltInFunction nthElement = (args, env) {
  assert(args.length == 2);
  assert(args[1] is SFSequence);
  assert(args[0] is int);
  int n = args[0];
  return (args[1] as SFSequence).nth(n);
};

BuiltInFunction lengthOf = (args, env) {
  assert(args.length == 1);
  assert(args[0] is SFSequence);
  return (args[0] as SFSequence).size;
};

BuiltInFunction conjoin = (args, env) {
  //
};

BuiltInFunction printWriter = (args, env) {
  String out = "";
  bool isFirst = true;
  for (dynamic arg in args) {
    if (isFirst) {
      out = debugStr(arg);
    } else {
      out = "$out ${debugStr(arg)}";
    }
    isFirst = false;
  }
  // ignore: avoid_print
  print(out);
};

BuiltInFunction letStmt = (args, env) {
  //
};

BuiltInFunction loop = (args, env) {
  //
};

BuiltInFunction recur = (args, env) {
  //
};

BuiltInFunction importFile = (args, env) {
  //
};
