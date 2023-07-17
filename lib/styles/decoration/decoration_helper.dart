import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:flutter/material.dart';

class DecorationHelper {
  static BoxDecoration get logoBoxDecor => const BoxDecoration(
        color: AppColorHelper.white,
        border: Border(
          bottom: BorderSide(
            color: AppColorHelper.darkToneInk,
            width: 0.5,
          ),
        ),
      );

  static BoxDecoration get meatTypeDecor => BoxDecoration(
        border: Border.all(
          color: AppColorHelper.forgedSteel,
        ),
        borderRadius: BorderRadius.circular(4),
      );

  static BoxDecoration get selectedMeatTypeDecor => BoxDecoration(
        color: AppColorHelper.stoicWhite,
        border: Border.all(
          color: AppColorHelper.hooloovooBlue,
        ),
        borderRadius: BorderRadius.circular(4),
      );

  static BoxDecoration get meatTypesDecor => const BoxDecoration(
        color: AppColorHelper.white,
      );

  static BoxDecoration get recommendedInformationDecor => BoxDecoration(
        color: AppColorHelper.white,
        boxShadow: [
          BoxShadow(
            color: AppColorHelper.black.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: -10,
            blurStyle: BlurStyle.inner,
          )
        ],
      );

  static BoxDecoration get bsCategorySelectedDecor => BoxDecoration(
        color: AppColorHelper.stoicWhite,
        borderRadius: BorderRadius.circular(8),
      );

  static BoxDecoration get bsCategoryCircleOutlinedDecor => BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColorHelper.hooloovooBlue,
        ),
      );

  static BoxDecoration get bsCategoryCircleFilledDecor => const BoxDecoration(
        color: AppColorHelper.hooloovooBlue,
        shape: BoxShape.circle,
      );

  static BoxDecoration get cartIncrementDecrementDecor => BoxDecoration(
        color: AppColorHelper.stoicWhite,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColorHelper.hooloovooBlue,
        ),
      );

  static BoxDecoration get categoryHeaderIconDecor => BoxDecoration(
        color: AppColorHelper.lavenderSyrup,
        borderRadius: BorderRadius.circular(4),
      );

  static BoxDecoration get categoryDecor => BoxDecoration(
        color: AppColorHelper.white,
        borderRadius: BorderRadius.circular(
          12,
        ),
      );

  static BoxDecoration get categoryDecorSelected => BoxDecoration(
        color: AppColorHelper.white,
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: AppColorHelper.hooloovooBlue,
        ),
      );

  static BoxDecoration get bsWhiteDecor => const BoxDecoration(
        color: AppColorHelper.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      );

  static BoxDecoration foodItemBSImageDecor(String image) => BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      );

  static BoxDecoration get foodItemBSAddCardDecor => BoxDecoration(
        color: AppColorHelper.hooloovooBlue,
        borderRadius: BorderRadius.circular(8),
      );

  static BoxDecoration foodItemImageDecor(String image) => BoxDecoration(
        borderRadius: BorderRadius.circular(
          4,
        ),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      );

  static BoxDecoration foodItemImagePlaceHolderDecor(String image) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(
          4,
        ),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      );

  static BoxDecoration bsFoodMenuDecor({
    required bool selected,
    required String image,
  }) =>
      BoxDecoration(
        color: AppColorHelper.black,
        border: selected
            ? Border.all(
                color: AppColorHelper.hooloovooBlue,
                width: 4,
              )
            : null,
        borderRadius: BorderRadius.circular(
          8,
        ),
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      );

  static BoxDecoration get viewOrderDecor => BoxDecoration(
        color: AppColorHelper.yueGuangLanBlue,
        borderRadius: BorderRadius.circular(
          12,
        ),
      );
}
