// ignore_for_file: file_names, constant_identifier_names, camel_case_types, prefer_function_declarations_over_variables, non_constant_identifier_names, no_leading_underscores_for_local_identifiers
// Generated from solfa.g4 by ANTLR 4.12.0
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'solfaListener.dart';
import 'solfaBaseListener.dart';
const int RULE_script = 0, RULE_form = 1, RULE_forms = 2, RULE_list_ = 3, 
          RULE_sequence = 4, RULE_concurrent = 5, RULE_squash = 6, RULE_squash_ = 7, 
          RULE_literal = 8, RULE_string = 9, RULE_nil = 10, RULE_boolean = 11, 
          RULE_duration = 12, RULE_number = 13, RULE_int_ = 14, RULE_float_ = 15, 
          RULE_symbol_like = 16;
class solfaParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.12.0', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, 
                   TOKEN_T__4 = 5, TOKEN_T__5 = 6, TOKEN_T__6 = 7, TOKEN_STRING = 8, 
                   TOKEN_DOTTED = 9, TOKEN_FLOAT = 10, TOKEN_INT = 11, TOKEN_NIL = 12, 
                   TOKEN_BOOLEAN = 13, TOKEN_SYMBOL_LIKE = 14, TOKEN_TRASH = 15;

  @override
  final List<String> ruleNames = [
    'script', 'form', 'forms', 'list_', 'sequence', 'concurrent', 'squash', 
    'squash_', 'literal', 'string', 'nil', 'boolean', 'duration', 'number', 
    'int_', 'float_', 'symbol_like'
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
      state = 37;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 32106) != 0)) {
        state = 34;
        form();
        state = 39;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 40;
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
      state = 47;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__5:
        enterOuterAlt(_localctx, 1);
        state = 42;
        squash();
        break;
      case TOKEN_STRING:
      case TOKEN_FLOAT:
      case TOKEN_INT:
      case TOKEN_NIL:
      case TOKEN_BOOLEAN:
      case TOKEN_SYMBOL_LIKE:
        enterOuterAlt(_localctx, 2);
        state = 43;
        literal();
        break;
      case TOKEN_T__0:
        enterOuterAlt(_localctx, 3);
        state = 44;
        list_();
        break;
      case TOKEN_T__2:
        enterOuterAlt(_localctx, 4);
        state = 45;
        sequence();
        break;
      case TOKEN_T__4:
        enterOuterAlt(_localctx, 5);
        state = 46;
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
      state = 52;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 32106) != 0)) {
        state = 49;
        form();
        state = 54;
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
      state = 55;
      match(TOKEN_T__0);
      state = 56;
      forms();
      state = 57;
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
      state = 59;
      match(TOKEN_T__2);
      state = 60;
      forms();
      state = 61;
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
      state = 63;
      match(TOKEN_T__4);
      state = 64;
      forms();
      state = 65;
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
      state = 71;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 3, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 67;
        squash_();
        state = 68;
        duration();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 70;
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
      state = 73;
      match(TOKEN_T__5);
      state = 74;
      forms();
      state = 75;
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
      state = 82;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_FLOAT:
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 77;
        number();
        break;
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 2);
        state = 78;
        string();
        break;
      case TOKEN_NIL:
        enterOuterAlt(_localctx, 3);
        state = 79;
        nil();
        break;
      case TOKEN_BOOLEAN:
        enterOuterAlt(_localctx, 4);
        state = 80;
        boolean();
        break;
      case TOKEN_SYMBOL_LIKE:
        enterOuterAlt(_localctx, 5);
        state = 81;
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

  StringContext string() {
    dynamic _localctx = StringContext(context, state);
    enterRule(_localctx, 18, RULE_string);
    try {
      enterOuterAlt(_localctx, 1);
      state = 84;
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
    enterRule(_localctx, 20, RULE_nil);
    try {
      enterOuterAlt(_localctx, 1);
      state = 86;
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
    enterRule(_localctx, 22, RULE_boolean);
    try {
      enterOuterAlt(_localctx, 1);
      state = 88;
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
    enterRule(_localctx, 24, RULE_duration);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 90;
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
    enterRule(_localctx, 26, RULE_number);
    try {
      state = 94;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 92;
        int_();
        break;
      case TOKEN_FLOAT:
        enterOuterAlt(_localctx, 2);
        state = 93;
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
    enterRule(_localctx, 28, RULE_int_);
    try {
      enterOuterAlt(_localctx, 1);
      state = 96;
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
    enterRule(_localctx, 30, RULE_float_);
    try {
      enterOuterAlt(_localctx, 1);
      state = 98;
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
    enterRule(_localctx, 32, RULE_symbol_like);
    try {
      enterOuterAlt(_localctx, 1);
      state = 100;
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
      4,1,15,103,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,1,0,5,0,36,8,0,10,0,12,0,39,9,0,1,0,1,
      0,1,1,1,1,1,1,1,1,1,1,3,1,48,8,1,1,2,5,2,51,8,2,10,2,12,2,54,9,2,1,
      3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,3,6,
      72,8,6,1,7,1,7,1,7,1,7,1,8,1,8,1,8,1,8,1,8,3,8,83,8,8,1,9,1,9,1,10,
      1,10,1,11,1,11,1,12,1,12,1,13,1,13,3,13,95,8,13,1,14,1,14,1,15,1,15,
      1,16,1,16,1,16,0,0,17,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,
      0,1,2,0,9,9,11,11,97,0,37,1,0,0,0,2,47,1,0,0,0,4,52,1,0,0,0,6,55,1,
      0,0,0,8,59,1,0,0,0,10,63,1,0,0,0,12,71,1,0,0,0,14,73,1,0,0,0,16,82,
      1,0,0,0,18,84,1,0,0,0,20,86,1,0,0,0,22,88,1,0,0,0,24,90,1,0,0,0,26,
      94,1,0,0,0,28,96,1,0,0,0,30,98,1,0,0,0,32,100,1,0,0,0,34,36,3,2,1,
      0,35,34,1,0,0,0,36,39,1,0,0,0,37,35,1,0,0,0,37,38,1,0,0,0,38,40,1,
      0,0,0,39,37,1,0,0,0,40,41,5,0,0,1,41,1,1,0,0,0,42,48,3,12,6,0,43,48,
      3,16,8,0,44,48,3,6,3,0,45,48,3,8,4,0,46,48,3,10,5,0,47,42,1,0,0,0,
      47,43,1,0,0,0,47,44,1,0,0,0,47,45,1,0,0,0,47,46,1,0,0,0,48,3,1,0,0,
      0,49,51,3,2,1,0,50,49,1,0,0,0,51,54,1,0,0,0,52,50,1,0,0,0,52,53,1,
      0,0,0,53,5,1,0,0,0,54,52,1,0,0,0,55,56,5,1,0,0,56,57,3,4,2,0,57,58,
      5,2,0,0,58,7,1,0,0,0,59,60,5,3,0,0,60,61,3,4,2,0,61,62,5,4,0,0,62,
      9,1,0,0,0,63,64,5,5,0,0,64,65,3,4,2,0,65,66,5,4,0,0,66,11,1,0,0,0,
      67,68,3,14,7,0,68,69,3,24,12,0,69,72,1,0,0,0,70,72,3,14,7,0,71,67,
      1,0,0,0,71,70,1,0,0,0,72,13,1,0,0,0,73,74,5,6,0,0,74,75,3,4,2,0,75,
      76,5,7,0,0,76,15,1,0,0,0,77,83,3,26,13,0,78,83,3,18,9,0,79,83,3,20,
      10,0,80,83,3,22,11,0,81,83,3,32,16,0,82,77,1,0,0,0,82,78,1,0,0,0,82,
      79,1,0,0,0,82,80,1,0,0,0,82,81,1,0,0,0,83,17,1,0,0,0,84,85,5,8,0,0,
      85,19,1,0,0,0,86,87,5,12,0,0,87,21,1,0,0,0,88,89,5,13,0,0,89,23,1,
      0,0,0,90,91,7,0,0,0,91,25,1,0,0,0,92,95,3,28,14,0,93,95,3,30,15,0,
      94,92,1,0,0,0,94,93,1,0,0,0,95,27,1,0,0,0,96,97,5,11,0,0,97,29,1,0,
      0,0,98,99,5,10,0,0,99,31,1,0,0,0,100,101,5,14,0,0,101,33,1,0,0,0,6,
      37,47,52,71,82,94
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

