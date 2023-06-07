// ignore_for_file: file_names, constant_identifier_names, camel_case_types, prefer_function_declarations_over_variables, non_constant_identifier_names, no_leading_underscores_for_local_identifiers
// Generated from solfa.g4 by ANTLR 4.12.0
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'solfaListener.dart';
import 'solfaBaseListener.dart';
const int RULE_script = 0, RULE_form = 1, RULE_forms = 2, RULE_list_ = 3, 
          RULE_sequence = 4, RULE_concurrent = 5, RULE_squash = 6, RULE_squash_ = 7, 
          RULE_literal = 8, RULE_repeats = 9, RULE_variations = 10, RULE_a_variation = 11, 
          RULE_string = 12, RULE_nil = 13, RULE_boolean = 14, RULE_duration = 15, 
          RULE_number = 16, RULE_int_ = 17, RULE_float_ = 18, RULE_symbol_like = 19;
class solfaParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.12.0', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, 
                   TOKEN_T__4 = 5, TOKEN_T__5 = 6, TOKEN_T__6 = 7, TOKEN_T__7 = 8, 
                   TOKEN_T__8 = 9, TOKEN_STRING = 10, TOKEN_DOTTED = 11, 
                   TOKEN_FLOAT = 12, TOKEN_INT = 13, TOKEN_NIL = 14, TOKEN_BOOLEAN = 15, 
                   TOKEN_STAR = 16, TOKEN_COLON = 17, TOKEN_SYMBOL_LIKE = 18, 
                   TOKEN_TRASH = 19;

  @override
  final List<String> ruleNames = [
    'script', 'form', 'forms', 'list_', 'sequence', 'concurrent', 'squash', 
    'squash_', 'literal', 'repeats', 'variations', 'a_variation', 'string', 
    'nil', 'boolean', 'duration', 'number', 'int_', 'float_', 'symbol_like'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'('", "')'", "'['", "']'", "'&['", "'{'", "'}'", "','", "'-'", 
      null, null, null, null, "'nil'", null, "'*'", "':'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, null, null, null, null, null, "STRING", 
      "DOTTED", "FLOAT", "INT", "NIL", "BOOLEAN", "STAR", "COLON", "SYMBOL_LIKE", 
      "TRASH"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'solfa.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  solfaParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  ScriptContext script() {
    dynamic _localctx = ScriptContext(context, state);
    enterRule(_localctx, 0, RULE_script);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 43;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 521322) != 0)) {
        state = 40;
        form();
        state = 45;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 46;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FormContext form() {
    dynamic _localctx = FormContext(context, state);
    enterRule(_localctx, 2, RULE_form);
    try {
      state = 53;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__5:
        enterOuterAlt(_localctx, 1);
        state = 48;
        squash();
        break;
      case TOKEN_STRING:
      case TOKEN_FLOAT:
      case TOKEN_INT:
      case TOKEN_NIL:
      case TOKEN_BOOLEAN:
      case TOKEN_STAR:
      case TOKEN_COLON:
      case TOKEN_SYMBOL_LIKE:
        enterOuterAlt(_localctx, 2);
        state = 49;
        literal();
        break;
      case TOKEN_T__0:
        enterOuterAlt(_localctx, 3);
        state = 50;
        list_();
        break;
      case TOKEN_T__2:
        enterOuterAlt(_localctx, 4);
        state = 51;
        sequence();
        break;
      case TOKEN_T__4:
        enterOuterAlt(_localctx, 5);
        state = 52;
        concurrent();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  FormsContext forms() {
    dynamic _localctx = FormsContext(context, state);
    enterRule(_localctx, 4, RULE_forms);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 58;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 521322) != 0)) {
        state = 55;
        form();
        state = 60;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  List_Context list_() {
    dynamic _localctx = List_Context(context, state);
    enterRule(_localctx, 6, RULE_list_);
    try {
      enterOuterAlt(_localctx, 1);
      state = 61;
      match(TOKEN_T__0);
      state = 62;
      forms();
      state = 63;
      match(TOKEN_T__1);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SequenceContext sequence() {
    dynamic _localctx = SequenceContext(context, state);
    enterRule(_localctx, 8, RULE_sequence);
    try {
      enterOuterAlt(_localctx, 1);
      state = 65;
      match(TOKEN_T__2);
      state = 66;
      forms();
      state = 67;
      match(TOKEN_T__3);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ConcurrentContext concurrent() {
    dynamic _localctx = ConcurrentContext(context, state);
    enterRule(_localctx, 10, RULE_concurrent);
    try {
      enterOuterAlt(_localctx, 1);
      state = 69;
      match(TOKEN_T__4);
      state = 70;
      forms();
      state = 71;
      match(TOKEN_T__3);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SquashContext squash() {
    dynamic _localctx = SquashContext(context, state);
    enterRule(_localctx, 12, RULE_squash);
    try {
      state = 77;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 3, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 73;
        squash_();
        state = 74;
        duration();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 76;
        squash_();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Squash_Context squash_() {
    dynamic _localctx = Squash_Context(context, state);
    enterRule(_localctx, 14, RULE_squash_);
    try {
      enterOuterAlt(_localctx, 1);
      state = 79;
      match(TOKEN_T__5);
      state = 80;
      forms();
      state = 81;
      match(TOKEN_T__6);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LiteralContext literal() {
    dynamic _localctx = LiteralContext(context, state);
    enterRule(_localctx, 16, RULE_literal);
    try {
      state = 90;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_STAR:
        enterOuterAlt(_localctx, 1);
        state = 83;
        repeats();
        break;
      case TOKEN_COLON:
        enterOuterAlt(_localctx, 2);
        state = 84;
        variations();
        break;
      case TOKEN_FLOAT:
      case TOKEN_INT:
        enterOuterAlt(_localctx, 3);
        state = 85;
        number();
        break;
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 4);
        state = 86;
        string();
        break;
      case TOKEN_NIL:
        enterOuterAlt(_localctx, 5);
        state = 87;
        nil();
        break;
      case TOKEN_BOOLEAN:
        enterOuterAlt(_localctx, 6);
        state = 88;
        boolean();
        break;
      case TOKEN_SYMBOL_LIKE:
        enterOuterAlt(_localctx, 7);
        state = 89;
        symbol_like();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  RepeatsContext repeats() {
    dynamic _localctx = RepeatsContext(context, state);
    enterRule(_localctx, 18, RULE_repeats);
    try {
      enterOuterAlt(_localctx, 1);
      state = 92;
      match(TOKEN_STAR);
      state = 93;
      match(TOKEN_INT);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  VariationsContext variations() {
    dynamic _localctx = VariationsContext(context, state);
    enterRule(_localctx, 20, RULE_variations);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 95;
      match(TOKEN_COLON);
      state = 96;
      a_variation();
      state = 101;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_T__7) {
        state = 97;
        match(TOKEN_T__7);
        state = 98;
        a_variation();
        state = 103;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  A_variationContext a_variation() {
    dynamic _localctx = A_variationContext(context, state);
    enterRule(_localctx, 22, RULE_a_variation);
    try {
      state = 108;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 6, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 104;
        match(TOKEN_INT);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 105;
        match(TOKEN_INT);
        state = 106;
        match(TOKEN_T__8);
        state = 107;
        match(TOKEN_INT);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  StringContext string() {
    dynamic _localctx = StringContext(context, state);
    enterRule(_localctx, 24, RULE_string);
    try {
      enterOuterAlt(_localctx, 1);
      state = 110;
      match(TOKEN_STRING);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  NilContext nil() {
    dynamic _localctx = NilContext(context, state);
    enterRule(_localctx, 26, RULE_nil);
    try {
      enterOuterAlt(_localctx, 1);
      state = 112;
      match(TOKEN_NIL);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BooleanContext boolean() {
    dynamic _localctx = BooleanContext(context, state);
    enterRule(_localctx, 28, RULE_boolean);
    try {
      enterOuterAlt(_localctx, 1);
      state = 114;
      match(TOKEN_BOOLEAN);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DurationContext duration() {
    dynamic _localctx = DurationContext(context, state);
    enterRule(_localctx, 30, RULE_duration);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 116;
      _la = tokenStream.LA(1)!;
      if (!(_la == TOKEN_DOTTED || _la == TOKEN_INT)) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  NumberContext number() {
    dynamic _localctx = NumberContext(context, state);
    enterRule(_localctx, 32, RULE_number);
    try {
      state = 120;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 118;
        int_();
        break;
      case TOKEN_FLOAT:
        enterOuterAlt(_localctx, 2);
        state = 119;
        float_();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Int_Context int_() {
    dynamic _localctx = Int_Context(context, state);
    enterRule(_localctx, 34, RULE_int_);
    try {
      enterOuterAlt(_localctx, 1);
      state = 122;
      match(TOKEN_INT);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Float_Context float_() {
    dynamic _localctx = Float_Context(context, state);
    enterRule(_localctx, 36, RULE_float_);
    try {
      enterOuterAlt(_localctx, 1);
      state = 124;
      match(TOKEN_FLOAT);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Symbol_likeContext symbol_like() {
    dynamic _localctx = Symbol_likeContext(context, state);
    enterRule(_localctx, 38, RULE_symbol_like);
    try {
      enterOuterAlt(_localctx, 1);
      state = 126;
      match(TOKEN_SYMBOL_LIKE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  static const List<int> _serializedATN = [
      4,1,19,129,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,1,0,5,0,
      42,8,0,10,0,12,0,45,9,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,3,1,54,8,1,1,2,
      5,2,57,8,2,10,2,12,2,60,9,2,1,3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,5,1,
      5,1,5,1,5,1,6,1,6,1,6,1,6,3,6,78,8,6,1,7,1,7,1,7,1,7,1,8,1,8,1,8,1,
      8,1,8,1,8,1,8,3,8,91,8,8,1,9,1,9,1,9,1,10,1,10,1,10,1,10,5,10,100,
      8,10,10,10,12,10,103,9,10,1,11,1,11,1,11,1,11,3,11,109,8,11,1,12,1,
      12,1,13,1,13,1,14,1,14,1,15,1,15,1,16,1,16,3,16,121,8,16,1,17,1,17,
      1,18,1,18,1,19,1,19,1,19,0,0,20,0,2,4,6,8,10,12,14,16,18,20,22,24,
      26,28,30,32,34,36,38,0,1,2,0,11,11,13,13,124,0,43,1,0,0,0,2,53,1,0,
      0,0,4,58,1,0,0,0,6,61,1,0,0,0,8,65,1,0,0,0,10,69,1,0,0,0,12,77,1,0,
      0,0,14,79,1,0,0,0,16,90,1,0,0,0,18,92,1,0,0,0,20,95,1,0,0,0,22,108,
      1,0,0,0,24,110,1,0,0,0,26,112,1,0,0,0,28,114,1,0,0,0,30,116,1,0,0,
      0,32,120,1,0,0,0,34,122,1,0,0,0,36,124,1,0,0,0,38,126,1,0,0,0,40,42,
      3,2,1,0,41,40,1,0,0,0,42,45,1,0,0,0,43,41,1,0,0,0,43,44,1,0,0,0,44,
      46,1,0,0,0,45,43,1,0,0,0,46,47,5,0,0,1,47,1,1,0,0,0,48,54,3,12,6,0,
      49,54,3,16,8,0,50,54,3,6,3,0,51,54,3,8,4,0,52,54,3,10,5,0,53,48,1,
      0,0,0,53,49,1,0,0,0,53,50,1,0,0,0,53,51,1,0,0,0,53,52,1,0,0,0,54,3,
      1,0,0,0,55,57,3,2,1,0,56,55,1,0,0,0,57,60,1,0,0,0,58,56,1,0,0,0,58,
      59,1,0,0,0,59,5,1,0,0,0,60,58,1,0,0,0,61,62,5,1,0,0,62,63,3,4,2,0,
      63,64,5,2,0,0,64,7,1,0,0,0,65,66,5,3,0,0,66,67,3,4,2,0,67,68,5,4,0,
      0,68,9,1,0,0,0,69,70,5,5,0,0,70,71,3,4,2,0,71,72,5,4,0,0,72,11,1,0,
      0,0,73,74,3,14,7,0,74,75,3,30,15,0,75,78,1,0,0,0,76,78,3,14,7,0,77,
      73,1,0,0,0,77,76,1,0,0,0,78,13,1,0,0,0,79,80,5,6,0,0,80,81,3,4,2,0,
      81,82,5,7,0,0,82,15,1,0,0,0,83,91,3,18,9,0,84,91,3,20,10,0,85,91,3,
      32,16,0,86,91,3,24,12,0,87,91,3,26,13,0,88,91,3,28,14,0,89,91,3,38,
      19,0,90,83,1,0,0,0,90,84,1,0,0,0,90,85,1,0,0,0,90,86,1,0,0,0,90,87,
      1,0,0,0,90,88,1,0,0,0,90,89,1,0,0,0,91,17,1,0,0,0,92,93,5,16,0,0,93,
      94,5,13,0,0,94,19,1,0,0,0,95,96,5,17,0,0,96,101,3,22,11,0,97,98,5,
      8,0,0,98,100,3,22,11,0,99,97,1,0,0,0,100,103,1,0,0,0,101,99,1,0,0,
      0,101,102,1,0,0,0,102,21,1,0,0,0,103,101,1,0,0,0,104,109,5,13,0,0,
      105,106,5,13,0,0,106,107,5,9,0,0,107,109,5,13,0,0,108,104,1,0,0,0,
      108,105,1,0,0,0,109,23,1,0,0,0,110,111,5,10,0,0,111,25,1,0,0,0,112,
      113,5,14,0,0,113,27,1,0,0,0,114,115,5,15,0,0,115,29,1,0,0,0,116,117,
      7,0,0,0,117,31,1,0,0,0,118,121,3,34,17,0,119,121,3,36,18,0,120,118,
      1,0,0,0,120,119,1,0,0,0,121,33,1,0,0,0,122,123,5,13,0,0,123,35,1,0,
      0,0,124,125,5,12,0,0,125,37,1,0,0,0,126,127,5,18,0,0,127,39,1,0,0,
      0,8,43,53,58,77,90,101,108,120
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class ScriptContext extends ParserRuleContext {
  TerminalNode? EOF() => getToken(solfaParser.TOKEN_EOF, 0);
  List<FormContext> forms() => getRuleContexts<FormContext>();
  FormContext? form(int i) => getRuleContext<FormContext>(i);
  ScriptContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_script;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterScript(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitScript(this);
  }
}

class FormContext extends ParserRuleContext {
  SquashContext? squash() => getRuleContext<SquashContext>(0);
  LiteralContext? literal() => getRuleContext<LiteralContext>(0);
  List_Context? list_() => getRuleContext<List_Context>(0);
  SequenceContext? sequence() => getRuleContext<SequenceContext>(0);
  ConcurrentContext? concurrent() => getRuleContext<ConcurrentContext>(0);
  FormContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_form;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterForm(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitForm(this);
  }
}

class FormsContext extends ParserRuleContext {
  List<FormContext> forms() => getRuleContexts<FormContext>();
  FormContext? form(int i) => getRuleContext<FormContext>(i);
  FormsContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_forms;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterForms(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitForms(this);
  }
}

class List_Context extends ParserRuleContext {
  FormsContext? forms() => getRuleContext<FormsContext>(0);
  List_Context([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_list_;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterList_(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitList_(this);
  }
}

class SequenceContext extends ParserRuleContext {
  FormsContext? forms() => getRuleContext<FormsContext>(0);
  SequenceContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_sequence;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterSequence(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitSequence(this);
  }
}

class ConcurrentContext extends ParserRuleContext {
  FormsContext? forms() => getRuleContext<FormsContext>(0);
  ConcurrentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_concurrent;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterConcurrent(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitConcurrent(this);
  }
}

class SquashContext extends ParserRuleContext {
  Squash_Context? squash_() => getRuleContext<Squash_Context>(0);
  DurationContext? duration() => getRuleContext<DurationContext>(0);
  SquashContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_squash;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterSquash(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitSquash(this);
  }
}

class Squash_Context extends ParserRuleContext {
  FormsContext? forms() => getRuleContext<FormsContext>(0);
  Squash_Context([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_squash_;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterSquash_(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitSquash_(this);
  }
}

class LiteralContext extends ParserRuleContext {
  RepeatsContext? repeats() => getRuleContext<RepeatsContext>(0);
  VariationsContext? variations() => getRuleContext<VariationsContext>(0);
  NumberContext? number() => getRuleContext<NumberContext>(0);
  StringContext? string() => getRuleContext<StringContext>(0);
  NilContext? nil() => getRuleContext<NilContext>(0);
  BooleanContext? boolean() => getRuleContext<BooleanContext>(0);
  Symbol_likeContext? symbol_like() => getRuleContext<Symbol_likeContext>(0);
  LiteralContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_literal;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterLiteral(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitLiteral(this);
  }
}

class RepeatsContext extends ParserRuleContext {
  TerminalNode? STAR() => getToken(solfaParser.TOKEN_STAR, 0);
  TerminalNode? INT() => getToken(solfaParser.TOKEN_INT, 0);
  RepeatsContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_repeats;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterRepeats(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitRepeats(this);
  }
}

class VariationsContext extends ParserRuleContext {
  TerminalNode? COLON() => getToken(solfaParser.TOKEN_COLON, 0);
  List<A_variationContext> a_variations() => getRuleContexts<A_variationContext>();
  A_variationContext? a_variation(int i) => getRuleContext<A_variationContext>(i);
  VariationsContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_variations;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterVariations(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitVariations(this);
  }
}

class A_variationContext extends ParserRuleContext {
  List<TerminalNode> INTs() => getTokens(solfaParser.TOKEN_INT);
  TerminalNode? INT(int i) => getToken(solfaParser.TOKEN_INT, i);
  A_variationContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_a_variation;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterA_variation(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitA_variation(this);
  }
}

class StringContext extends ParserRuleContext {
  TerminalNode? STRING() => getToken(solfaParser.TOKEN_STRING, 0);
  StringContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_string;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterString(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitString(this);
  }
}

class NilContext extends ParserRuleContext {
  TerminalNode? NIL() => getToken(solfaParser.TOKEN_NIL, 0);
  NilContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_nil;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterNil(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitNil(this);
  }
}

class BooleanContext extends ParserRuleContext {
  TerminalNode? BOOLEAN() => getToken(solfaParser.TOKEN_BOOLEAN, 0);
  BooleanContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_boolean;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterBoolean(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitBoolean(this);
  }
}

class DurationContext extends ParserRuleContext {
  TerminalNode? DOTTED() => getToken(solfaParser.TOKEN_DOTTED, 0);
  TerminalNode? INT() => getToken(solfaParser.TOKEN_INT, 0);
  DurationContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_duration;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterDuration(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitDuration(this);
  }
}

class NumberContext extends ParserRuleContext {
  Int_Context? int_() => getRuleContext<Int_Context>(0);
  Float_Context? float_() => getRuleContext<Float_Context>(0);
  NumberContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_number;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterNumber(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitNumber(this);
  }
}

class Int_Context extends ParserRuleContext {
  TerminalNode? INT() => getToken(solfaParser.TOKEN_INT, 0);
  Int_Context([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_int_;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterInt_(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitInt_(this);
  }
}

class Float_Context extends ParserRuleContext {
  TerminalNode? FLOAT() => getToken(solfaParser.TOKEN_FLOAT, 0);
  Float_Context([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_float_;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterFloat_(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitFloat_(this);
  }
}

class Symbol_likeContext extends ParserRuleContext {
  TerminalNode? SYMBOL_LIKE() => getToken(solfaParser.TOKEN_SYMBOL_LIKE, 0);
  Symbol_likeContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_symbol_like;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.enterSymbol_like(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is solfaListener) listener.exitSymbol_like(this);
  }
}

