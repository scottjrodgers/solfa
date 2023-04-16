import 'package:flutter/foundation.dart';
import 'document.dart';

class DocumentProvider extends ChangeNotifier {
  Document doc = Document();

  Future<bool> openFile(String path) async {
    bool res = await doc.openFile(path);
    touch();
    return res;
  }

  void touch() {
    notifyListeners();
  }
}
