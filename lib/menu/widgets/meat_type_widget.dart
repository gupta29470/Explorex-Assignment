import 'package:explorex_assignment/styles/decoration/decoration_helper.dart';
import 'package:explorex_assignment/styles/text_theme/text_theme_helper.dart';
import 'package:flutter/material.dart';

class MeatTypeWidget extends StatelessWidget {
  final String? image;
  final String? meatType;
  final String selectedMeatType;

  const MeatTypeWidget({
    super.key,
    required this.image,
    required this.meatType,
    required this.selectedMeatType,
  });

  @override
  Widget build(BuildContext context) {
    return image != null &&
            image?.isNotEmpty == true &&
            meatType != null &&
            meatType?.isNotEmpty == true
        ? Container(
            padding: const EdgeInsets.all(8),
            decoration: selectedMeatType == meatType
                ? DecorationHelper.selectedMeatTypeDecor
                : DecorationHelper.meatTypeDecor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  image!,
                  height: 9,
                  width: 9,
                ),
                const SizedBox(width: 6),
                Text(
                  meatType!,
                  style: selectedMeatType == meatType
                      ? TextThemeHelper.hooloovooBlue_10_700
                      : TextThemeHelper.darkToneInk_10_400,
                )
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
