// ignore_for_file: deprecated_member_use

import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingTile extends StatelessWidget {
  const SettingTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.showBtn,
      this.btnValue,
      this.onChange,
      required this.icon});
  final String title;
  final String subtitle;
  final bool showBtn;
  final bool? btnValue;
  final Function(bool)? onChange;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MySize.size80,
      decoration: BoxDecoration(
        color: ThemeColors.bgColor,
        borderRadius: BorderRadius.circular(MySize.size10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(4, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: Spacing.horizontal(MySize.size22),
                child: SvgPicture.asset(
                  icon,
                  color: ThemeColors.mainColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: ThemeColors.grey2,
                      fontSize: MySize.size12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: MySize.size7),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: ThemeColors.black,
                      fontSize: MySize.size16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
          showBtn
              ? Padding(
                  padding: Spacing.horizontal(MySize.size12),
                  child: CupertinoSwitch(
                    activeColor: ThemeColors.mainColor,
                    value: btnValue!,
                    onChanged: onChange,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
