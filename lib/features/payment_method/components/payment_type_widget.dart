import 'package:cases_app/cores/helper/mySize.dart';
import 'package:cases_app/cores/helper/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentType extends StatelessWidget {
  final String imageAsset; // Path to the card brand image asset
  final String cardName; // Text for the card brand name
  final VoidCallback onTap; // Callback function for tapping the card

  const PaymentType({
    super.key,
    required this.imageAsset,
    required this.cardName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MySize.size355,
        height: MySize.size65,
        decoration: BoxDecoration(
          color: ThemeColors.whiteColor,
          borderRadius: BorderRadius.circular(MySize.size10),
          boxShadow: [
            BoxShadow(
              color: ThemeColors.black.withOpacity(0.04),
              offset: const Offset(0, 4),
              spreadRadius: 4,
              blurRadius: 10,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MySize.size14),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(imageAsset),
                    SizedBox(width: MySize.size15),
                    Text(
                      cardName,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: MySize.size16,
                        color: ThemeColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ThemeColors.grey,
                        size: 20,
                      ),
                    )
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
