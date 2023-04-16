// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

import '../midi/midi_interface.dart';
import 'view.dart';
import 'editor_controller.dart';
import 'line_view.dart';
import 'document_provider.dart';

class Editor extends StatefulWidget {
  const Editor({super.key, this.path = ''});
  final String path;
  @override
  EditorState createState() => EditorState();
}

class EditorState extends State<Editor> {
  late DocumentProvider doc;
  @override
  void initState() {
    doc = DocumentProvider();
    if (widget.path.isNotEmpty) {
      doc.openFile(widget.path);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MidiInterface midi = context.watch<MidiInterface>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => doc),
        Provider(create: (context) => LineView())
      ],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: (() {
                  print("Hit Midi button!");
                  midi.noteOn(dev: 0, ch: 1, note: 60, vel: 100);
                  sleep(const Duration(seconds: 1));
                  midi.noteOff(dev: 0, ch: 1, note: 60, vel: 50);
                  sleep(const Duration(milliseconds: 200));
                  midi.noteOn(dev: 1, ch: 1, note: 67, vel: 100);
                  sleep(const Duration(seconds: 1));
                  midi.noteOff(dev: 1, ch: 1, note: 67, vel: 50);
                }),
                child: const Text('Midi'),
              ),
              TextButton(
                onPressed: (() async {
                  // debugPrint("Load Pressed");
                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                  if (result != null) {
                    // File file = File(result.files.single.path!);
                    debugPrint("selected: ${result.files.single.path!}");
                    doc.openFile(result.files.single.path!);
                  } else {
                    // User canceled the picker
                  }
                }),
                child: const Text('Load'),
              ),
              TextButton(
                onPressed: (() async {
                  // debugPrint("Save Pressed");
                  String? filePath = await FilePicker.platform.saveFile(
                    dialogTitle: 'Save As...',
                    allowedExtensions: ['solfa'],
                    fileName: doc.doc.filename,
                  );
                  if (filePath != null) {
                    debugPrint("selected: $filePath");
                    doc.doc.saveFile(path: filePath);
                    doc.doc.docPath = filePath;
                  } else {
                    // User canceled the picker
                  }
                }),
                child: const Text('Save-As'),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
            child: Text(''),
          ),
          const Expanded(
            child: EditorController(
              child: View(),
            ),
          ),
        ],
      ),
    );
  }
}
