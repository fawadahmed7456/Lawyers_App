import 'dart:io';

import 'package:cases_app/cores/helper/common_functions.dart';
import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/custom_buttons.dart';
import 'package:cases_app/cores/widgets/custom_checkbox.dart';
import 'package:cases_app/cores/widgets/custom_textfields.dart';
import 'package:cases_app/features/login/login_provider.dart';
import 'package:cases_app/features/signup/signup_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer(
        builder: (context, LoginProvider login, child) => Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgSplash2), fit: BoxFit.fill)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                child: Column(
                  children: [
                    SizedBox(height: MySize.size130),
                    Container(
                      width: MySize.size300,
                      height: MySize.size90,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgLogo), fit: BoxFit.cover)),
                    ),
                    SizedBox(height: MySize.size45),
                    AppLocalizations.of(context)!
                        .welcomeToBack
                        .text
                        .color(ThemeColors.black)
                        .textStyle(GoogleFonts.openSans())
                        .fontWeight(FontWeight.w600)
                        .size(MySize.size16)
                        .makeCentered(),
                    SizedBox(height: MySize.size10),
                    AppLocalizations.of(context)!
                        .enterPhoneLogin
                        .text
                        .color(ThemeColors.testGrey)
                        .textStyle(GoogleFonts.openSans())
                        .fontWeight(FontWeight.w400)
                        .size(MySize.size12)
                        .makeCentered(),
                    SizedBox(height: MySize.size18),
                    Form(
                      key: loginKey,
                      child: Column(
                        children: [
                          CustomTextField14(
                              prefixIcon: Image.asset(imgPhone),
                              hintText:
                                  AppLocalizations.of(context)!.yourPhoneNumber,
                              fillColor: ThemeColors.whiteColor,
                              textColor: ThemeColors.black,
                              hintTextColor: ThemeColors.black,
                              radius: MySize.size10,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return CommonFunctions.validateTextField(
                                    value, context);
                              },
                              sufixIcon: Image.asset(imgCircularFlag)),
                          SizedBox(height: MySize.size15),
                          CustomTextField14(
                            prefixIcon: Image.asset(imgKey),
                            hintText:
                                AppLocalizations.of(context)!.enterYourPassword,
                            fillColor: ThemeColors.whiteColor,
                            textColor: ThemeColors.black,
                            hintTextColor: ThemeColors.black,
                            radius: MySize.size10,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return CommonFunctions.validateTextField(
                                  value, context);
                            },
                            obscureText: login.passwordVisibbility,
                            sufixIcon: IconButton(
                                onPressed: () {
                                  login.togglePasswordVisibility(
                                      !login.passwordVisibbility);
                                },
                                icon: login.passwordVisibbility
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.size5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CustomCheckbox(),
                            SizedBox(width: MySize.size10),
                            AppLocalizations.of(context)!
                                .rememberMe
                                .text
                                .color(ThemeColors.black)
                                .textStyle(GoogleFonts.nunitoSans())
                                .size(MySize.size10)
                                .make(),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()));
                          },
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: ThemeColors
                                      .testGrey, // Set the color here
                                  width: 1.0, // Set the width as needed
                                ),
                              ),
                            ),
                            child: AppLocalizations.of(context)!
                                .forgetpassword
                                .text
                                .color(ThemeColors.testGrey)
                                .textStyle(GoogleFonts.kanit())
                                .size(MySize.size10)
                                .make(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MySize.size5),
                    CustomButton8(
                      text: AppLocalizations.of(context)!.login,
                      onPressed: () {
                        if (loginKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView()));
                        }
                      },
                      backgroundColor: ThemeColors.mainColor,
                      textColor: ThemeColors.whiteColor,
                      radius: MySize.size10,
                    ),
                    SizedBox(height: MySize.size15),
                    AppLocalizations.of(context)!
                        .or
                        .text
                        .color(ThemeColors.testGrey)
                        .textStyle(GoogleFonts.openSans())
                        .fontWeight(FontWeight.w400)
                        .size(MySize.size12)
                        .makeCentered(),
                    SizedBox(height: MySize.size15),
                    Platform.isIOS
                        ? CustomSocialButton(
                            image: icApplelogo,
                            imageColor: ThemeColors.whiteColor,
                            text: AppLocalizations.of(context)!.loginwithapple,
                            onPressed: () {},
                            backgroundColor: ThemeColors.black,
                            textColor: ThemeColors.whiteColor,
                            radius: MySize.size10,
                          )
                        : CustomSocialButton(
                            image: icGoogleLogo,
                            text: AppLocalizations.of(context)!.loginwithgoogle,
                            onPressed: () {},
                            backgroundColor: ThemeColors.lightButtonBg,
                            textColor: ThemeColors.whiteColor,
                            radius: MySize.size10,
                          ),
                    SizedBox(height: MySize.size20),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MySize.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLocalizations.of(context)!
                        .dontHaveAccountCreate
                        .text
                        .color(ThemeColors.black)
                        .textStyle(GoogleFonts.openSans())
                        .fontWeight(FontWeight.w400)
                        .size(MySize.size10)
                        .make(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpView()));
                      },
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ThemeColors
                                  .primaryColor, // Set the color here
                              width: 1.0, // Set the width as needed
                            ),
                          ),
                        ),
                        child: AppLocalizations.of(context)!
                            .createAccount
                            .text
                            .color(ThemeColors.primaryColor)
                            .textStyle(GoogleFonts.kanit())
                            .size(MySize.size10)
                            .make(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
