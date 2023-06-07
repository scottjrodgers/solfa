import 'dart:io';
import 'dart:convert';
import 'dart:math';

class Cursor {
  Cursor({this.line = 0, this.column = 0, this.anchorLine = 0, this.anchorColumn = 0});

  int line = 0;
  int column = 0;
  int anchorLine = 0;
  int anchorColumn = 0;

  List<int> get position => [line, column];
  List<int> get selection => [line, column, anchorLine, anchorColumn];

  Cursor copy() {
    return Cursor(line: line, column: column, anchorLine: anchorLine, anchorColumn: anchorColumn);
  }

  Cursor normalized() {
    Cursor res = copy();
    if (line > anchorLine || (line == anchorLine && column > anchorColumn)) {
      res.line = anchorLine;
      res.column = anchorColumn;
      res.anchorLine = line;
      res.anchorColumn = column;
      return res;
    }
    return res;
  }

  bool hasSelection() {
    return line != anchorLine || column != anchorColumn;
  }

  void reset() {
    anchorLine = line;
    anchorColumn = column;
  }
}

///
/// DOCUMENT CLASS
///
class Document {
  String docPath = '';
  List<String> lines = <String>[''];
  Cursor cursor = Cursor();

  // getters
  String get path => docPath;
  String get filename {
    if (docPath.contains('/')) {
      return docPath.substring(docPath.lastIndexOf('/') + 1);
    }
    return docPath;
  }

  bool get hasSelection =>
      (cursor.column != cursor.anchorColumn || cursor.line != cursor.anchorLine);

  // file-IO
  Future<bool> openFile(String path) async {
    lines = <String>[''];
    cursor = Cursor();
    docPath = path;
    File f = File(docPath);
    await f.openRead().map(utf8.decode).transform(const LineSplitter()).forEach((l) {
      insertText(l);
      insertNewLine();
    });
    moveCursorToStartOfDocument();
    return true;
  }

  Future<bool> saveFile({String? path}) async {
    File f = File(path ?? docPath);
    String content = '';

    int lastLine = 0;
    for (int i = lines.length - 1; i > 0; i--) {
      if (lines[i].isNotEmpty) {
        lastLine = i;
        break;
      }
    }

    for (int j = 0; j <= lastLine; j++) {
      String line = lines[j];
      content += '$line\n';
    }
    f.writeAsString(content);
    return true;
  }

  // cursor manipulation
  void _validateCursor(bool keepAnchor) {
    if (cursor.line >= lines.length) {
      cursor.line = lines.length - 1;
    }
    if (cursor.line < 0) cursor.line = 0;
    if (cursor.column > lines[cursor.line].length) {
      cursor.column = lines[cursor.line].length;
    }
    if (cursor.column < 0) cursor.column = 0;
    if (!keepAnchor) {
      cursor.anchorLine = cursor.line;
      cursor.anchorColumn = cursor.column;
    }
  }

  void moveCursor(int line, int column, {bool keepAnchor = false}) {
    cursor.line = line;
    cursor.column = column;
    _validateCursor(keepAnchor);
  }

  void moveCursorLeft({int count = 1, bool keepAnchor = false}) {
    cursor.column = cursor.column - count;
    if (cursor.column < 0) {
      if (cursor.line > 0) {
        moveCursorUp(keepAnchor: keepAnchor);
        moveCursorToEndOfLine(keepAnchor: keepAnchor);
      }
    }
    _validateCursor(keepAnchor);
  }

  void moveCursorRight({int count = 1, bool keepAnchor = false}) {
    cursor.column = cursor.column + count;
    if (cursor.column > lines[cursor.line].length) {
      if (cursor.line < lines.length - 1) {
        moveCursorDown(keepAnchor: keepAnchor);
        moveCursorToStartOfLine(keepAnchor: keepAnchor);
      }
    }
    _validateCursor(keepAnchor);
  }

  void moveCursorUp({int count = 1, bool keepAnchor = false}) {
    cursor.line = cursor.line - count;
    _validateCursor(keepAnchor);
  }

  void moveCursorDown({int count = 1, bool keepAnchor = false}) {
    cursor.line = cursor.line + count;
    if (cursor.line >= lines.length) {
      lines.add("");
    }
    _validateCursor(keepAnchor);
  }

  void moveCursorToStartOfLine({bool keepAnchor = false}) {
    cursor.column = 0;
    _validateCursor(keepAnchor);
  }

  void moveCursorToEndOfLine({bool keepAnchor = false}) {
    cursor.column = lines[cursor.line].length;
    _validateCursor(keepAnchor);
  }

  void moveCursorToStartOfDocument({bool keepAnchor = false}) {
    cursor.line = 0;
    cursor.column = 0;
    _validateCursor(keepAnchor);
  }

