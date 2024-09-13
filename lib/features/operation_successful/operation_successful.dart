import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/custom_buttons.dart';
import 'package:cases_app/features/bottom_nav_bar/bottomnavbar_view.dart';
import 'package:cases_app/features/submit_case/submit_case_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

class OperationSuccessfullView extends StatefulWidget {
  const OperationSuccessfullView({super.key});

  @override
  State<OperationSuccessfullView> createState() =>
      _OperationSuccessfullViewState();
}

class _OperationSuccessfullViewState extends State<OperationSuccessfullView> {
  GlobalKey<FormState> caseSubmitKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer<SubmitCaseProvider>(
        builder: (context, submitCaseProvider, child) => Stack(
          children: [
            SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                  child: Center(
                    child: SizedBox(
                      width: MySize.size260,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MySize.size260,
                            height: MySize.size240,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imgOperationSuccessful))),
                          ),
                          SizedBox(height: MySize.size30),
                          AppLocalizations.of(context)!
                              .operationSuccessfull
                              .text
                              .color(ThemeColors.primaryColor)
                              .textStyle(GoogleFonts.openSans())
                              .fontWeight(FontWeight.w600)
                              .size(MySize.size17)
                              .align(TextAlign.center)
                              .makeCentered(),
                          SizedBox(height: MySize.size10),
                          AppLocalizations.of(context)!
                              .yourCasehasBeenSubmitted
                              .text
                              .color(ThemeColors.textGrey)
                              .textStyle(GoogleFonts.openSans())
                              .fontWeight(FontWeight.w400)
                              .size(MySize.size11)
                              .align(TextAlign.center)
                              .makeCentered(),
                        ],
                      ),
                    ),
                  )),
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding:
                    EdgeInsets.only(left: MySize.size20, right: MySize.size20),
                child: SizedBox(
                  width: MySize.screenWidth * 0.9,
                  child: CustomButton8(
                    text: AppLocalizations.of(context)!.backToHome,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavBarView()));
                    },
                    backgroundColor: ThemeColors.mainColor,
                    textColor: ThemeColors.whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
