// Generated from solfa.g4 by ANTLR 4.12.0
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'solfaListener.dart';
import 'solfaBaseListener.dart';
const int RULE_script = 0, RULE_form = 1, RULE_forms = 2, RULE_list_ = 3, 
          RULE_sequence = 4, RULE_concurrent = 5, RULE_squash = 6, RULE_squash_ = 7, 
          RULE_literal = 8, RULE_duration = 9, RULE_number = 10, RULE_int_ = 11, 
          RULE_float_ = 12, RULE_symbol_like = 13;
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
    'squash_', 'literal', 'duration', 'number', 'int_', 'float_', 'symbol_like'
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
      state = 31;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 32106) != 0)) {
        state = 28;
        form();
        state = 33;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 34;
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
      state = 41;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_T__5:
        enterOuterAlt(_localctx, 1);
        state = 36;
        squash();
        break;
      case TOKEN_STRING:
      case TOKEN_FLOAT:
      case TOKEN_INT:
      case TOKEN_NIL:
      case TOKEN_BOOLEAN:
      case TOKEN_SYMBOL_LIKE:
        enterOuterAlt(_localctx, 2);
        state = 37;
        literal();
        break;
      case TOKEN_T__0:
        enterOuterAlt(_localctx, 3);
        state = 38;
        list_();
        break;
      case TOKEN_T__2:
        enterOuterAlt(_localctx, 4);
        state = 39;
        sequence();
        break;
      case TOKEN_T__4:
        enterOuterAlt(_localctx, 5);
        state = 40;
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
      state = 46;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 32106) != 0)) {
        state = 43;
        form();
        state = 48;
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
      state = 49;
      match(TOKEN_T__0);
      state = 50;
      forms();
      state = 51;
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
      state = 53;
      match(TOKEN_T__2);
      state = 54;
      forms();
      state = 55;
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
      state = 57;
      match(TOKEN_T__4);
      state = 58;
      forms();
      state = 59;
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
      state = 65;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 3, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 61;
        squash_();
        state = 62;
        duration();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 64;
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
      state = 67;
      match(TOKEN_T__5);
      state = 68;
      forms();
      state = 69;
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
      state = 76;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_FLOAT:
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 71;
        number();
        break;
      case TOKEN_STRING:
        enterOuterAlt(_localctx, 2);
        state = 72;
        match(TOKEN_STRING);
        break;
      case TOKEN_NIL:
        enterOuterAlt(_localctx, 3);
        state = 73;
        match(TOKEN_NIL);
        break;
      case TOKEN_BOOLEAN:
        enterOuterAlt(_localctx, 4);
        state = 74;
        match(TOKEN_BOOLEAN);
        break;
      case TOKEN_SYMBOL_LIKE:
        enterOuterAlt(_localctx, 5);
        state = 75;
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

  DurationContext duration() {
    dynamic _localctx = DurationContext(context, state);
    enterRule(_localctx, 18, RULE_duration);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 78;
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
    enterRule(_localctx, 20, RULE_number);
    try {
      state = 82;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        enterOuterAlt(_localctx, 1);
        state = 80;
        int_();
        break;
      case TOKEN_FLOAT:
        enterOuterAlt(_localctx, 2);
        state = 81;
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
    enterRule(_localctx, 22, RULE_int_);
    try {
      enterOuterAlt(_localctx, 1);
      state = 84;
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
    enterRule(_localctx, 24, RULE_float_);
    try {
      enterOuterAlt(_localctx, 1);
      state = 86;
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
    enterRule(_localctx, 26, RULE_symbol_like);
    try {
      enterOuterAlt(_localctx, 1);
      state = 88;
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
      4,1,15,91,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,1,
      0,5,0,30,8,0,10,0,12,0,33,9,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,3,1,42,8,
      1,1,2,5,2,45,8,2,10,2,12,2,48,9,2,1,3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,
      1,5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,3,6,66,8,6,1,7,1,7,1,7,1,7,1,8,1,8,
      1,8,1,8,1,8,3,8,77,8,8,1,9,1,9,1,10,1,10,3,10,83,8,10,1,11,1,11,1,
      12,1,12,1,13,1,13,1,13,0,0,14,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
      0,1,2,0,9,9,11,11,88,0,31,1,0,0,0,2,41,1,0,0,0,4,46,1,0,0,0,6,49,1,
      0,0,0,8,53,1,0,0,0,10,57,1,0,0,0,12,65,1,0,0,0,14,67,1,0,0,0,16,76,
      1,0,0,0,18,78,1,0,0,0,20,82,1,0,0,0,22,84,1,0,0,0,24,86,1,0,0,0,26,
      88,1,0,0,0,28,30,3,2,1,0,29,28,1,0,0,0,30,33,1,0,0,0,31,29,1,0,0,0,
      31,32,1,0,0,0,32,34,1,0,0,0,33,31,1,0,0,0,34,35,5,0,0,1,35,1,1,0,0,
      0,36,42,3,12,6,0,37,42,3,16,8,0,38,42,3,6,3,0,39,42,3,8,4,0,40,42,
      3,10,5,0,41,36,1,0,0,0,41,37,1,0,0,0,41,38,1,0,0,0,41,39,1,0,0,0,41,
      40,1,0,0,0,42,3,1,0,0,0,43,45,3,2,1,0,44,43,1,0,0,0,45,48,1,0,0,0,
      46,44,1,0,0,0,46,47,1,0,0,0,47,5,1,0,0,0,48,46,1,0,0,0,49,50,5,1,0,
      0,50,51,3,4,2,0,51,52,5,2,0,0,52,7,1,0,0,0,53,54,5,3,0,0,54,55,3,4,
      2,0,55,56,5,4,0,0,56,9,1,0,0,0,57,58,5,5,0,0,58,59,3,4,2,0,59,60,5,
      4,0,0,60,11,1,0,0,0,61,62,3,14,7,0,62,63,3,18,9,0,63,66,1,0,0,0,64,
      66,3,14,7,0,65,61,1,0,0,0,65,64,1,0,0,0,66,13,1,0,0,0,67,68,5,6,0,
      0,68,69,3,4,2,0,69,70,5,7,0,0,70,15,1,0,0,0,71,77,3,20,10,0,72,77,
      5,8,0,0,73,77,5,12,0,0,74,77,5,13,0,0,75,77,3,26,13,0,76,71,1,0,0,
      0,76,72,1,0,0,0,76,73,1,0,0,0,76,74,1,0,0,0,76,75,1,0,0,0,77,17,1,
      0,0,0,78,79,7,0,0,0,79,19,1,0,0,0,80,83,3,22,11,0,81,83,3,24,12,0,
      82,80,1,0,0,0,82,81,1,0,0,0,83,21,1,0,0,0,84,85,5,11,0,0,85,23,1,0,
      0,0,86,87,5,10,0,0,87,25,1,0,0,0,88,89,5,14,0,0,89,27,1,0,0,0,6,31,
      41,46,65,76,82
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
  TerminalNode? STRING() => getToken(solfaParser.TOKEN_STRING, 0);
  TerminalNode? NIL() => getToken(solfaParser.TOKEN_NIL, 0);
  TerminalNode? BOOLEAN() => getToken(solfaParser.TOKEN_BOOLEAN, 0);
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

