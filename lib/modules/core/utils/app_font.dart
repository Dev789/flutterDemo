import 'package:flutterbase/modules/core/utils/common_import.dart';

class AppFont {
  static final regular = GoogleFonts.roboto(
      fontWeight: FontWeight.w400, color: AppColors.colorBlack);
  static final medium = GoogleFonts.roboto(
      fontWeight: FontWeight.w500, color: AppColors.colorBlack);
  static final bold = GoogleFonts.roboto(
      fontWeight: FontWeight.w700, color: AppColors.colorBlack);
  static final semiBold = GoogleFonts.roboto(
      fontWeight: FontWeight.w600, color: AppColors.colorBlack);
  static final mediumBold = GoogleFonts.roboto(
      fontWeight: FontWeight.w500, color: AppColors.colorBlack);

  ///-------REGULAR-------------
  ///colorGray4
  static final colorRed = regular.copyWith(color: AppColors.colorRed);
  static final regularBlack = regular.copyWith(color: AppColors.colorBlack);
  static final regularPhilippineGray =
      regular.copyWith(color: AppColors.colorPhilippineGray);
  static final regularDarkCharcoal =
      regular.copyWith(color: AppColors.colorDarkCharcoal);
  static final regularColorRed = regular.copyWith(color: AppColors.colorRed);

  ///-------MEDIUM--------------
  static final mediumBlack = medium.copyWith(color: AppColors.colorBlack);
  static final mediumPhilippineGray =
      medium.copyWith(color: AppColors.colorPhilippineGray);
  static final mediumDarkCharcoal =
      medium.copyWith(color: AppColors.colorDarkCharcoal);
  static final mediumWhite = medium.copyWith(color: AppColors.colorWhite);
  static final mediumCyanSky = medium.copyWith(color: AppColors.colorCyanSky);
  static final mediumColorRed = medium.copyWith(color: AppColors.colorRed);

  ///colorWhite-------
  static final colorWhite = bold.copyWith(color: AppColors.colorWhite);
  static final colorBlack = bold.copyWith(color: AppColors.colorBlack);

  ///-------BOLD-------------
  ///colorBlack-------
  static final boldBlack = bold.copyWith(color: AppColors.colorBlack);

  ///boldBlack54-------
  static final boldBlack54 = bold.copyWith(color: AppColors.colorBlack54);

  ///colorBlack-------
  static final mediumBoldBlack =
      mediumBold.copyWith(color: AppColors.colorBlack);

  ///-------MEDIUM BOLD-------------
  ///mediumBoldWhite-------
  static final mediumBoldWhite =
      mediumBold.copyWith(color: AppColors.colorWhite);

  ///-------SEMI BOLD-------------
  ///semiBoldBlack1-------
  static final semiBoldBlack1 = semiBold.copyWith(color: AppColors.colorBlack1);
}
