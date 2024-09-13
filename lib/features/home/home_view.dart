import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/blinking_circle.dart';
import 'package:cases_app/cores/widgets/custom_buttons.dart';
import 'package:cases_app/features/home/home_provider.dart';
import 'package:cases_app/features/splash/splash_view.dart';
import 'package:cases_app/features/submit_case/submit_case_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    List<String> faqs = [
      AppLocalizations.of(context)!.howDoISubmitNewCase,
      AppLocalizations.of(context)!.whatTypeOfCases,
      AppLocalizations.of(context)!.howSecure,
      AppLocalizations.of(context)!.howLongDoesItTake,
      AppLocalizations.of(context)!.whatHappenWhenISubmit,
    ];
    List<List<String>> ansewersList = [
      [
        AppLocalizations.of(context)!.provideDetailedDescription,
        AppLocalizations.of(context)!.uploadRelevantDocuments,
        AppLocalizations.of(context)!.enterPaymentInformation,
        AppLocalizations.of(context)!.submitYourCase,
      ],
      [
        AppLocalizations.of(context)!.breachesOfAgreements,
        AppLocalizations.of(context)!.paymentIssues,
        AppLocalizations.of(context)!.misrepresentation,
        AppLocalizations.of(context)!.contractTermination,
        AppLocalizations.of(context)!.boundaryDisputes,
        AppLocalizations.of(context)!.landlordTenantIssues,
        AppLocalizations.of(context)!.realEstateTransactions,
        AppLocalizations.of(context)!.foreclosureDefense,
      ],
      [
        AppLocalizations.of(context)!.financialSecurity,
        AppLocalizations.of(context)!.encryptionProtocols,
        AppLocalizations.of(context)!.pciDssCompliant,
        AppLocalizations.of(context)!.securityAudits,
      ],
      [
        AppLocalizations.of(context)!.caseReviewTimeframe,
      ],
      [
        AppLocalizations.of(context)!.processingQueue,
        AppLocalizations.of(context)!.legalProfessionalReview,
        AppLocalizations.of(context)!.caseReviewTimeframe,
        AppLocalizations.of(context)!.reviewCompleteNotification,
      ],
    ];

    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: MySize.size60),
                            Expanded(
                              child: AppLocalizations.of(context)!
                                  .hiGoodMorning
                                  .text
                                  .size(MySize.size16)
                                  .color(ThemeColors.black)
                                  .textStyle(GoogleFonts.openSans())
                                  .fontWeight(FontWeight.w600)
                                  .make(),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SplashView()));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(MySize.size5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ThemeColors.navBarGrey
                                                  .withOpacity(0.09))),
                                      child: SvgPicture.asset(
                                        icBell,
                                        color: ThemeColors.black,
                                      )),
                                  // StreamBuilder<QuerySnapshot>(
                                  //     stream: FirebaseFirestore.instance
                                  //         .collection('notifications')
                                  //         .where("userId",
                                  //             isEqualTo: FirebaseAuth
                                  //                 .instance.currentUser!.uid)
                                  //         .where('userDeleteStatus',
                                  //             isEqualTo: false)
                                  //         .where('userReadStatus', isEqualTo: false)
                                  //         .snapshots(),
                                  //     builder: (context, snapshots) {
                                  //       if (snapshots.hasData) {
                                  //         if (snapshots.data!.docs.isNotEmpty) {
                                  //           return const BlinkingCircle(
                                  //               showCircle: true);
                                  //         }
                                  //       }
                                  //       return Container();
                                  //     })
                                  const BlinkingCircle(showCircle: true),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.size47),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLocalizations.of(context)!
                                    .aProfessionalLawFirm
                                    .text
                                    .size(MySize.size12)
                                    .color(ThemeColors.textGrey)
                                    .textStyle(GoogleFonts.openSans())
                                    .fontWeight(FontWeight.w400)
                                    .make(),
                                SizedBox(height: MySize.size5),
                                SizedBox(
                                  width: MySize.size200,
                                  child: AppLocalizations.of(context)!
                                      .getTheJustice
                                      .text
                                      .size(MySize.size20)
                                      .color(ThemeColors.black)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .letterSpacing(1.3)
                                      .make(),
                                ),
                              ],
                            ),
                            SizedBox(width: MySize.size18),
                            Column(
                              children: [
                                Container(
                                  width: MySize.size130,
                                  height: MySize.size105,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size6)),
                                      image: const DecorationImage(
                                          image: AssetImage(imgLawFirm),
                                          fit: BoxFit.fill)),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: MySize.size50),
                        SizedBox(
                          height: MySize.size46,
                          width: MySize.size186,
                          child: CustomButton8(
                            text: AppLocalizations.of(context)!.submitLawCase,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SubmitCaseView()));
                            },
                            backgroundColor: ThemeColors.mainColor,
                            textColor: ThemeColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: MySize.size50),
                        Column(children: [
                          AppLocalizations.of(context)!
                              .freuentlyAskedQuestions
                              .text
                              .size(MySize.size14)
                              .color(ThemeColors.black)
                              .textStyle(GoogleFonts.openSans())
                              .fontWeight(FontWeight.w600)
                              .make(),
                          SizedBox(height: MySize.size5),
                          AppLocalizations.of(context)!
                              .readyToHandleYourCase
                              .text
                              .size(MySize.size10)
                              .color(ThemeColors.textGrey)
                              .textStyle(GoogleFonts.openSans())
                              .fontWeight(FontWeight.w400)
                              .make(),
                        ]),
                        SizedBox(height: MySize.size13),
                        const Divider(
                            color: ThemeColors.navBarGrey, thickness: 0.7),
                        Column(
                            children: List.generate(
                                5,
                                (index) => GestureDetector(
                                      onTap: () {
                                        homeProvider.updateShowFAQsIndex(index,
                                            !homeProvider.showFAQs[index]);
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(height: MySize.size8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              faqs[index]
                                                  .text
                                                  .size(MySize.size12)
                                                  .color(ThemeColors.black)
                                                  .textStyle(
                                                      GoogleFonts.openSans())
                                                  .fontWeight(FontWeight.w400)
                                                  .make(),
                                              homeProvider.showFAQs[index] ==
                                                      true
                                                  ? const RotatedBox(
                                                      quarterTurns: 1,
                                                      child: Icon(
                                                        Icons.arrow_back_ios,
                                                        size: 15,
                                                      ))
                                                  : const RotatedBox(
                                                      quarterTurns: 3,
                                                      child: Icon(
                                                        Icons.arrow_back_ios,
                                                        size: 15,
                                                      ))
                                            ],
                                          ),
                                          SizedBox(height: MySize.size8),
                                          if (homeProvider.showFAQs[index])
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                  ansewersList[index].length,
                                                  (answerIndex) =>
                                                      "${answerIndex + 1}. ${ansewersList[index][answerIndex]}"
                                                          .text
                                                          .size(MySize.size11)
                                                          .color(ThemeColors
                                                              .textGrey)
                                                          .textStyle(GoogleFonts
                                                              .openSans())
                                                          .fontWeight(
                                                              FontWeight.w400)
                                                          .make(),
                                                )),
                                          const Divider(
                                              color: ThemeColors.navBarGrey,
                                              thickness: 0.7),
                                        ],
                                      ),
                                    ))),
                        SizedBox(height: MySize.size5),
                        SizedBox(height: MySize.size5),
                        SizedBox(height: MySize.size5),
                        SizedBox(height: MySize.size5),
                        SizedBox(height: MySize.size5),
                        SizedBox(height: MySize.size5),
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
