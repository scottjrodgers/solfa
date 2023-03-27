import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:clipboard/clipboard.dart';
import './line_view.dart';
import './lisp_formatter.dart';
import '../model/document_provider.dart';
import '../model/document.dart';

class EditorController extends StatefulWidget {
  final Widget child;

  const EditorController({required this.child, super.key});
  @override
  EditControllerState createState() => EditControllerState();
}

class EditControllerState extends State<EditorController> {
  late FocusNode focusNode;
  late KeyNamer keyNamer;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    keyNamer = KeyNamer();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!focusNode.hasFocus) {
      focusNode.requestFocus();
    }

    DocumentProvider doc = Provider.of<DocumentProvider>(context);
    Document d = doc.doc;
    // LispFormatter lf = LispFormatter(doc: d);
    // for (int i = 0; i < d.lines.length; i++) {
    //   int indent = lf.indent(line: i);
    //   String s = d.lines[i].trimLeft();
    //   for (int i = 0; i < indent; i++) {
    //     s = " $s";
    //   }
    //   // debugPrint("${d.lines[i]}   -- indent: $indent");
    //   debugPrint("$s   - indent: $indent");
    // }
    return GestureDetector(
      child: Focus(
          focusNode: focusNode,
          autofocus: true,
          onKey: (FocusNode node, RawKeyEvent event) {
            if (event.runtimeType.toString() == 'RawKeyDownEvent') {
              String? keyPress = keyNamer.map(event);
              if (keyPress != null) {
                handleKey(keyPress, doc);
                doc.touch();
              }
            }
            return KeyEventResult.handled;
          },
          child: widget.child),
      onTapDown: (TapDownDetails details) {
        Offset o = screenToCursor(context.findRenderObject(), details.globalPosition);
        d.moveCursor(o.dy.toInt(), o.dx.toInt());
        doc.touch();
      },
      onPanUpdate: (DragUpdateDetails details) {
        Offset o = screenToCursor(context.findRenderObject(), details.globalPosition);
        if (o.dx == -1 || o.dy == -1) return;
        d.moveCursor(o.dy.toInt(), o.dx.toInt(), keepAnchor: true);
        doc.touch();
      },
    );
  }

  void handleKey(String key, DocumentProvider doc) {
    Document d = doc.doc;
    LispFormatter lf = LispFormatter(doc: d);

    if (key.isEmpty) {
      return;
    }
    if (key.length == 1) {
      // printable character
      d.insertText(key);
    } else {
      switch (key) {
        case 'up':
          d.moveCursorUp(keepAnchor: false);
          break;
        case 'down':
          d.moveCursorDown(keepAnchor: false);
          break;
        case 'left':
          d.moveCursorLeft(keepAnchor: false);
          break;
        case 'right':
          d.moveCursorRight(keepAnchor: false);
          break;
        case 'shift-up':
          d.moveCursorUp(keepAnchor: true);
          break;
        case 'shift-down':
          d.moveCursorDown(keepAnchor: true);
          break;
        case 'shift-left':
          d.moveCursorLeft(keepAnchor: true);
          break;
        case 'shift-right':
          d.moveCursorRight(keepAnchor: true);
          break;
        case 'enter':
          d.deleteSelectedText();
          d.insertNewLine();
          break;
        case 'tab':
          // todo: need to handle tab special
          int line = d.cursor.line;
          int indent = lf.indent(line: line);
          String s = d.lines[line].trimLeft();
          for (int i = 0; i < indent; i++) {
            s = " $s";
          }
          d.lines[line] = s;
          break;
        case 'backspace':
          if (d.cursor.hasSelection()) {
            d.deleteSelectedText();
          } else {
            d.moveCursorLeft();
            d.deleteText();
          }
          break;
        case 'delete':
          if (d.cursor.hasSelection()) {
            d.deleteSelectedText();
          } else {
            d.deleteText();
          }
          break;
        case 'cmd-s':
          d.saveFile();
          break;
        case 'cmd-c':
          FlutterClipboard.copy(d.selectedText());
          break;
        case 'cmd-x':
          FlutterClipboard.copy(d.selectedText());
          d.deleteSelectedText();
          break;
        case 'cmd-v':
          FlutterClipboard.paste().then((value) {
            d.pasteText(value);
          });
          break;
        case 'ctrl-a':
          d.moveCursorToStartOfLine();
          break;
        case 'ctrl-e':
          d.moveCursorToEndOfLine();
          break;
        case 'ctrl-d':
          d.deleteText();
          break;
      }
      doc.touch();
    }
  }
}

