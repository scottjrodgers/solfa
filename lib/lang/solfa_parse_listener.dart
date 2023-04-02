// import 'package:antlr4/antlr4.dart';
import 'package:stack/stack.dart';
import 'parser/solfaParser.dart';
import 'parser/solfaBaseListener.dart';
import 'language_objects.dart';

const showParseActions = false;

void debugAction(String type, String value) {
  if (showParseActions) {
    print("$type: $value");
  }
}

class SolfaParseListener extends solfaBaseListener {
  List<dynamic> formList = [];
  Stack<dynamic> sequenceStack = Stack<dynamic>();
  SFSequence? currentSequence;

  void add(dynamic value) {
    if (currentSequence != null) {
      currentSequence!.add(value);
    } else {
      formList.add(value);
    }
  }

  void startSeq(dynamic seq) {
    add(seq);
    if (currentSequence != null) {
      sequenceStack.push(currentSequence);
    }
    currentSequence = seq;
  }

  void closeSeq() {
    if (sequenceStack.isNotEmpty) {
      currentSequence = sequenceStack.pop();
    } else {
      currentSequence = null;
    }
  }

  @override
  void enterList_(List_Context ctx) {
    int? line, column;
    if (ctx.start != null) {
      line = ctx.start!.line;
      column = ctx.start!.charPositionInLine;
    }
    SFSequence newSequence = SFList(line: line, column: column);
    startSeq(newSequence);
    debugAction("list", "(");
  }

  @override
  void exitList_(List_Context ctx) {
    closeSeq();
    debugAction("list", ")");
  }

  @override
  void enterSequence(SequenceContext ctx) {
    int? line, column;
    if (ctx.start != null) {
      line = ctx.start!.line;
      column = ctx.start!.charPositionInLine;
    }
    SFSequence newSequence = SFSequence(line: line, column: column);
    startSeq(newSequence);
    debugAction("seq", "[");
  }

  @override
  void exitSequence(SequenceContext ctx) {
    closeSeq();
    debugAction("seq", "]");
  }

  @override
  void enterConcurrent(ConcurrentContext ctx) {
    int? line, column;
    if (ctx.start != null) {
      line = ctx.start!.line;
      column = ctx.start!.charPositionInLine;
    }
    SFConcurrent newSequence = SFConcurrent(line: line, column: column);
    startSeq(newSequence);
    debugAction("cc", "{");
  }

  @override
  void exitConcurrent(ConcurrentContext ctx) {
    closeSeq();
    debugAction("cc", "}");
  }

  @override
  void enterSquash(SquashContext ctx) {
    int? line, column;
    if (ctx.start != null) {
      line = ctx.start!.line;
      column = ctx.start!.charPositionInLine;
    }
    SFSequence newSequence = SFSquash(line: line, column: column);
    startSeq(newSequence);
  }

  @override
  void exitSquash(SquashContext ctx) {
    closeSeq();
  }

  @override
  void exitDuration(DurationContext ctx) {
    var intTerminal = ctx.INT();
    var dottedTerminal = ctx.DOTTED();
    SFSquash sq = currentSequence! as SFSquash;
    String dur = '';

    if (intTerminal != null) {
      dur = intTerminal.text!;
    } else if (dottedTerminal != null) {
      dur = dottedTerminal.text!;
    }
    sq.duration = dur;
    debugAction("dur", dur);
  }

  @override
  void exitInt_(Int_Context ctx) {
    int value = int.parse(ctx.INT()!.text!);
    debugAction("int", ctx.INT()!.text!);
    add(value);
  }

  @override
  void exitFloat_(Float_Context ctx) {
    double value = double.parse(ctx.FLOAT()!.text!);
    debugAction("float", ctx.FLOAT()!.text!);
    add(value);
  }

  @override
  void exitSymbol_like(Symbol_likeContext ctx) {
    String name = ctx.SYMBOL_LIKE()!.text!;
    debugAction("symbol-like", name);
    int? line, column;
    if (ctx.start != null) {
      line = ctx.start!.line;
      column = ctx.start!.charPositionInLine;
    }
    SFBase? obj = buildSymbolLike(name, line, column);
    if (obj != null) {
      add(obj);
    }
  }
}
