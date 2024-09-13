import 'package:cases_app/cores/helper/common_functions.dart';
import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/custom_buttons.dart';
import 'package:cases_app/cores/widgets/custom_textfields.dart';
import 'package:cases_app/features/payment_method/payment_method_view.dart';
import 'package:cases_app/features/submit_case/submit_case_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

class SubmitCaseView extends StatefulWidget {
  const SubmitCaseView({super.key});

  @override
  State<SubmitCaseView> createState() => _SubmitCaseViewState();
}

class _SubmitCaseViewState extends State<SubmitCaseView> {
  GlobalKey<FormState> caseSubmitKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    List<String> categories = [
      AppLocalizations.of(context)!.private,
      AppLocalizations.of(context)!.family,
      AppLocalizations.of(context)!.criminal,
      AppLocalizations.of(context)!.property,
    ];
    String datePicked = DateFormat('dd/MM/yyyy').format(DateTime.now());

    Future<void> getDateFromUser() async {
      DateTime? dateData = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2150));

      datePicked = DateFormat('dd/MM/yyyy').format(dateData ?? DateTime.now());
    }

    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: Consumer<SubmitCaseProvider>(
        builder: (context, submitCaseProvider, child) => SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MySize.size145),
                        AppLocalizations.of(context)!
                            .category
                            .text
                            .size(MySize.size14)
                            .color(ThemeColors.black)
                            .textStyle(GoogleFonts.openSans())
                            .fontWeight(FontWeight.w600)
                            .make(),
                        SizedBox(height: MySize.size5),
                        AppLocalizations.of(context)!
                            .selectCategory
                            .text
                            .size(MySize.size10)
                            .color(ThemeColors.textGrey)
                            .textStyle(GoogleFonts.openSans())
                            .fontWeight(FontWeight.w400)
                            .make(),
                        SizedBox(height: MySize.size15),
                        Column(
                          children: [
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      categories.length,
                                      (index) => GestureDetector(
                                            onTap: () {
                                              submitCaseProvider
                                                  .updateSeletectedCategories1(
                                                      index,
                                                      !submitCaseProvider
                                                              .seltectedCategories1[
                                                          index]);
                                              submitCaseProvider
                                                      .selectedCategoryName =
                                                  categories[index];
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: MySize.size7),
                                              decoration: BoxDecoration(
                                                  color: submitCaseProvider
                                                                  .seltectedCategories1[
                                                              index] ==
                                                          true
                                                      ? ThemeColors.primaryColor
                                                      : ThemeColors.whiteColor
                                                          .withOpacity(0.2),
                                                  border: Border.all(
                                                      color: ThemeColors
                                                          .textGrey
                                                          .withOpacity(0.2),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          MySize.size30)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: MySize.size25,
                                                    vertical: MySize.size8),
                                                child: categories[index]
                                                    .text
                                                    .size(MySize.size10)
                                                    .color(submitCaseProvider
                                                                    .seltectedCategories1[
                                                                index] ==
                                                            true
                                                        ? ThemeColors.whiteColor
                                                        : ThemeColors.textGrey)
                                                    .fontWeight(FontWeight.w400)
                                                    .textStyle(
                                                        GoogleFonts.kanit())
                                                    .make(),
                                              ),
                                            ),
                                          )),
                                )),
                          ],
                        ),
                        SizedBox(height: MySize.size15),
                        Form(
                          key: caseSubmitKey,
                          child: Column(
                            children: [
                              CustomTextField14(
                                title: AppLocalizations.of(context)!.caseTitle,
                                controller:
                                    submitCaseProvider.caseTitleController,
                                hintText: AppLocalizations.of(context)!
                                    .enterCaseTitle,
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
                              SizedBox(height: MySize.size15),
                              CustomTextField14(
                                title: AppLocalizations.of(context)!.filedDate,
                                controller:
                                    submitCaseProvider.filedDateController,
                                hintText: AppLocalizations.of(context)!
                                    .enterFiledDate,
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
                                sufixIcon: GestureDetector(
                                    onTap: () async {
                                      await getDateFromUser();
                                      submitCaseProvider.setDate(datePicked);
                                    },
                                    child: Image.asset(imgCalendar)),
                              ),
                              SizedBox(height: MySize.size15),
                              CustomTextField14(
                                minLines: 3,
                                maxLines: 4,
                                title:
                                    AppLocalizations.of(context)!.description,
                                controller:
                                    submitCaseProvider.descriptionController,
                                hintText: AppLocalizations.of(context)!
                                    .enterDescription,
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
                            ],
                          ),
                        ),
                        SizedBox(height: MySize.size20),
                        AppLocalizations.of(context)!
                            .documents
                            .text
                            .size(MySize.size14)
                            .color(ThemeColors.black)
                            .textStyle(GoogleFonts.openSans())
                            .fontWeight(FontWeight.w600)
                            .make(),
                        SizedBox(height: MySize.size5),
                        AppLocalizations.of(context)!
                            .onlyPDFs
                            .text
                            .size(MySize.size10)
                            .color(ThemeColors.textGrey)
                            .textStyle(GoogleFonts.openSans())
                            .fontWeight(FontWeight.w400)
                            .make(),
                        SizedBox(height: MySize.size10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MySize.size80,
                            height: MySize.size75,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgCaseUploadImage)),
                            ),
                          ),
                        ),
                        SizedBox(height: MySize.size50),
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
                              text: AppLocalizations.of(context)!.pay,
                              onPressed: () {
                                if (caseSubmitKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentMethodView()));
                                }
                              },
                              backgroundColor: ThemeColors.mainColor,
                              textColor: ThemeColors.whiteColor,
                            )),
                          ],
                        ),
                        SizedBox(height: MySize.size5),
                      ],
                    )),
              ),
              Container(
                width: MySize.screenWidth,
                height: MySize.size125,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgSubmitCaseImage),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppLocalizations.of(context)!
                            .submitLawCase
                            .text
                            .color(ThemeColors.whiteColor)
                            .textStyle(GoogleFonts.openSans())
                            .fontWeight(FontWeight.w600)
                            .size(MySize.size17)
                            .align(TextAlign.center)
                            .makeCentered(),
                      ],
                    ),
                    Positioned(
                      top: MySize.screenHeight * 0.05,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: ThemeColors.whiteColor,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
