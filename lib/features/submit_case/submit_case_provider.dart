import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class SubmitCaseProvider with ChangeNotifier {
  TextEditingController caseTitleController = TextEditingController();
  TextEditingController filedDateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()));
  TextEditingController descriptionController = TextEditingController();
  List<bool> seltectedCategories1 = [true, false, false, false, false, false];
  String time = "";
  String selectedCategoryName = "Private";
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());

  void updateSeletectedCategories1(int index, bool value) {
    for (int i = 0; i < seltectedCategories1.length; i++) {
      seltectedCategories1[i] = false;
    }
    seltectedCategories1[index] = value;
    notifyListeners();
  }

  void setTime(String value) {
    time = value;
    notifyListeners();
  }

  void setDate(String value) {
    date = value;
    filedDateController.text = date;
    notifyListeners();
  }
}
