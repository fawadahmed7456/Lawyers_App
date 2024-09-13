import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/features/cases/models/case_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

String formatDate(DateTime date) {
  // Create a new DateFormat object with the desired format (DD/MM/YYYY)
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  // Format the date and return the formatted string
  return formatter.format(date);
}

class CasesCard extends StatelessWidget {
  final Case caseObject;

  const CasesCard({super.key, required this.caseObject});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MySize.size12),
      decoration: BoxDecoration(
        color: ThemeColors.whiteColor,
        borderRadius: BorderRadius.circular(MySize.size10),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.black.withOpacity(0.04),
            offset: const Offset(0, 2),
            spreadRadius: 4,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          // Case image (replace with your logic for image path)
          Container(
            width: MySize.size100,
            height: MySize.size110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MySize.size10),
                color: ThemeColors.primaryColor.withOpacity(0.05),
                image: const DecorationImage(
                  image: AssetImage(imgHomeCase), // Assuming local image path
                )),
          ),
          SizedBox(width: MySize.size14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Case title
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      caseObject.caseId.text
                          .size(MySize.size8)
                          .color(ThemeColors.textGrey)
                          .fontWeight(FontWeight.w400)
                          .textStyle(GoogleFonts.openSans())
                          .make(),
                      Row(
                        children: [
                          caseObject.caseStatus == "Pending"
                              ? SvgPicture.asset(
                                  icClock,
                                  color: ThemeColors.textGrey,
                                  width: 15,
                                  height: 15,
                                )
                              : caseObject.caseStatus == "Reviewed"
                                  ? SvgPicture.asset(
                                      icBell,
                                      color: ThemeColors.yellow,
                                      width: 15,
                                      height: 15,
                                    )
                                  : SvgPicture.asset(
                                      icCheckCircle,
                                      color: ThemeColors.bluePrimary,
                                      width: 15,
                                      height: 15,
                                    ),
                          caseObject.caseStatus == "Pending"
                              ? " ${AppLocalizations.of(context)!.pending} "
                                  .text
                                  .size(MySize.size8)
                                  .color(ThemeColors.textGrey)
                                  .fontWeight(FontWeight.w400)
                                  .textStyle(GoogleFonts.openSans())
                                  .make()
                              : caseObject.caseStatus == "Reviewed"
                                  ? " ${AppLocalizations.of(context)!.reviewed} "
                                      .text
                                      .size(MySize.size8)
                                      .color(ThemeColors.yellow)
                                      .fontWeight(FontWeight.w400)
                                      .textStyle(GoogleFonts.openSans())
                                      .make()
                                  : " ${AppLocalizations.of(context)!.approved} "
                                      .text
                                      .size(MySize.size8)
                                      .color(ThemeColors.bluePrimary)
                                      .fontWeight(FontWeight.w400)
                                      .textStyle(GoogleFonts.openSans())
                                      .make(),
                        ],
                      )
                    ]),
                SizedBox(height: MySize.size2),
                Row(children: [
                  SizedBox(
                    width: MySize.size200,
                    child: caseObject.title.text
                        .size(MySize.size14)
                        .color(ThemeColors.black)
                        .fontWeight(FontWeight.w600)
                        .textStyle(GoogleFonts.openSans())
                        .overflow(TextOverflow.ellipsis)
                        .make(),
                  ),
                ]),
                SizedBox(height: MySize.size2),
                Row(children: [
                  "${AppLocalizations.of(context)!.category} : "
                      .text
                      .size(MySize.size10)
                      .color(ThemeColors.textGrey)
                      .fontWeight(FontWeight.w300)
                      .textStyle(GoogleFonts.poppins())
                      .make(),
                  caseObject.caseCategory.text
                      .size(MySize.size10)
                      .color(ThemeColors.black)
                      .fontWeight(FontWeight.w400)
                      .textStyle(GoogleFonts.openSans())
                      .make(),
                ]),
                SizedBox(height: MySize.size2),
                Row(children: [
                  "${AppLocalizations.of(context)!.date} : "
                      .text
                      .size(MySize.size10)
                      .color(ThemeColors.textGrey)
                      .fontWeight(FontWeight.w300)
                      .textStyle(GoogleFonts.poppins())
                      .make(),
                  formatDate(caseObject.filedDate)
                      .text
                      .size(MySize.size10)
                      .color(ThemeColors.black)
                      .fontWeight(FontWeight.w400)
                      .textStyle(GoogleFonts.openSans())
                      .make(),
                ]),
                SizedBox(height: MySize.size8),
                Text(
                    "${caseObject.caseDescription.substring(0, 70)}...", // Truncate after 70 characters
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                        color: ThemeColors.grey,
                        fontSize: MySize.size12,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
