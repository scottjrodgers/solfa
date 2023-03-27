import '../model/document.dart';

class IndentUnit {
  int _open = 0;
  int line = -1;
  int indent = -1;
  int elementCount = 0;
  bool firstLine = true;
  final String start;
  late String end;

  bool get isList => start == '(';
  int get open => _open;
  set open(int v) {
    _open = v;
    if (indent < 0) {
      indent = v + 2;
    }
  }

  IndentUnit(this.start, this.line, int col) {
    _open = col;
    switch (start) {
      case '(':
        end = ')';
        break;
      case '[':
        end = ']';
        break;
      case '{':
        end = '}';
        break;
      case '<':
        end = '>';
        break;
      default:
        assert(false);
    }
  }
}

const String openChars = '([{';
const String ws = ' \t';

class LispFormatter {
  Document doc;

  LispFormatter({required this.doc});

  int indent({required int line}) {
    List<IndentUnit> indents = [];
    for (int l = 0; l < line; l++) {
      bool whitespace = true;
      // print("line $l");
      for (int i = 0; i < doc.lines[l].length; i++) {
        String ch = doc.lines[l][i];
        if (indents.isNotEmpty && ch == indents.last.end) {
          // closing off a block
          indents.removeLast();
        } else {
          if (ws.contains(ch)) {
            // if the character is whitespace
            whitespace = true;
          } else if (whitespace || openChars.contains(ch)) {
            // non-whitespace
            whitespace = false;
            // set the indent level for elements within a block
            if (indents.isNotEmpty && indents.last.firstLine) {
              indents.last.elementCount++;
              if (indents.last.isList) {
                // for list
                if (indents.last.elementCount == 2) {
                  indents.last.indent = i;
                }
              } else {
                // for non-list blocks
                if (indents.last.elementCount == 1) {
                  indents.last.indent = i;
                }
              }
            }
            if (openChars.contains(ch)) {
              // case of an opening (, [, {, or <
              indents.add(IndentUnit(ch, l, i));
              whitespace = true;
            }
          }
        }
      }
      if (indents.isNotEmpty) {
        indents.last.firstLine = false;
      }
    }

    /// Maybe I need to start the current line (as passed in as parameter, line) after I
    /// process the preceding lines.  Because all I care about for the current line is where
    /// to put the first character.  After that I can continue.
    for (int i = 0; i < doc.lines[line].length; i++) {
      String ch = doc.lines[line][i];
      if (indents.isNotEmpty) {
        if (ch == indents.last.end) {
          return indents.last.open;
        } else if (!ws.contains(ch)) {
          return indents.last.indent;
        }
      }
    }
    return 0;
  }
}
