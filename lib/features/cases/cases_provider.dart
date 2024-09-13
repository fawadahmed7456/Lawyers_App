import 'package:flutter/foundation.dart';

class CasesProvider with ChangeNotifier {
  int selectedIndex = 0;
  int downloadCategoryIndex = 0;

  void updateSelectedIndex(int val) {
    selectedIndex = val;
    notifyListeners();
  }

  void updateDownloadCategoryIndex(int val) {
    downloadCategoryIndex = val;
    notifyListeners();
  }
}
