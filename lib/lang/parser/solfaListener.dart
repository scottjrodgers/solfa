// Generated from solfa.g4 by ANTLR 4.12.0
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'solfaParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [solfaParser].
abstract class solfaListener extends ParseTreeListener {
  /// Enter a parse tree produced by [solfaParser.script].
  /// [ctx] the parse tree
  void enterScript(ScriptContext ctx);
  /// Exit a parse tree produced by [solfaParser.script].
  /// [ctx] the parse tree
  void exitScript(ScriptContext ctx);

  /// Enter a parse tree produced by [solfaParser.form].
  /// [ctx] the parse tree
  void enterForm(FormContext ctx);
  /// Exit a parse tree produced by [solfaParser.form].
  /// [ctx] the parse tree
  void exitForm(FormContext ctx);

  /// Enter a parse tree produced by [solfaParser.forms].
  /// [ctx] the parse tree
  void enterForms(FormsContext ctx);
  /// Exit a parse tree produced by [solfaParser.forms].
  /// [ctx] the parse tree
  void exitForms(FormsContext ctx);

  /// Enter a parse tree produced by [solfaParser.list_].
  /// [ctx] the parse tree
  void enterList_(List_Context ctx);
  /// Exit a parse tree produced by [solfaParser.list_].
  /// [ctx] the parse tree
  void exitList_(List_Context ctx);

  /// Enter a parse tree produced by [solfaParser.sequence].
  /// [ctx] the parse tree
  void enterSequence(SequenceContext ctx);
  /// Exit a parse tree produced by [solfaParser.sequence].
  /// [ctx] the parse tree
  void exitSequence(SequenceContext ctx);

  /// Enter a parse tree produced by [solfaParser.concurrent].
  /// [ctx] the parse tree
  void enterConcurrent(ConcurrentContext ctx);
  /// Exit a parse tree produced by [solfaParser.concurrent].
  /// [ctx] the parse tree
  void exitConcurrent(ConcurrentContext ctx);

  /// Enter a parse tree produced by [solfaParser.squash].
  /// [ctx] the parse tree
  void enterSquash(SquashContext ctx);
  /// Exit a parse tree produced by [solfaParser.squash].
  /// [ctx] the parse tree
  void exitSquash(SquashContext ctx);

  /// Enter a parse tree produced by [solfaParser.squash_].
  /// [ctx] the parse tree
  void enterSquash_(Squash_Context ctx);
  /// Exit a parse tree produced by [solfaParser.squash_].
  /// [ctx] the parse tree
  void exitSquash_(Squash_Context ctx);

  /// Enter a parse tree produced by [solfaParser.literal].
  /// [ctx] the parse tree
  void enterLiteral(LiteralContext ctx);
  /// Exit a parse tree produced by [solfaParser.literal].
  /// [ctx] the parse tree
  void exitLiteral(LiteralContext ctx);

  /// Enter a parse tree produced by [solfaParser.duration].
  /// [ctx] the parse tree
  void enterDuration(DurationContext ctx);
  /// Exit a parse tree produced by [solfaParser.duration].
  /// [ctx] the parse tree
  void exitDuration(DurationContext ctx);

  /// Enter a parse tree produced by [solfaParser.number].
  /// [ctx] the parse tree
  void enterNumber(NumberContext ctx);
  /// Exit a parse tree produced by [solfaParser.number].
  /// [ctx] the parse tree
  void exitNumber(NumberContext ctx);

  /// Enter a parse tree produced by [solfaParser.int_].
  /// [ctx] the parse tree
  void enterInt_(Int_Context ctx);
  /// Exit a parse tree produced by [solfaParser.int_].
  /// [ctx] the parse tree
  void exitInt_(Int_Context ctx);

  /// Enter a parse tree produced by [solfaParser.float_].
  /// [ctx] the parse tree
  void enterFloat_(Float_Context ctx);
  /// Exit a parse tree produced by [solfaParser.float_].
  /// [ctx] the parse tree
  void exitFloat_(Float_Context ctx);

  /// Enter a parse tree produced by [solfaParser.symbol_like].
  /// [ctx] the parse tree
  void enterSymbol_like(Symbol_likeContext ctx);
  /// Exit a parse tree produced by [solfaParser.symbol_like].
  /// [ctx] the parse tree
  void exitSymbol_like(Symbol_likeContext ctx);
}