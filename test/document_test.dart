import 'package:flutter_test/flutter_test.dart';
import 'package:solfa/model/document.dart';

void main() {
  Document initSimple() {
    Document doc = Document();
    doc.lines = ['abc', 'def', 'ghi', 'jkl'];
    return doc;
  }

  test('confirm initSimple', () {
    Document d = initSimple();
    expect(d.lines.length, 4);
    expect(d.lines[0], 'abc');
    expect(d.lines[1], 'def');
    expect(d.lines[2], 'ghi');
    expect(d.lines[3], 'jkl');
    expect(d.lines, ['abc', 'def', 'ghi', 'jkl']);
  });
  group('Delete and Backspace', () {
    test('delete in a line', () {
      Document d = initSimple();
      d.moveCursor(0, 2);
      d.deleteText();
      d.moveCursor(1, 1);
      d.deleteText();
      d.moveCursor(2, 0);
      d.deleteText();
      expect(d.lines, ['ab', 'df', 'hi', 'jkl']);
    });

    test('backspace on single, empty line', () {
      Document d = Document();
      d.backspace();
      expect(d.lines.length, 1);
      expect(d.lines[0].length, 0);
    });

    test('backspace at start of each line', () {
      Document d = initSimple();
      d.moveCursor(1, 0);
      d.backspace();
      d.moveCursor(1, 0);
      d.backspace();
      d.moveCursor(1, 0);
      d.backspace();
      expect(d.lines, ['abcdefghijkl']);
    });

    test('delete on single, empty line', () {
      Document d = Document();
      d.deleteText();
      expect(d.lines.length, 1);
      expect(d.lines[0].length, 0);
    });

    test('delete at end of each line', () {
      Document d = initSimple();
      d.moveCursor(2, 3);
      d.deleteText();
      d.moveCursor(1, 3);
      d.deleteText();
      d.moveCursor(0, 3);
      d.deleteText();
      expect(d.lines, ['abcdefghijkl']);
    });
  });

  group('MoveCursor', () {
    test('simple moveCursor', () {
      Document d = initSimple();
      d.moveCursor(1, 2);
      expect(d.cursor.line, 1);
      expect(d.cursor.column, 2);
      expect(d.cursor.position, [1, 2]);
    });

    test('moveCursor to column beyond EOL', () {
      Document d = initSimple();
      d.moveCursor(1, 4);
      expect(d.cursor.line, 1);
      expect(d.cursor.column, 3);
      expect(d.cursor.position, [1, 3]);
    });
    test('moveCursor to line beyond EOF', () {
      Document d = initSimple();
      d.moveCursor(10, 0);
      expect(d.cursor.line, 3);
      expect(d.cursor.column, 0);
      expect(d.cursor.position, [3, 0]);
    });
    test('moveCursor to negative column', () {
      Document d = initSimple();
      d.moveCursor(0, -1);
      expect(d.cursor.line, 0);
      expect(d.cursor.column, 0);
      expect(d.cursor.position, [0, 0]);
    });
    test('moveCursor to negative line', () {
      Document d = initSimple();
      d.moveCursor(-1, 1);
      expect(d.cursor.line, 0);
      expect(d.cursor.column, 1);
      expect(d.cursor.position, [0, 1]);
    });
  });
  group("Cursor Movement", () {
    test('move left at start of 2nd line', () {
      Document d = initSimple();
      d.moveCursor(1, 0);
      d.moveCursorLeft();
      expect(d.cursor.position, [0, 3]);
    });
    test('move left at end of 1st line', () {
      Document d = initSimple();
      d.moveCursor(0, 3);
      d.moveCursorLeft();
      expect(d.cursor.position, [0, 2]);
    });
    test('move left at start of 1st line', () {
      Document d = initSimple();
      d.moveCursor(0, 0);
      d.moveCursorLeft();
      expect(d.cursor.position, [0, 0]);
    });
    test('move left at start of 2nd line', () {
      Document d = initSimple();
      d.moveCursor(1, 0);
      d.moveCursorLeft();
      expect(d.cursor.position, [0, 3]);
    });
    test('move up from 2nd line', () {
      Document d = initSimple();
      d.moveCursor(1, 1);
      d.moveCursorUp();
      expect(d.cursor.position, [0, 1]);
    });
    test('move up from end of first line', () {
      Document d = initSimple();
      d.moveCursor(0, 3);
      d.moveCursorUp();
      expect(d.cursor.position, [0, 3]);
    });
    test('move down from first line', () {
      Document d = initSimple();
      d.moveCursor(0, 1);
      d.moveCursorDown();
      expect(d.cursor.position, [1, 1]);
    });
    test('move down from last line', () {
      Document d = initSimple();
      d.moveCursor(3, 1);
      d.moveCursorDown();
      expect(d.cursor.position, [3, 1]);
    });
    test('move right from start of first line', () {
      Document d = initSimple();
      d.moveCursor(0, 0);
      d.moveCursorRight();
      expect(d.cursor.position, [0, 1]);
    });
    test('move right from end of first line', () {
      Document d = initSimple();
      d.moveCursor(0, 3);
      d.moveCursorRight();
      expect(d.cursor.position, [1, 0]);
    });
    test('move right at end of last line', () {
      Document d = initSimple();
      d.moveCursor(3, 3);
      d.moveCursorRight();
      expect(d.cursor.position, [3, 3]);
    });
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
