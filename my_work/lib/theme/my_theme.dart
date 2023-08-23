import 'package:flutter/material.dart';
import 'package:my_work/constants/color_constants.dart';

mixin MyTheme {
  ThemeData get myTheme => ThemeData(
      appBarTheme: AppBarTheme(
          centerTitle: true, backgroundColor: ColorConstants.black));
}
mixin CustomTextStyle {
  TextStyle get normTextStyle => TextStyle(
        color: ColorConstants.white,
      );
  TextStyle get middleTextStyle => TextStyle(
      color: ColorConstants.black, fontSize: 22, fontWeight: FontWeight.w600);
  TextStyle get commentTextStyle => TextStyle(
        color: ColorConstants.grey,
      );
}
