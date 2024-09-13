import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/custom_buttons.dart';
import 'package:cases_app/features/operation_successful/operation_successful.dart';
import 'package:cases_app/features/payment_method/payment_provider.dart';
import 'package:cases_app/features/submit_case/submit_case_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentConfirmMasterCardView extends StatefulWidget {
  const PaymentConfirmMasterCardView({super.key});

  @override
  State<PaymentConfirmMasterCardView> createState() =>
      _PaymentConfirmMasterCardViewState();
}

class _PaymentConfirmMasterCardViewState
    extends State<PaymentConfirmMasterCardView> {
  GlobalKey<FormState> paymentDetailsKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer2(
        builder: (context, PaymentProvider paymentProvider,
                SubmitCaseProvider submitCaseProvider, child) =>
            SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MySize.size15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            SizedBox(
                                height: MySize.size60, width: MySize.size10),
                            AppLocalizations.of(context)!
                                .payment
                                .text
                                .color(ThemeColors.black)
                                .textStyle(GoogleFonts.openSans())
                                .fontWeight(FontWeight.w500)
                                .size(MySize.size16)
                                .align(TextAlign.center)
                                .makeCentered(),
                          ],
                        ),
                        SizedBox(height: MySize.size40),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MySize.size355,
                            height: MySize.size65,
                            decoration: BoxDecoration(
                                color: ThemeColors.whiteColor,
                                borderRadius:
                                    BorderRadius.circular(MySize.size10),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          ThemeColors.black.withOpacity(0.04),
                                      offset: const Offset(0, 4),
                                      spreadRadius: 4,
                                      blurRadius: 10)
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MySize.size14),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Image.asset(imgMasterCard),
                                        SizedBox(width: MySize.size15),
                                        AppLocalizations.of(context)!
                                            .masterCard
                                            .text
                                            .color(ThemeColors.black)
                                            .textStyle(GoogleFonts.openSans())
                                            .fontWeight(FontWeight.w500)
                                            .size(MySize.size16)
                                            .align(TextAlign.center)
                                            .makeCentered(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: MySize.size15),
                        // AppLocalizations.of(context)!
                        //     .documents
                        //     .text
                        //     .size(MySize.size14)
                        //     .color(ThemeColors.black)
                        //     .textStyle(GoogleFonts.openSans())
                        //     .fontWeight(FontWeight.w600)
                        //     .make(),
                        // SizedBox(height: MySize.size5),
                        // AppLocalizations.of(context)!
                        //     .youDidnotHaveCardDetailsSaved
                        //     .text
                        //     .size(MySize.size10)
                        //     .color(ThemeColors.textGrey)
                        //     .textStyle(GoogleFonts.openSans())
                        //     .fontWeight(FontWeight.w400)
                        //     .make(),
                        SizedBox(height: MySize.size10),
                        Container(
                          padding: EdgeInsets.all(MySize.size15),
                          decoration: const BoxDecoration(
                            color: ThemeColors.whiteColor,
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: ThemeColors.grey.withOpacity(0.3),
                            //       offset: const Offset(0, 4),
                            //       spreadRadius: 10,
                            //       blurRadius: 4)
                            // ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppLocalizations.of(context)!
                                      .caseDetails
                                      .text
                                      .size(MySize.size14)
                                      .color(ThemeColors.black)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                ],
                              ),
                              SizedBox(height: MySize.size20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  "${AppLocalizations.of(context)!.category} :"
                                      .text
                                      .size(MySize.size11)
                                      .color(ThemeColors.black)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                  submitCaseProvider.selectedCategoryName.text
                                      .size(MySize.size11)
                                      .color(ThemeColors.textGrey)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                ],
                              ),
                              SizedBox(height: MySize.size10),
                              const Divider(
                                  color: ThemeColors.navBarGrey,
                                  thickness: 0.7),
                              SizedBox(height: MySize.size10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  "${AppLocalizations.of(context)!.caseTitle} :"
                                      .text
                                      .size(MySize.size11)
                                      .color(ThemeColors.black)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                  submitCaseProvider
                                      .caseTitleController.text.text
                                      .size(MySize.size11)
                                      .color(ThemeColors.textGrey)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                ],
                              ),
                              SizedBox(height: MySize.size10),
                              const Divider(
                                  color: ThemeColors.navBarGrey,
                                  thickness: 0.7),
                              SizedBox(height: MySize.size10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  "${AppLocalizations.of(context)!.filedDate} :"
                                      .text
                                      .size(MySize.size11)
                                      .color(ThemeColors.black)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                  submitCaseProvider
                                      .filedDateController.text.text
                                      .size(MySize.size11)
                                      .color(ThemeColors.textGrey)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                ],
                              ),
                              SizedBox(height: MySize.size10),
                              const Divider(
                                  color: ThemeColors.navBarGrey,
                                  thickness: 0.7),
                              SizedBox(height: MySize.size15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppLocalizations.of(context)!
                                      .description
                                      .text
                                      .size(MySize.size14)
                                      .color(ThemeColors.black)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                ],
                              ),
                              SizedBox(height: MySize.size10),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SizedBox(
                                  height: MySize.size80,
                                  child: submitCaseProvider
                                      .descriptionController.text.text
                                      .size(MySize.size11)
                                      .color(ThemeColors.textGrey)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w400)
                                      .make(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: MySize.size10),
                        Container(
                          padding: EdgeInsets.all(MySize.size15),
                          decoration: const BoxDecoration(
                            color: ThemeColors.whiteColor,
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: ThemeColors.grey.withOpacity(0.3),
                            //       offset: const Offset(0, 4),
                            //       spreadRadius: 10,
                            //       blurRadius: 4)
                            // ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppLocalizations.of(context)!
                                      .documents
                                      .text
                                      .size(MySize.size14)
                                      .color(ThemeColors.black)
                                      .textStyle(GoogleFonts.openSans())
                                      .fontWeight(FontWeight.w600)
                                      .make(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MySize.size15),
                        Container(
                          height: MySize.size60,
                          width: MySize.screenWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size10)),
                              image: const DecorationImage(
                                  image: AssetImage(imgDocumentImage))),
                        ),
                        Container(
                          height: MySize.size60,
                          width: MySize.screenWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size10)),
                              image: const DecorationImage(
                                  image: AssetImage(imgDocumentImage))),
                        ),

                        SizedBox(height: MySize.size30),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                "120.00  "
                                    .text
                                    .size(MySize.size18)
                                    .color(ThemeColors.primaryColor)
                                    .textStyle(GoogleFonts.openSans())
                                    .fontWeight(FontWeight.w600)
                                    .make(),
                                AppLocalizations.of(context)!
                                    .sar
                                    .text
                                    .size(MySize.size18)
                                    .color(ThemeColors.primaryColor)
                                    .textStyle(GoogleFonts.openSans())
                                    .fontWeight(FontWeight.w600)
                                    .make(),
                              ],
                            )),
                            Expanded(
                                child: CustomButton8(
                              text: AppLocalizations.of(context)!.payNow,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OperationSuccessfullView()));
                              },
                              backgroundColor: ThemeColors.mainColor,
                              textColor: ThemeColors.whiteColor,
                            )),
                          ],
                        ),

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
