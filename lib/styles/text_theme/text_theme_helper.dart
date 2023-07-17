import 'package:explorex_assignment/styles/app_color/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeHelper {
  static TextStyle darkToneInk_12_400 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle darkToneInk_10_400 = darkToneInk_12_400.copyWith(
    fontSize: 10,
    height: 15 / 10,
  );

  static TextStyle darkToneInk_12_600 = darkToneInk_12_400.copyWith(
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle chromeAluminium_12_400 = darkToneInk_12_400.copyWith(
    color: AppColorHelper.chromeAluminium,
    height: 18 / 12,
  );

  static TextStyle hooloovooBlue_10_700 = darkToneInk_12_400.copyWith(
    fontSize: 10,
    height: 15 / 10,
    fontWeight: FontWeight.w700,
    color: AppColorHelper.hooloovooBlue,
  );

  static TextStyle darkToneInk_14_600 = darkToneInk_12_400.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 21 / 14,
  );

  static TextStyle chromeAluminium_10_400 = darkToneInk_12_400.copyWith(
    fontSize: 10,
    height: 15 / 10,
    color: AppColorHelper.chromeAluminium,
  );

  static TextStyle chromeAluminium_10_700 = darkToneInk_12_400.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 15 / 10,
    color: AppColorHelper.chromeAluminium,
  );

  static TextStyle darkToneInk_10_600 = darkToneInk_12_400.copyWith(
    fontSize: 10,
    height: 15 / 10,
    fontWeight: FontWeight.w600,
  );

  static TextStyle darkToneInk_9_400_lineThrough = darkToneInk_12_400.copyWith(
    fontSize: 9,
    height: 14 / 9,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle hooloovooBlue_12_400 = darkToneInk_12_400.copyWith(
    fontSize: 12,
    height: 18 / 12,
    color: AppColorHelper.hooloovooBlue,
  );

  static TextStyle hooloovooBlue_12_600 = darkToneInk_12_400.copyWith(
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.hooloovooBlue,
  );

  static TextStyle white_16_600 = darkToneInk_12_400.copyWith(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.white,
  );

  static TextStyle white_9_400 = darkToneInk_12_400.copyWith(
    fontSize: 9,
    height: 14 / 9,
    fontWeight: FontWeight.w400,
    color: AppColorHelper.white,
  );

  static TextStyle white_10_600 = darkToneInk_12_400.copyWith(
    fontSize: 10,
    height: 15 / 10,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.white,
  );

  static TextStyle chromeAluminium_12_600 = darkToneInk_12_400.copyWith(
    color: AppColorHelper.chromeAluminium,
    height: 18 / 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle white_12_800 = darkToneInk_12_400.copyWith(
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w800,
    color: AppColorHelper.white,
  );

  static TextStyle white_12_400 = darkToneInk_12_400.copyWith(
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w400,
    color: AppColorHelper.white,
  );

  static TextStyle hooloovooBlue_12_700 = darkToneInk_12_400.copyWith(
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w700,
    color: AppColorHelper.hooloovooBlue,
  );

  static TextStyle darkToneInk_16_600 = darkToneInk_12_400.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
  );

  static TextStyle white_12_600 = darkToneInk_12_400.copyWith(
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.white,
  );

  static TextStyle forgedSteel_10_400 = darkToneInk_12_400.copyWith(
    fontSize: 10,
    height: 15 / 10,
    color: AppColorHelper.forgedSteel,
  );
}
