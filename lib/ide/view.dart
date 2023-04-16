import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'document_provider.dart';
import 'line_view.dart';

class ViewLine extends StatelessWidget {
  const ViewLine({this.lineNumber = 0, this.text = '', super.key});

  final int lineNumber;
  final String text;

  @override
  Widget build(BuildContext context) {
    DocumentProvider doc = Provider.of<DocumentProvider>(context);
    LineView hl = Provider.of<LineView>(context);
    List<InlineSpan> spans = hl.run(text, lineNumber, doc.doc);

    final gutterStyle = TextStyle(fontFamily: 'FiraCode', fontSize: gutterFontSize, color: comment);
    double gutterWidth = getTextExtents(' ${doc.doc.lines.length} ', gutterStyle).width;

    return Stack(children: [
      Padding(
          padding: EdgeInsets.only(left: gutterWidth),
          child: RichText(text: TextSpan(children: spans), softWrap: true)),
      Container(
          width: gutterWidth,
          alignment: Alignment.centerRight,
          child: Text('${lineNumber + 1} ', style: gutterStyle)),
    ]);
  }
}

class View extends StatefulWidget {
  const View({super.key, this.path = ''});
  final String path;

  @override
  ViewState createState() => ViewState();
}

class ViewState extends State<View> {
  late ScrollController scroller;

  @override
  void initState() {
    scroller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DocumentProvider doc = Provider.of<DocumentProvider>(context);
    return ListView.builder(
        controller: scroller,
        itemCount: doc.doc.lines.length,
        itemBuilder: (BuildContext context, int index) {
          return ViewLine(lineNumber: index, text: doc.doc.lines[index]);
        });
  }
}
