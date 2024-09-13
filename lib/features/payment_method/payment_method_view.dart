import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/cores/widgets/setting_tile.dart';
import 'package:cases_app/features/language/language_provider.dart';
import 'package:cases_app/features/payment_method/components/payment_type_widget.dart';
import 'package:cases_app/features/payment_method/master_card/master_card_detail_view.dart';
import 'package:cases_app/features/submit_case/submit_case_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({super.key});

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  GlobalKey<FormState> caseSubmitKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);

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
                        PaymentType(
                            imageAsset: imgMasterCard,
                            cardName: AppLocalizations.of(context)!.masterCard,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MasterCardDetailView()));
                            }),
                        SizedBox(height: MySize.size15),
                        PaymentType(
                            imageAsset: imgApplePay,
                            cardName: AppLocalizations.of(context)!.applePay,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MasterCardDetailView()));
                            }),
                        SizedBox(height: MySize.size15),
                        PaymentType(
                            imageAsset: imgVisaCard,
                            cardName: AppLocalizations.of(context)!.visaCard,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MasterCardDetailView()));
                            }),
                        SizedBox(height: MySize.size5),
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
                                                  BorderRadius.circular(
                                                      MySize.size30)),
                                          child: Consumer<AppLanguage>(
                                            builder:
                                                (context, provider, child) =>
                                                    Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: MySize.size25,
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .selectLanguage
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            ThemeColors.black,
                                                        fontSize: MySize.size14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: MySize.size10),
                                                InkWell(
                                                  onTap: () {
                                                    if (provider.groupValue ==
                                                        "English") {
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: AbsorbPointer(
                                                    absorbing:
                                                        provider.groupValue ==
                                                            "English",
                                                    child: RadioListTile(
                                                      value: "English",
                                                      groupValue:
                                                          provider.groupValue,
                                                      title: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "English",
                                                          style: TextStyle(
                                                            color: ThemeColors
                                                                .mainColor,
                                                            fontSize:
                                                                MySize.size12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      activeColor:
                                                          ThemeColors.mainColor,
                                                      onChanged: (value) async {
                                                        provider
                                                            .changeGroupValue(
                                                                value!);
                                                        provider.changeLanguage(
                                                            const Locale('en'));
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (provider.groupValue ==
                                                        "Arabic") {
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: AbsorbPointer(
                                                    absorbing:
                                                        provider.groupValue ==
                                                            "Arabic",
                                                    child: RadioListTile(
                                                      value: "Arabic",
                                                      groupValue:
                                                          provider.groupValue,
                                                      title: Text(
                                                        "عربی",
                                                        style: TextStyle(
                                                          color: ThemeColors
                                                              .mainColor,
                                                          fontSize:
                                                              MySize.size12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      activeColor:
                                                          ThemeColors.mainColor,
                                                      onChanged: (value) async {
                                                        provider
                                                            .changeGroupValue(
                                                                value!);
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
                                overlayColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                child: Consumer<AppLanguage>(
                                  builder: (context, provider, child) =>
                                      SettingTile(
                                    icon: icGlobe,
                                    title: AppLocalizations.of(context)!
                                        .language
                                        .toString(),
                                    subtitle:
                                        provider.appLocal == const Locale('ar')
                                            ? AppLocalizations.of(context)!
                                                .arabic
                                                .toString()
                                            : AppLocalizations.of(context)!
                                                .english
                                                .toString(),
                                    showBtn: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
