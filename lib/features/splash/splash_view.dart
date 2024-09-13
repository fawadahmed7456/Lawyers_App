// ignore_for_file: deprecated_member_use

import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/setting_tile.dart';
import 'package:cases_app/features/language/language_provider.dart';
import 'package:cases_app/features/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingView()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: ThemeColors.primaryColor),
          ),
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgSplash1), fit: BoxFit.fill)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imgLogo,
                    height: MySize.size60, width: MySize.size200),
                AppLocalizations.of(context)!
                    .abdulLatif
                    .text
                    .color(ThemeColors.secondaryColor)
                    .textStyle(GoogleFonts.overpass())
                    .letterSpacing(1)
                    .fontWeight(FontWeight.w600)
                    .size(MySize.size20)
                    .makeCentered(),
                SizedBox(height: MySize.size5),
                AppLocalizations.of(context)!
                    .forLaw
                    .text
                    .color(ThemeColors.secondaryColor)
                    .textStyle(GoogleFonts.overpass())
                    .fontWeight(FontWeight.w400)
                    .size(MySize.size12)
                    .makeCentered(),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MySize.size100),
              Padding(
                padding: Spacing.horizontal(MySize.size32),
                child: InkWell(
                  onTap: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            height: MySize.size220,
                            width: MySize.size180,
                            decoration: BoxDecoration(
                                color: ThemeColors.bgColor,
                                borderRadius:
                                    BorderRadius.circular(MySize.size30)),
                            child: Consumer<AppLanguage>(
                              builder: (context, provider, child) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: MySize.size25,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .selectLanguage
                                            .toString(),
                                        style: TextStyle(
                                          color: ThemeColors.black,
                                          fontSize: MySize.size14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MySize.size10),
                                  InkWell(
                                    onTap: () {
                                      if (provider.groupValue == "English") {
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: AbsorbPointer(
                                      absorbing:
                                          provider.groupValue == "English",
                                      child: RadioListTile(
                                        value: "English",
                                        groupValue: provider.groupValue,
                                        title: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "English",
                                            style: TextStyle(
                                              color: ThemeColors.mainColor,
                                              fontSize: MySize.size12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        activeColor: ThemeColors.mainColor,
                                        onChanged: (value) async {
                                          provider.changeGroupValue(value!);
                                          provider.changeLanguage(
                                              const Locale('en'));
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (provider.groupValue == "Arabic") {
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: AbsorbPointer(
                                      absorbing:
                                          provider.groupValue == "Arabic",
                                      child: RadioListTile(
                                        value: "Arabic",
                                        groupValue: provider.groupValue,
                                        title: Text(
                                          "عربی",
                                          style: TextStyle(
                                            color: ThemeColors.mainColor,
                                            fontSize: MySize.size12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        activeColor: ThemeColors.mainColor,
                                        onChanged: (value) async {
                                          provider.changeGroupValue(value!);
                                          provider.changeLanguage(
                                              const Locale('ar'));

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  child: Consumer<AppLanguage>(
                    builder: (context, provider, child) => SettingTile(
                      icon: icGlobe,
                      title: AppLocalizations.of(context)!.language.toString(),
                      subtitle: provider.appLocal == const Locale('ar')
                          ? AppLocalizations.of(context)!.arabic.toString()
                          : AppLocalizations.of(context)!.english.toString(),
                      showBtn: false,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
