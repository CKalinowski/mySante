import 'package:flutter/foundation.dart';

class LangueChoose with ChangeNotifier {
  bool _isEnglish = false;

  bool get isEnglish => _isEnglish;

  void change() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }
}
