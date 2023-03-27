import 'package:flutter/material.dart';
import 'ide/editor.dart';
import 'ide/line_view.dart';

const sample = '''
(def fact
  (fn [x]
    (if
      (> x 0)
      (* x
        (fact
          (- x 1)
        )
      )
      1
    )
  )
)
(fact 5)
''';

void main() async {
  ThemeData themeData = ThemeData(
    fontFamily: fontFamily,
    primaryColor: foreground,
    scaffoldBackgroundColor: background,
  );

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: themeData,
    home: const Scaffold(
      body: Editor(),
    ),
  ));
}
