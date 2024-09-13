import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController securityController = TextEditingController();
  TextEditingController zipPostalCodeController = TextEditingController();
}
