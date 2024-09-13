import 'dart:io';
import 'package:cases_app/cores/helper/common_functions.dart';
import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/custom_buttons.dart';
import 'package:cases_app/cores/widgets/custom_dropdown.dart';
import 'package:cases_app/cores/widgets/custom_textfields.dart';
import 'package:cases_app/features/bottom_nav_bar/bottomnavbar_view.dart';
import 'package:cases_app/features/signup/signup_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileSetupView extends StatefulWidget {
  const ProfileSetupView({super.key});

  @override
  State<ProfileSetupView> createState() => _ProfileSetupViewState();
}

class _ProfileSetupViewState extends State<ProfileSetupView> {
  List<String> genderOptions = ["Male", "Female", "Others"];
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer<SignUpProvider>(
        builder: (context, signup, child) => SafeArea(
          child: Stack(
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
                        SizedBox(height: MySize.size15),
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: MySize.size60),
                                AppLocalizations.of(context)!
                                    .profieSetup
                                    .text
                                    .color(ThemeColors.black)
                                    .textStyle(GoogleFonts.openSans())
                                    .fontWeight(FontWeight.w500)
                                    .size(MySize.size17)
                                    .align(TextAlign.center)
                                    .makeCentered(),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.size30),
                        GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (image != null) {
                              setState(() {
                                signup.profileImage = File(image.path);
                              });
                            }
                          },
                          child: Container(
                            height: MySize.size110,
                            width: MySize.size110,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ThemeColors.testGrey),
                              image: signup.profileImage != null
                                  ? DecorationImage(
                                      image: FileImage(signup.profileImage!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: signup.profileImage == null
                                ? Center(child: Image.asset(imgCamera))
                                : null,
                          ),
                        ),
                        SizedBox(height: MySize.size7),
                        AppLocalizations.of(context)!
                            .uploadPhoto
                            .text
                            .color(ThemeColors.grey2)
                            .textStyle(GoogleFonts.nunitoSans())
                            .fontWeight(FontWeight.w500)
                            .size(MySize.size10)
                            .align(TextAlign.center)
                            .makeCentered(),
                        SizedBox(height: MySize.size20),
                        Form(
                          key: signupKey,
                          child: Column(
                            children: [
                              CustomTextField14(
                                prefixIcon: Image.asset(imgProfile),
                                controller: signup.nameController,
                                hintText:
                                    AppLocalizations.of(context)!.yourFullName,
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
                              ),
                              SizedBox(height: MySize.size14),
                              CustomTextField14(
                                prefixIcon: Image.asset(imgEmail),
                                controller: signup.emailController,
                                hintText:
                                    AppLocalizations.of(context)!.emailAdress,
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
                              ),
                              SizedBox(height: MySize.size14),
                              CustomTextField14(
                                prefixIcon: Image.asset(imgGender),
                                controller: signup.genderController,
                                hintText: AppLocalizations.of(context)!.gender,
                                fillColor: ThemeColors.whiteColor,
                                readOnly: true,
                                textColor: ThemeColors.black,
                                hintTextColor: ThemeColors.black,
                                radius: MySize.size10,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return CommonFunctions.validateTextField(
                                      value, context);
                                },
                                sufixIcon: CustomDropdown(
                                    items: genderOptions,
                                    selectedValue: "male",
                                    onChanged: (value) {
                                      setState(() {
                                        signup.genderController.text =
                                            value ?? "";
                                      });
                                    }),
                              ),
                              SizedBox(height: MySize.size14),
                              CustomTextField14(
                                prefixIcon: Image.asset(imgKey),
                                hintText: AppLocalizations.of(context)!
                                    .createPassword,
                                controller: signup.passwordController,
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
                                obscureText: signup.passwordVisibbility,
                                sufixIcon: IconButton(
                                    onPressed: () {
                                      signup.togglePasswordVisibility(
                                          !signup.passwordVisibbility);
                                    },
                                    icon: signup.passwordVisibbility
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility)),
                              ),
                              SizedBox(height: MySize.size14),
                              AppLocalizations.of(context)!
                                  .minCharacters
                                  .text
                                  .color(ThemeColors.grey2)
                                  .textStyle(GoogleFonts.openSans())
                                  .fontWeight(FontWeight.w300)
                                  .size(MySize.size10)
                                  .align(TextAlign.center)
                                  .makeCentered(),
                              SizedBox(height: MySize.size14),
                              CustomTextField14(
                                prefixIcon: Image.asset(imgKey),
                                hintText: AppLocalizations.of(context)!
                                    .confirmPassword,
                                controller: signup.confirmPasswordController,
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
                                obscureText: signup.confirmPasswordVisibbility,
                                sufixIcon: IconButton(
                                    onPressed: () {
                                      signup.toggleConfirmPasswordVisibility(
                                          !signup.confirmPasswordVisibbility);
                                    },
                                    icon: signup.confirmPasswordVisibbility
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MySize.size25),
                        CustomButton8(
                          text: AppLocalizations.of(context)!.continuee,
                          onPressed: () {
                            if (signupKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavBarView()));
                            }
                          },
                          backgroundColor: ThemeColors.mainColor,
                          textColor: ThemeColors.whiteColor,
                          radius: MySize.size10,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
