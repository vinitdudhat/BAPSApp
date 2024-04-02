

import 'package:flutter/material.dart';

import '../color/const_color.dart';
import '../font/const_font.dart';

class ConstFontStyle{
  final TextStyle subtitleText = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: ConstFont.SfProMedium,
      fontSize: 12,
      color: ConstColor.primaryColor,
      overflow: TextOverflow.ellipsis);

  final TextStyle titleText = const TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: ConstFont.SfProMedium,
      fontSize: 25,
      color: ConstColor.black,
      overflow: TextOverflow.ellipsis);

  final TextStyle mediumText = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: ConstFont.SfProMedium,
      fontSize: 15,
      color: ConstColor.greyTextColor,
      overflow: TextOverflow.ellipsis);
}