  void moveCursorToEndOfDocument({bool keepAnchor = false}) {
    cursor.line = lines.length - 1;
    cursor.column = lines[cursor.line].length;
    _validateCursor(keepAnchor);
  }

  // text manipulation

  /// insertText
  /// param: text - a string with no newline, or a single newline
  void insertText(String text) {
    deleteSelectedText();
    String l = lines[cursor.line];
    String left = l.substring(0, cursor.column);
    String right = l.substring(cursor.column);

    // handle new line
    if (text == '\n') {
      lines[cursor.line] = left;
      lines.insert(cursor.line + 1, right);
      moveCursorDown();
      moveCursorToStartOfLine();
      return;
    }

    lines[cursor.line] = left + text + right;
    moveCursorRight(count: text.length);
  }

  void pasteText(String text) {
    List<String> lines = text.split('\n');
    for (int i = 0; i < lines.length - 1; i++) {
      insertText(lines[i]);
      insertText("\n");
    }
    insertText(lines[lines.length - 1]);
  }

  void deleteText({int numberOfCharacters = 1}) {
    String l = lines[cursor.line];

    // handle join lines
    if (cursor.column >= l.length && cursor.line < lines.length - 1) {
      Cursor cur = cursor.copy();
      lines[cursor.line] += lines[cursor.line + 1];
      moveCursorDown();
      deleteLine();
      cursor = cur;
      return;
    }

    // handle erase entire line
    Cursor cur = cursor.normalized();
    if (lines.length > 1 && l.isEmpty) {
      lines.removeAt(cur.line);
      moveCursorUp();
      moveCursorToStartOfLine();
      return;
    } else {
      String left = l.substring(0, cur.column);
      String right = l.substring(min(l.length, cur.column + numberOfCharacters));
      cursor = cur;
      lines[cursor.line] = left + right;
    }
  }

  void backspace() {
    // Case 1: not column 0 - simply move left and deleteText()
    // Case 2: column 0 - if not line 0, combine this line and previous line
    // case 3: column 0, line 0 - do nothing

    if (cursor.column > 0) {
      moveCursorLeft();
      deleteText();
    } else {
      if (cursor.line > 0) {
        moveCursorUp();
        moveCursorToEndOfLine();
        deleteText();
      } else {
        // do nothing - there is nothing to the left to delete
      }
    }
  }

  /// ==================================================================
  /// Line manipulation
  /// ==================================================================
  void insertNewLine() {
    deleteSelectedText();
    insertText('\n');
  }

  void deleteLine({int numberOfLines = 1}) {
    for (int i = 0; i < numberOfLines; i++) {
      // moveCursorToStartOfLine();
      // deleteText(numberOfCharacters: lines[cursor.line].length);
      lines.removeAt(cursor.line);
    }
    _validateCursor(false);
  }

  /// ==================================================================
  /// Selection manipulation
  /// ==================================================================
  List<String> selectedLines() {
    List<String> res = <String>[];
    Cursor cur = cursor.normalized();
    if (cur.line == cur.anchorLine) {
      String sel = lines[cur.line].substring(cur.column, cur.anchorColumn);
      res.add(sel);
      return res;
    }

    res.add(lines[cur.line].substring(cur.column));
    for (int i = cur.line + 1; i < cur.anchorLine; i++) {
      res.add(lines[i]);
    }
    res.add(lines[cur.anchorLine].substring(0, cur.anchorColumn));
    return res;
  }

  String selectedText() {
    String selection = selectedLines().join('\n');
    if (cursor.anchorColumn == lines[cursor.anchorLine].length) {
      return "$selection\n";
    }
    return selection;
  }

  void deleteSelectedText() {
    if (!cursor.hasSelection()) {
      return;
    }

    Cursor cur = cursor.normalized();
    List<String> res = selectedLines();
    if (res.length == 1) {
      // print(cur.anchorColumn - cur.column);
      deleteText(numberOfCharacters: cur.anchorColumn - cur.column);
      clearSelection();
      return;
    }

    String l = lines[cur.line];
    String left = l.substring(0, cur.column);
    l = lines[cur.anchorLine];
    String right = l.substring(cur.anchorColumn);

    cursor = cur;
    lines[cur.line] = left + right;
    lines[cur.anchorLine] = lines[cur.anchorLine].substring(cur.anchorColumn);
    for (int i = 0; i < res.length - 1; i++) {
      lines.removeAt(cur.line + 1);
    }
    _validateCursor(false);
  }

  void clearSelection() {
    cursor.anchorLine = cursor.line;
    cursor.anchorColumn = cursor.column;
  }
}
