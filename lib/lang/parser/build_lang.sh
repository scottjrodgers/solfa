#!/bin/bash
antlr4 -Dlanguage=Dart solfa.g4

echo "// ignore_for_file: file_names, constant_identifier_names, camel_case_types, prefer_function_declarations_over_variables, non_constant_identifier_names, no_leading_underscores_for_local_identifiers" > tmp
cat solfaParser.dart >> tmp
mv tmp solfaParser.dart

echo "// ignore_for_file: file_names, constant_identifier_names, camel_case_types, prefer_function_declarations_over_variables, non_constant_identifier_names, no_leading_underscores_for_local_identifiers" > tmp
cat solfaListener.dart >> tmp
mv tmp solfaListener.dart

echo "// ignore_for_file: file_names, constant_identifier_names, camel_case_types, prefer_function_declarations_over_variables, non_constant_identifier_names, no_leading_underscores_for_local_identifiers" > tmp
cat solfaLexer.dart >> tmp
mv tmp solfaLexer.dart

echo "// ignore_for_file: file_names, constant_identifier_names, camel_case_types, prefer_function_declarations_over_variables, non_constant_identifier_names, no_leading_underscores_for_local_identifiers" > tmp
cat solfaBaseListener.dart >> tmp
mv tmp solfaBaseListener.dart