class KeyNamer {
  final Map<int, String> nameMap = {};
  final Set<int> ignoreKeys = {};
  KeyNamer() {
    nameMap[LogicalKeyboardKey.arrowDown.keyId] = 'down';
    nameMap[LogicalKeyboardKey.arrowUp.keyId] = 'up';
    nameMap[LogicalKeyboardKey.arrowLeft.keyId] = 'left';
    nameMap[LogicalKeyboardKey.arrowRight.keyId] = 'right';
    nameMap[LogicalKeyboardKey.home.keyId] = 'home';
    nameMap[LogicalKeyboardKey.end.keyId] = 'end';
    nameMap[LogicalKeyboardKey.tab.keyId] = 'tab';
    nameMap[LogicalKeyboardKey.enter.keyId] = 'enter';
    nameMap[LogicalKeyboardKey.delete.keyId] = 'delete';
    nameMap[LogicalKeyboardKey.backspace.keyId] = 'backspace';
    nameMap[LogicalKeyboardKey.pageUp.keyId] = 'pageUp';
    nameMap[LogicalKeyboardKey.pageDown.keyId] = 'pageDown';
    nameMap[LogicalKeyboardKey.insert.keyId] = 'insert';
    nameMap[LogicalKeyboardKey.f1.keyId] = 'f1';
    nameMap[LogicalKeyboardKey.f2.keyId] = 'f2';
    nameMap[LogicalKeyboardKey.f3.keyId] = 'f3';
    nameMap[LogicalKeyboardKey.f4.keyId] = 'f4';
    nameMap[LogicalKeyboardKey.f5.keyId] = 'f5';
    nameMap[LogicalKeyboardKey.f6.keyId] = 'f6';
    nameMap[LogicalKeyboardKey.f7.keyId] = 'f7';
    nameMap[LogicalKeyboardKey.f8.keyId] = 'f8';
    nameMap[LogicalKeyboardKey.f9.keyId] = 'f9';
    nameMap[LogicalKeyboardKey.f10.keyId] = 'f10';
    nameMap[LogicalKeyboardKey.f11.keyId] = 'f11';
    nameMap[LogicalKeyboardKey.f12.keyId] = 'f12';
    nameMap[LogicalKeyboardKey.escape.keyId] = 'esc';

    ignoreKeys.add(LogicalKeyboardKey.shiftLeft.keyId);
    ignoreKeys.add(LogicalKeyboardKey.shiftRight.keyId);
    ignoreKeys.add(LogicalKeyboardKey.controlLeft.keyId);
    ignoreKeys.add(LogicalKeyboardKey.controlRight.keyId);
    ignoreKeys.add(LogicalKeyboardKey.altLeft.keyId);
    ignoreKeys.add(LogicalKeyboardKey.altRight.keyId);
    ignoreKeys.add(LogicalKeyboardKey.metaLeft.keyId);
    ignoreKeys.add(LogicalKeyboardKey.metaRight.keyId);
    ignoreKeys.add(LogicalKeyboardKey.capsLock.keyId);
  }

