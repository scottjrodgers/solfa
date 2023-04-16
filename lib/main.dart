import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ide/editor.dart';
import 'ide/line_view.dart';
import 'ide/midi_widget.dart';
import 'midi/midi_interface.dart';

void main() async {
  ThemeData themeData = ThemeData(
    fontFamily: fontFamily,
    primaryColor: foreground,
    scaffoldBackgroundColor: background,
  );

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: themeData,
    home: Scaffold(
      body: Provider(
        create: (_) => MidiInterface(),
        lazy: false,
        child: Row(children: const [
          Expanded(child: Editor()),
          MidiWidget(),
        ]),
      ),
    ),
  ));
}
