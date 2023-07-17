import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:flutter/material.dart';

class ButtonThemeHelper {
  static ButtonStyle get addMenuItemButtonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColorHelper.white,
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            side: BorderSide(
              color: AppColorHelper.hooloovooBlue,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      );

  static ButtonStyle get incrementDecrementMenuButtonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColorHelper.hooloovooBlue,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(0),
        ),
      );

  static ButtonStyle get viewOrderButtonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColorHelper.white,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 36,
            vertical: 16,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      );

  static ButtonStyle get viewCategoriesButtonStyle => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColorHelper.darkToneInk,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      );
}
