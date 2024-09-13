import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/custom_buttons.dart';
import 'package:cases_app/features/login/login_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgSplash2), fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: MySize.size100),
                Container(
                  width: MySize.size250,
                  height: MySize.size325,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(imgCourtLogo))),
                ),
                SizedBox(height: MySize.size45),
                AppLocalizations.of(context)!
                    .simplifyingLegal
                    .text
                    .color(ThemeColors.primaryColor)
                    .textStyle(GoogleFonts.openSans())
                    .fontWeight(FontWeight.w400)
                    .size(MySize.size22)
                    .makeCentered(),
                SizedBox(height: MySize.size20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size34),
                  child: AppLocalizations.of(context)!
                      .yourTrustedPartner
                      .text
                      .color(ThemeColors.testGrey)
                      .textStyle(GoogleFonts.openSans())
                      .fontWeight(FontWeight.w400)
                      .size(MySize.size13)
                      .makeCentered(),
                ),
                SizedBox(height: MySize.size50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                  child: CustomButton8(
                    text: AppLocalizations.of(context)!.createAccount,
                    onPressed: () {},
                    backgroundColor: ThemeColors.mainColor,
                    textColor: ThemeColors.whiteColor,
                    radius: MySize.size10,
                  ),
                ),
                SizedBox(height: MySize.size20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                  child: CustomButton8(
                    text: AppLocalizations.of(context)!.login,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                    backgroundColor: ThemeColors.lightButtonBg,
                    textColor: ThemeColors.whiteColor,
                    radius: MySize.size10,
                  ),
                ),
                SizedBox(height: MySize.size20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
