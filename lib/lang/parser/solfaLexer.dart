// ignore_for_file: file_names, constant_identifier_names, camel_case_types, prefer_function_declarations_over_variables, non_constant_identifier_names, no_leading_underscores_for_local_identifiers
// Generated from solfa.g4 by ANTLR 4.12.0
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';


class solfaLexer extends Lexer {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.12.0', RuntimeMetaData.VERSION);

  static final List<DFA> _decisionToDFA = List.generate(
        _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int
    TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, TOKEN_T__4 = 5, 
    TOKEN_T__5 = 6, TOKEN_T__6 = 7, TOKEN_STRING = 8, TOKEN_DOTTED = 9, 
    TOKEN_FLOAT = 10, TOKEN_INT = 11, TOKEN_NIL = 12, TOKEN_BOOLEAN = 13, 
    TOKEN_SYMBOL_LIKE = 14, TOKEN_TRASH = 15;
  @override
  final List<String> channelNames = [
    'DEFAULT_TOKEN_CHANNEL', 'HIDDEN'
  ];

  @override
  final List<String> modeNames = [
    'DEFAULT_MODE'
  ];

  @override
  final List<String> ruleNames = [
    'T__0', 'T__1', 'T__2', 'T__3', 'T__4', 'T__5', 'T__6', 'STRING', 'DOTTED', 
    'FLOAT', 'INT', 'NIL', 'BOOLEAN', 'SYMBOL_LIKE', 'TRASH', 'WS', 'COMMENT'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'('", "')'", "'['", "']'", "'&['", "'{'", "'}'", null, null, 
      null, null, "'nil'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, null, null, null, "STRING", "DOTTED", 
      "FLOAT", "INT", "NIL", "BOOLEAN", "SYMBOL_LIKE", "TRASH"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }


  solfaLexer(CharStream input) : super(input) {
    interpreter = LexerATNSimulator(_ATN, _decisionToDFA, _sharedContextCache, recog: this);
  }

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  String get grammarFileName => 'solfa.g4';

  @override
  ATN getATN() { return _ATN; }

  static const List<int> _serializedATN = [
      4,0,15,130,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,
      6,7,6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,
      13,2,14,7,14,2,15,7,15,2,16,7,16,1,0,1,0,1,1,1,1,1,2,1,2,1,3,1,3,1,
      4,1,4,1,4,1,5,1,5,1,6,1,6,1,7,1,7,1,7,1,7,5,7,55,8,7,10,7,12,7,58,
      9,7,1,7,1,7,1,8,4,8,63,8,8,11,8,12,8,64,1,8,4,8,68,8,8,11,8,12,8,69,
      1,9,3,9,73,8,9,1,9,4,9,76,8,9,11,9,12,9,77,1,9,1,9,4,9,82,8,9,11,9,
      12,9,83,1,10,3,10,87,8,10,1,10,4,10,90,8,10,11,10,12,10,91,1,11,1,
      11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,3,12,107,
      8,12,1,13,1,13,5,13,111,8,13,10,13,12,13,114,9,13,1,14,1,14,3,14,118,
      8,14,1,14,1,14,1,15,1,15,1,16,1,16,5,16,126,8,16,10,16,12,16,129,9,
      16,0,0,17,1,1,3,2,5,3,7,4,9,5,11,6,13,7,15,8,17,9,19,10,21,11,23,12,
      25,13,27,14,29,15,31,0,33,0,1,0,6,1,0,34,34,1,0,48,57,8,0,33,33,37,
      37,42,43,45,45,47,47,60,90,92,92,97,122,10,0,33,33,42,43,45,57,61,
      61,63,63,65,90,92,92,95,95,97,122,126,126,4,0,9,10,13,13,32,32,44,
      44,2,0,10,10,13,13,140,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,0,0,0,7,1,0,
      0,0,0,9,1,0,0,0,0,11,1,0,0,0,0,13,1,0,0,0,0,15,1,0,0,0,0,17,1,0,0,
      0,0,19,1,0,0,0,0,21,1,0,0,0,0,23,1,0,0,0,0,25,1,0,0,0,0,27,1,0,0,0,
      0,29,1,0,0,0,1,35,1,0,0,0,3,37,1,0,0,0,5,39,1,0,0,0,7,41,1,0,0,0,9,
      43,1,0,0,0,11,46,1,0,0,0,13,48,1,0,0,0,15,50,1,0,0,0,17,62,1,0,0,0,
      19,72,1,0,0,0,21,86,1,0,0,0,23,93,1,0,0,0,25,106,1,0,0,0,27,108,1,
      0,0,0,29,117,1,0,0,0,31,121,1,0,0,0,33,123,1,0,0,0,35,36,5,40,0,0,
      36,2,1,0,0,0,37,38,5,41,0,0,38,4,1,0,0,0,39,40,5,91,0,0,40,6,1,0,0,
      0,41,42,5,93,0,0,42,8,1,0,0,0,43,44,5,38,0,0,44,45,5,91,0,0,45,10,
      1,0,0,0,46,47,5,123,0,0,47,12,1,0,0,0,48,49,5,125,0,0,49,14,1,0,0,
      0,50,56,5,34,0,0,51,55,8,0,0,0,52,53,5,92,0,0,53,55,5,34,0,0,54,51,
      1,0,0,0,54,52,1,0,0,0,55,58,1,0,0,0,56,54,1,0,0,0,56,57,1,0,0,0,57,
      59,1,0,0,0,58,56,1,0,0,0,59,60,5,34,0,0,60,16,1,0,0,0,61,63,7,1,0,
      0,62,61,1,0,0,0,63,64,1,0,0,0,64,62,1,0,0,0,64,65,1,0,0,0,65,67,1,
      0,0,0,66,68,5,46,0,0,67,66,1,0,0,0,68,69,1,0,0,0,69,67,1,0,0,0,69,
      70,1,0,0,0,70,18,1,0,0,0,71,73,5,45,0,0,72,71,1,0,0,0,72,73,1,0,0,
      0,73,75,1,0,0,0,74,76,7,1,0,0,75,74,1,0,0,0,76,77,1,0,0,0,77,75,1,
      0,0,0,77,78,1,0,0,0,78,79,1,0,0,0,79,81,5,46,0,0,80,82,7,1,0,0,81,
      80,1,0,0,0,82,83,1,0,0,0,83,81,1,0,0,0,83,84,1,0,0,0,84,20,1,0,0,0,
      85,87,5,45,0,0,86,85,1,0,0,0,86,87,1,0,0,0,87,89,1,0,0,0,88,90,7,1,
      0,0,89,88,1,0,0,0,90,91,1,0,0,0,91,89,1,0,0,0,91,92,1,0,0,0,92,22,
      1,0,0,0,93,94,5,110,0,0,94,95,5,105,0,0,95,96,5,108,0,0,96,24,1,0,
      0,0,97,98,5,116,0,0,98,99,5,114,0,0,99,100,5,117,0,0,100,107,5,101,
      0,0,101,102,5,102,0,0,102,103,5,97,0,0,103,104,5,108,0,0,104,105,5,
      115,0,0,105,107,5,101,0,0,106,97,1,0,0,0,106,101,1,0,0,0,107,26,1,
      0,0,0,108,112,7,2,0,0,109,111,7,3,0,0,110,109,1,0,0,0,111,114,1,0,
      0,0,112,110,1,0,0,0,112,113,1,0,0,0,113,28,1,0,0,0,114,112,1,0,0,0,
      115,118,3,31,15,0,116,118,3,33,16,0,117,115,1,0,0,0,117,116,1,0,0,
      0,118,119,1,0,0,0,119,120,6,14,0,0,120,30,1,0,0,0,121,122,7,4,0,0,
      122,32,1,0,0,0,123,127,5,59,0,0,124,126,8,5,0,0,125,124,1,0,0,0,126,
      129,1,0,0,0,127,125,1,0,0,0,127,128,1,0,0,0,128,34,1,0,0,0,129,127,
      1,0,0,0,14,0,54,56,64,69,72,77,83,86,91,106,112,117,127,1,6,0,0
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}