  String? map(RawKeyEvent event) {
    LogicalKeyboardKey key = event.logicalKey;
    String keyName = '';
    bool shift = event.isShiftPressed;
    bool control = event.isControlPressed;
    bool option = event.isAltPressed;
    bool command = event.isMetaPressed;
    if (key.keyId >= LogicalKeyboardKey.space.keyId &&
        key.keyId <= LogicalKeyboardKey.tilde.keyId) {
      keyName = key.keyLabel;
      if (event.isShiftPressed) {
        if (key.keyId >= LogicalKeyboardKey.digit0.keyId &&
            key.keyId <= LogicalKeyboardKey.digit9.keyId) {
          // digits
          switch (keyName) {
            case '1':
              keyName = '!';
              break;
            case '2':
              keyName = '@';
              break;
            case '3':
              keyName = '#';
              break;
            case '4':
              keyName = '\$';
              break;
            case '5':
              keyName = '%';
              break;
            case '6':
              keyName = '^';
              break;
            case '7':
              keyName = '&';
              break;
            case '8':
              keyName = '*';
              break;
            case '9':
              keyName = '(';
              break;
            case '0':
              keyName = ')';
              break;
          } // switch
        } // if digit
      } else {
        // letters
        if (key.keyId >= LogicalKeyboardKey.keyA.keyId &&
            key.keyId <= LogicalKeyboardKey.keyZ.keyId) {
          keyName = keyName.toLowerCase();
        }
      }
      shift = false;
    } else {
      if (nameMap.containsKey(key.keyId)) {
        keyName = nameMap[key.keyId]!;
      } else {
        if (!ignoreKeys.contains(key.keyId)) {
          debugPrint("Missing Key: $key");
        }
      }
    }
    if (command) {
      keyName = 'cmd-$keyName';
    }
    if (option) {
      keyName = 'opt-$keyName';
    }
    if (control) {
      keyName = 'ctrl-$keyName';
    }
    if (shift) {
      keyName = 'shift-$keyName';
    }
    debugPrint("Key Pressed: '$keyName'");
    return keyName;
  }
}

// This is a newline

Offset screenToCursor(RenderObject? obj, Offset pos) {
  List<RenderParagraph> pars = <RenderParagraph>[];
  findRenderParagraphs(obj, pars);

  RenderParagraph? targetPar;
  int line = -1;

  for (final par in pars) {
    Rect bounds = const Offset(0, 0) & par.size;
    Offset offsetForCaret =
        par.localToGlobal(par.getOffsetForCaret(const TextPosition(offset: 0), bounds));
    Rect parBounds = offsetForCaret & Size(par.size.width * 10, par.size.height);
    if (parBounds.inflate(2).contains(pos)) {
      targetPar = par;
      break;
    }
  }

  if (targetPar == null) return const Offset(-1, -1);

  Rect bounds = const Offset(0, 0) & targetPar.size;
  List<InlineSpan> children = (targetPar.text as TextSpan).children ?? <InlineSpan>[];
  Size fontCharSize = const Size(0, 0);
  int textOffset = 0;
  bool found = false;
  for (var span in children) {
    if (found) break;
    if (span is! TextSpan) {
      continue;
    }

    if (fontCharSize.width == 0) {
      fontCharSize = getTextExtents(' ', span.style ?? const TextStyle());
    }

    String txt = (span).text ?? '';
    for (int i = 0; i < txt.length; i++) {
      Offset offsetForCaret = targetPar
          .localToGlobal(targetPar.getOffsetForCaret(TextPosition(offset: textOffset), bounds));
      Rect charBounds = offsetForCaret & fontCharSize;
      if (charBounds.inflate(2).contains(Offset(pos.dx + 1, pos.dy + 1))) {
        found = true;
        break;
      }
      textOffset++;
    }
  }

  if (children.isNotEmpty && children.last is CustomWidgetSpan) {
    line = (children.last as CustomWidgetSpan).line;
  }

  return Offset(textOffset.toDouble(), line.toDouble());
}

void findRenderParagraphs(RenderObject? obj, List<RenderParagraph> res) {
  if (obj is RenderParagraph) {
    res.add(obj);
    return;
  }
  obj?.visitChildren((child) {
    findRenderParagraphs(child, res);
  });
}
