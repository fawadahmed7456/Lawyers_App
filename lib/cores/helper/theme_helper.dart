import 'package:flutter/material.dart';

class ThemeColors {
  static const mainColor = Color(0xff091E40);
  static const secondaryColor = Color(0xffB09176);
  static const lightButtonBg = Color(0xff9CB7E2);
  static const bluePrimary = Color(0xff0795FF);
  static const bgColor = Color(0xffFFFFFF);
  static const testGrey = Color(0xffACACB7);
  static const pageBgColor = Color(0xff1D1F2C);
  static const buttonBgDark = Color(0xff282A3A);
  static const primaryColor = Color(0xff091E40);
  static const whiteColor = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const grey = Color(0xff7A7F85);
  static const textGrey = Color(0xffACACB7);
  static const checkBoxGrey = Color(0xffCDD1E0);
  static const grey1 = Color(0xffD4CACA);
  static const grey2 = Color(0xff7A7F85);
  static const navBarGrey = Color(0xffD4CACA);
  static const grey4 = Color(0xFF393640);
  static const grey5 = Color(0xffEFF2F1);
  static const darkGrey = Color(0xFF363340);
  static const yellow = Color(0xFFF0A215);
  static const red = Color(0xFFEA0000);
  static const mainDark = Color.fromARGB(255, 3, 4, 88);
  static const fillColor = Color(0xFFF5F5F5);
}

class Palette {
  static const MaterialColor palette1 = MaterialColor(
    _palette1PrimaryValue,
    <int, Color>{
      50: Color(0xFFF1E0E0),
      100: Color(0xFFDCB3B3),
      200: Color(0xFFC58080),
      300: Color(0xFFAE4D4D),
      400: Color(0xFF9C2626),
      500: Color(_palette1PrimaryValue),
      600: Color(0xFF830000),
      700: Color(0xFF780000),
      800: Color(0xFF6E0000),
      900: Color(0xFF5B0000),
    },
  );

  static const int _palette1PrimaryValue = 0xFF8B0000;
}
