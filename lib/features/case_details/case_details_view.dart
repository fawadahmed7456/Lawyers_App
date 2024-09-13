// ignore_for_file: deprecated_member_use

import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/features/cases/cases_provider.dart';
import 'package:cases_app/features/cases/models/case_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

class CasesDetailView extends StatefulWidget {
  const CasesDetailView({super.key});

  @override
  State<CasesDetailView> createState() => _CasesDetailViewState();
}

class _CasesDetailViewState extends State<CasesDetailView> {
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
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new,
                                color: ThemeColors.black)),
                        SizedBox(width: MySize.size20),
                        AppLocalizations.of(context)!
                            .caseDetails
                            .text
                            .size(MySize.size15)
                            .color(ThemeColors.black)
                            .fontWeight(FontWeight.w400)
                            .textStyle(GoogleFonts.openSans())
                            .make(),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.more_vert_rounded, color: ThemeColors.black)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MySize.size25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
