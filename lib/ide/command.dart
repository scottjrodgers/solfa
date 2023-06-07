enum Cmd {
  insertText,
  killText,
  backspace,
  deleteNext,
  cutText,
  copyText,
  pasteText,
  moveUp,
  moveDown,
  moveLeft,
  moveRight,
  moveUpSelect,
  moveDownSelect,
  moveLeftSelect,
  moveRightSelect,
  moveToFileStart,
  moveToLineStart,
  moveToFileEnd,
  moveToLineEnd,
  pageUp,
  pageDown,
  evaluateBlock,
  newLine,
  tab,
}

class Command {
  int line;
  int col;
  int? line2;
  int? col2;
  String? text;
  Cmd cmd;

  Command(this.cmd, this.line, this.col);
  Command.ins(this.text, this.line, this.col) : cmd = Cmd.insertText;
  Command.del(this.text, this.line, this.col) : cmd = Cmd.insertText;
  Command.bs(this.text, this.line, this.col) : cmd = Cmd.insertText;
  Command.kill(this.line, this.col, this.line2, this.col2) : cmd = Cmd.killText;
  Command.cut(this.line, this.col, this.line2, this.col2) : cmd = Cmd.cutText;
  Command.copy(this.line, this.col, this.line2, this.col2) : cmd = Cmd.copyText;
  Command.paste(this.line, this.col) : cmd = Cmd.pasteText;
  Command.newline(this.line, this.col) : cmd = Cmd.newLine;
  Command.eval(this.line, this.col) : cmd = Cmd.evaluateBlock;
}
