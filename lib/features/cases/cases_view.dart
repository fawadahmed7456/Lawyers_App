// ignore_for_file: deprecated_member_use

import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/features/case_details/case_details_view.dart';
import 'package:cases_app/features/cases/cases_card/cases_card.dart';
import 'package:cases_app/features/cases/cases_provider.dart';
import 'package:cases_app/features/cases/models/case_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

class CasesView extends StatefulWidget {
  const CasesView({super.key});

  @override
  State<CasesView> createState() => _CasesViewState();
}

class _CasesViewState extends State<CasesView> {
  Case myCase = Case(
    caseId: 'CRN-2024-0628-0001',
    title: 'Agreemant Breach',
    filedDate: DateTime(2024, 05, 15),
    caseDescription:
        'The client alleges that the competitor\'s logo design infringes upon their own registered trademark. This case involves intellectual property law and requires a thorough analysis of brand identity and potential consumer confusion.',
    caseCategory: 'Family',
    documentPath: 'path/to/documents/trademark_infringement_complaint.pdf',
    caseStatus: 'Pending',
  );

  Case myCase2 = Case(
    caseId: 'CRN-2024-0628-0002',
    title: 'Divorce Case',
    filedDate: DateTime(2024, 05, 15),
    caseDescription:
        'The client alleges that her wife has made false divorce papers to aquire the property.',
    caseCategory: 'Family',
    documentPath: 'path/to/documents/trademark_infringement_complaint.pdf',
    caseStatus: 'Approved',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MySize.size20),
          child: Consumer(
            builder: (context, CasesProvider casesProvider, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MySize.size25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLocalizations.of(context)!
                        .myCases
                        .text
                        .size(MySize.size19)
                        .color(ThemeColors.black)
                        .fontWeight(FontWeight.w500)
                        .textStyle(GoogleFonts.nunitoSans())
                        .make(),
                    const Row(
                      children: [
                        Icon(Icons.more_vert_rounded, color: ThemeColors.black)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MySize.size25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        casesProvider.updateSelectedIndex(0);
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(
                              //   Icons.bookmarks_outlined,
                              //   color: casesProvider.selectedIndex == 0
                              //       ? ThemeColors.primaryColor
                              //       : ThemeColors.navBarGrey,
                              // ),
                              // SizedBox(width: MySize.size6),
                              AppLocalizations.of(context)!
                                  .pending
                                  .text
                                  .size(MySize.size16)
                                  .color(casesProvider.selectedIndex == 0
                                      ? ThemeColors.primaryColor
                                      : ThemeColors.navBarGrey)
                                  .fontWeight(FontWeight.w400)
                                  .textStyle(GoogleFonts.nunitoSans())
                                  .make(),
                            ],
                          ),
                          SizedBox(height: MySize.size10),
                          Container(
                            height: 1,
                            width: MySize.safeWidth / 2 - MySize.size25,
                            color: casesProvider.selectedIndex == 0
                                ? ThemeColors.primaryColor
                                : ThemeColors.navBarGrey,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        casesProvider.updateSelectedIndex(1);
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(
                              //   Icons.file_download_rounded,
                              //   color: casesProvider.selectedIndex == 1
                              //       ? ThemeColors.primaryColor
                              //       : ThemeColors.navBarGrey,
                              // ),
                              // SizedBox(width: MySize.size6),
                              AppLocalizations.of(context)!
                                  .approved
                                  .text
                                  .size(MySize.size16)
                                  .color(casesProvider.selectedIndex == 1
                                      ? ThemeColors.primaryColor
                                      : ThemeColors.navBarGrey)
                                  .fontWeight(FontWeight.w400)
                                  .textStyle(GoogleFonts.nunitoSans())
                                  .make(),
                            ],
                          ),
                          SizedBox(height: MySize.size10),
                          Row(
                            children: [
                              Container(
                                height: 1,
                                width: MySize.safeWidth / 2 - MySize.size25,
                                color: casesProvider.selectedIndex == 1
                                    ? ThemeColors.primaryColor
                                    : ThemeColors.navBarGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MySize.size25),
                casesProvider.selectedIndex == 0
                    ? SizedBox(
                        height: MySize.screenHeight * 0.69,
                        child: SingleChildScrollView(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CasesDetailView()));
                            },
                            child: Column(
                                children: List.generate(
                                    6,
                                    (index) => Column(children: [
                                          CasesCard(caseObject: myCase),
                                          SizedBox(height: MySize.size10)
                                        ]))),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: MySize.screenHeight * 0.69,
                        child: SingleChildScrollView(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CasesDetailView()));
                            },
                            child: Column(
                                children: List.generate(
                                    2,
                                    (index) => Column(children: [
                                          CasesCard(caseObject: myCase2),
                                          SizedBox(height: MySize.size10)
                                        ]))),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
