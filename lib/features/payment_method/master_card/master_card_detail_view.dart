import 'package:cases_app/cores/helper/common_functions.dart';
import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/custom_buttons.dart';
import 'package:cases_app/cores/widgets/custom_checkbox.dart';
import 'package:cases_app/cores/widgets/custom_textfields.dart';
import 'package:cases_app/features/payment_method/master_card/payment_confrim_mastercard.dart';
import 'package:cases_app/features/payment_method/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

class MasterCardDetailView extends StatefulWidget {
  const MasterCardDetailView({super.key});

  @override
  State<MasterCardDetailView> createState() => _MasterCardDetailViewState();
}

class _MasterCardDetailViewState extends State<MasterCardDetailView> {
  GlobalKey<FormState> paymentDetailsKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer<PaymentProvider>(
        builder: (context, paymentProvider, child) => SafeArea(
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
                                .paymentMethod
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
                        SizedBox(height: MySize.size15),
                        // AppLocalizations.of(context)!
                        //     .documents
                        //     .text
                        //     .size(MySize.size14)
                        //     .color(ThemeColors.black)
                        //     .textStyle(GoogleFonts.openSans())
                        //     .fontWeight(FontWeight.w600)
                        //     .make(),
                        // SizedBox(height: MySize.size5),
                        AppLocalizations.of(context)!
                            .youDidnotHaveCardDetailsSaved
                            .text
                            .size(MySize.size10)
                            .color(ThemeColors.textGrey)
                            .textStyle(GoogleFonts.openSans())
                            .fontWeight(FontWeight.w400)
                            .make(),
                        SizedBox(height: MySize.size25),
                        Form(
                          key: paymentDetailsKey,
                          child: Column(
                            children: [
                              CustomTextField14(
                                title: AppLocalizations.of(context)!.nameOnCard,
                                controller:
                                    paymentProvider.nameOnCardController,
                                hintText:
                                    AppLocalizations.of(context)!.nameOnCard,
                                fillColor: ThemeColors.whiteColor,
                                textColor: ThemeColors.black,
                                hintTextColor:
                                    ThemeColors.textGrey.withOpacity(0.6),
                                radius: MySize.size10,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return CommonFunctions.validateTextField(
                                      value, context);
                                },
                              ),
                              SizedBox(height: MySize.size15),
                              CustomTextField14(
                                title: AppLocalizations.of(context)!.cardNumber,
                                controller: paymentProvider.cardNoController,
                                hintText: "xxxx xxxx xxxx xxxx",
                                fillColor: ThemeColors.whiteColor,
                                textColor: ThemeColors.black,
                                hintTextColor:
                                    ThemeColors.textGrey.withOpacity(0.6),
                                radius: MySize.size10,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return CommonFunctions.validateTextField(
                                      value, context);
                                },
                              ),
                              SizedBox(height: MySize.size15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomTextField14(
                                      title: AppLocalizations.of(context)!
                                          .expiryDate,
                                      controller:
                                          paymentProvider.expiryDateController,
                                      hintText: "MM/YY",
                                      fillColor: ThemeColors.whiteColor,
                                      textColor: ThemeColors.black,
                                      hintTextColor:
                                          ThemeColors.textGrey.withOpacity(0.6),
                                      radius: MySize.size10,
                                      autoValidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return CommonFunctions
                                            .validateTextField(value, context);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: MySize.size20),
                                  Expanded(
                                    child: CustomTextField14(
                                      title: AppLocalizations.of(context)!
                                          .security,
                                      controller:
                                          paymentProvider.securityController,
                                      hintText: "CVV",
                                      fillColor: ThemeColors.whiteColor,
                                      textColor: ThemeColors.black,
                                      hintTextColor:
                                          ThemeColors.textGrey.withOpacity(0.6),
                                      radius: MySize.size10,
                                      autoValidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return CommonFunctions
                                            .validateTextField(value, context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MySize.size15),
                              CustomTextField14(
                                title:
                                    AppLocalizations.of(context)!.zipPostalCode,
                                controller:
                                    paymentProvider.zipPostalCodeController,
                                hintText: "xxxxx",
                                fillColor: ThemeColors.whiteColor,
                                textColor: ThemeColors.black,
                                hintTextColor:
                                    ThemeColors.textGrey.withOpacity(0.6),
                                radius: MySize.size10,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return CommonFunctions.validateTextField(
                                      value, context);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MySize.size20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MySize.size320,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppLocalizations.of(context)!
                                        .saveCardInformation
                                        .text
                                        .size(MySize.size10)
                                        .color(ThemeColors.textGrey)
                                        .textStyle(GoogleFonts.openSans())
                                        .fontWeight(FontWeight.w400)
                                        .align(TextAlign.center)
                                        .make(),
                                  ],
                                ),
                              ),
                              const Column(children: [CustomCheckbox()])
                            ]),
                        SizedBox(height: MySize.size100),
                        CustomButton8(
                          text: AppLocalizations.of(context)!.confirm,
                          onPressed: () {
                            if (paymentDetailsKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentConfirmMasterCardView()));
                            }
                          },
                          backgroundColor: ThemeColors.mainColor,
                          textColor: ThemeColors.whiteColor,
                          radius: MySize.size10,
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
