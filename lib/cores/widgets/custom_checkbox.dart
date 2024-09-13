import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 20, // Set your desired width here
        height: 20, // Set your desired height here
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: ThemeColors.checkBoxGrey,
          ),
          borderRadius: BorderRadius.circular(4),
          color: isChecked ? ThemeColors.mainColor : Colors.transparent,
        ),
        child: isChecked
            ? const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 16, // Set your desired icon size here
              )
            : null,
      ),
    );
  }
}
