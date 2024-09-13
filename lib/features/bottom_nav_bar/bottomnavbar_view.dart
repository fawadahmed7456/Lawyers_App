// ignore_for_file: deprecated_member_use

import 'package:cases_app/cores/helper/constant.dart';
import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:cases_app/features/bottom_nav_bar/bottomnavbar_provider.dart';
import 'package:cases_app/features/cases/cases_view.dart';
import 'package:cases_app/features/home/home_view.dart';
import 'package:cases_app/features/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: ThemeColors.whiteColor,
        body: SafeArea(
          child: bodyList[provider.bottomIndex],
        ),
        bottomNavigationBar: Stack(
          children: [
            BottomNavigationBar(
              backgroundColor: ThemeColors.whiteColor,
              currentIndex: provider.bottomIndex,
              onTap: (value) => provider.setBottomIndex(value),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                color: ThemeColors.primaryColor,
                fontSize: MySize.size12,
                fontWeight: FontWeight.w500,
              ),
              selectedItemColor: ThemeColors.primaryColor,
              unselectedItemColor: ThemeColors.navBarGrey,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: TextStyle(
                color: ThemeColors.navBarGrey,
                fontSize: MySize.size12,
                fontWeight: FontWeight.w500,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        bottom: MySize.size7, top: MySize.size7),
                    child: SizedBox(
                      height: MySize.size24,
                      width: MySize.size24,
                      child: SvgPicture.asset(
                        icHomeIcon,
                        color: ThemeColors.navBarGrey,
                      ),
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(
                        bottom: MySize.size7, top: MySize.size7),
                    child: SizedBox(
                      height: MySize.size24,
                      width: MySize.size24,
                      child: SvgPicture.asset(
                        icHomeIcon,
                        color: ThemeColors.primaryColor,
                      ),
                    ),
                  ),
                  label: AppLocalizations.of(context)!.home,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        bottom: MySize.size7, top: MySize.size7),
                    child: SizedBox(
                      height: MySize.size24,
                      width: MySize.size24,
                      child: SvgPicture.asset(
                        icCasesIcon,
                        color: ThemeColors.navBarGrey,
                      ),
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(
                        bottom: MySize.size7, top: MySize.size7),
                    child: SizedBox(
                      height: MySize.size24,
                      width: MySize.size24,
                      child: SvgPicture.asset(
                        icCasesIcon,
                        color: ThemeColors.primaryColor,
                      ),
                    ),
                  ),
                  label: AppLocalizations.of(context)!.cases,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(
                        bottom: MySize.size7, top: MySize.size7),
                    child: SizedBox(
                      height: MySize.size24,
                      width: MySize.size24,
                      child: SvgPicture.asset(
                        icSettings,
                        color: ThemeColors.navBarGrey,
                      ),
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(
                        bottom: MySize.size7, top: MySize.size7),
                    child: SizedBox(
                      height: MySize.size24,
                      width: MySize.size24,
                      child: SvgPicture.asset(
                        icSettings,
                        color: ThemeColors.primaryColor,
                      ),
                    ),
                  ),
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 1,
                  color: ThemeColors.navBarGrey,
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> bodyList = [
  const HomeView(),
  const CasesView(),
  const SettingsView(),
];
