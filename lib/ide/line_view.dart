import 'package:flutter/material.dart';
import 'dart:collection';

import 'document.dart';

double fontSize = 16;
double gutterFontSize = 16;

Size getTextExtents(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

String fontFamily = "DejaVuSansMono";
Color foreground = const Color(0xfff8f8f2);
Color background = const Color(0xff272822);
// Color background = const Color(0xff404040);
Color selection = const Color(0xff808080);
Color cursor = const Color(0xfff02020);
Color comment = const Color(0xff88846f);
Color function = const Color(0xff50fa7b);
Color keyword = const Color(0xffff79c6);
Color string = Colors.yellow;

class LineDecoration {
  int start = 0;
  int end = 0;
  Color color = Colors.white;
  Color background = Colors.white;
  bool underline = false;
  bool italic = false;
}

class CustomWidgetSpan extends WidgetSpan {
  final int line;
  const CustomWidgetSpan({required Widget child, this.line = 0}) : super(child: child);
}

class LineView {
  HashMap<String, Color> colorMap = HashMap<String, Color>();

  LineView() {
    colorMap.clear();
    colorMap['\\b(class|struct)\\b'] = function;
    colorMap['("|<){1}\\b(.*)\\b("|>){1}'] = string;
    // keywords and meta-keywords list is copied from flutter_highlight
    colorMap[
            '\\b(if|else|elif|endif|define|undef|warning|error|line|pragma|_Pragma|ifdef|ifndef|include)\\b'] =
        function;
    colorMap[
            '\\b(keyword|int|float|while|private|char|char8_t|char16_t|char32_t|catch|import|module|export|virtual|operator|sizeof|dynamic_cast|10|typedef|const_cast|10|const|for|static_cast|10|union|namespace|unsigned|long|volatile|static|protected|bool|template|mutable|if|public|friend|do|goto|auto|void|enum|else|break|extern|using|asm|case|typeid|wchar_tshort|reinterpret_cast|10|default|double|register|explicit|signed|typename|try|this|switch|continue|inline|delete|alignas|alignof|constexpr|consteval|constinit|decltype|concept|co_await|co_return|co_yield|requires|noexcept|static_assert|thread_local|restrict|final|override|atomic_bool|atomic_char|atomic_schar|atomic_uchar|atomic_short|atomic_ushort|atomic_int|atomic_uint|atomic_long|atomic_ulong|atomic_llong|atomic_ullong|new|throw|return|and|and_eq|bitand|bitor|compl|not|not_eq|or|or_eq|xor|xor_eq)\\b'] =
        keyword;
  }

  List<InlineSpan> run(String text, int line, Document document) {
    TextStyle defaultStyle =
        TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: foreground);
    List<InlineSpan> res = <InlineSpan>[];
    List<LineDecoration> decors = <LineDecoration>[];

    for (var exp in colorMap.keys) {
      RegExp regExp = RegExp(exp, caseSensitive: false, multiLine: false);
      var matches = regExp.allMatches(text);
      for (var m in matches) {
        if (m.start == m.end) continue;
        LineDecoration d = LineDecoration();
        d.start = m.start;
        d.end = m.end - 1;
        d.color = colorMap[exp] ?? foreground;
        decors.add(d);
      }
    }

    text += ' ';
    String prevText = '';
    for (int i = 0; i < text.length; i++) {
      String ch = text[i];
      TextStyle style = defaultStyle.copyWith();
      Cursor cur = document.cursor.normalized();

      // decorate
      for (var d in decors) {
        if (i >= d.start && i <= d.end) {
          style = style.copyWith(color: d.color);
        }
      }

      // is within selection
      if (cur.hasSelection()) {
        if (line < cur.line ||
            (line == cur.line && i < cur.column) ||
            line > cur.anchorLine ||
            (line == cur.anchorLine && i + 1 > cur.anchorColumn) ||
            i == text.length - 1) {
        } else {
          style = style.copyWith(backgroundColor: selection.withOpacity(0.5));
        }
      }

      if ((line == document.cursor.line && i == document.cursor.column)) {
        style = style.copyWith(backgroundColor: cursor.withOpacity(0.5));
      }

      // is within caret
      // if ((line == document.cursor.line && i == document.cursor.column)) {
      //   res.add(
      //     WidgetSpan(
      //       alignment: ui.PlaceholderAlignment.baseline,
      //       baseline: TextBaseline.alphabetic,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           backgroundBlendMode: BlendMode.overlay,
      //           border: const Border(
      //             // border: CursorBorder(
      //             left: BorderSide(width: 1.5, color: Colors.yellow),
      //             right: BorderSide(width: 1.5, color: Colors.yellow),
      //             top: BorderSide(width: 1.5, color: Colors.yellow),
      //             bottom: BorderSide(width: 1.5, color: Colors.yellow),
      //           ),
      //         ),
      //         child: Text(ch, style: style.copyWith(letterSpacing: -1)), // was -1.5
      //       ),
      //     ),
      //   );
      //   continue;
      // }

      if (res.isNotEmpty && res[res.length - 1] is! WidgetSpan) {
        TextSpan prev = res[res.length - 1] as TextSpan;
        if (prev.style == style) {
          prevText += ch;
          res[res.length - 1] = TextSpan(
              text: prevText, style: style, mouseCursor: MaterialStateMouseCursor.textable);
          continue;
        }
      }

      res.add(TextSpan(text: ch, style: style, mouseCursor: MaterialStateMouseCursor.textable));
      prevText = ch;
    }

    res.add(CustomWidgetSpan(child: const SizedBox(height: 1, width: 8), line: line));
    return res;
  }
}

class CursorBorder extends Border {
  const CursorBorder({
    super.top = BorderSide.none,
    super.right = BorderSide.none,
    super.bottom = BorderSide.none,
    super.left = BorderSide.none,
  });

  @override
  void paint(Canvas canvas, Rect rect,
      {TextDirection? textDirection,
      BoxShape shape = BoxShape.rectangle,
      BorderRadius? borderRadius}) {
    double x1 = rect.left + left.width * 0.9;
    double y1 = rect.bottom - bottom.width * 0.9;
    double x2 = rect.right - right.width * 0.7;
    double y2l = rect.bottom * 0.8 + rect.top * 0.2;
    double y2r = rect.bottom * 0.9 + rect.top * 0.9;
    canvas.drawLine(Offset(x1, y1), Offset(x1, y2l), left.toPaint());
    canvas.drawLine(Offset(x2, y1), Offset(x2, y2r), right.toPaint());
    canvas.drawLine(Offset(x1, y1), Offset(x2, y1), bottom.toPaint());
  }
}
