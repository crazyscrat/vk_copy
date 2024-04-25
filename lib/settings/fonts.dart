import 'package:flutter/material.dart';

import 'colors.dart';

abstract class VkFonts{
  static final fontBlueRegular_14 = TextStyle(color: VkColors.blueFont, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.normal);
  static final fontBlueW600_14 = TextStyle(color: VkColors.blueFont, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w600);
  static final fontBlueW400_20 =TextStyle(color: VkColors.blueLight, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w400);
  static final fontBlueW400_18 =TextStyle(color: VkColors.blueLight, fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.w400);

  static final fontBlackNormal_24 = TextStyle(color: VkColors.blackFont, fontSize: 24, fontFamily: 'Roboto', fontWeight: FontWeight.normal);
  static final fontBlackW400_24 = TextStyle(color: VkColors.blackFont, fontSize: 23, fontFamily: 'Roboto', fontWeight: FontWeight.w400);
  static final fontBlackW400_18 = TextStyle(color: VkColors.mainBGColor, fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.w400);

  static final fontGreyW600_14 = TextStyle(color: VkColors.greyFont, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w600);
  static final fontGreyW400_14 = TextStyle(color: VkColors.greyFont, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w400);
  static final fontGreyW400_16 = TextStyle(color: VkColors.greyFont, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w400);
  static final fontGreyW400_18 = TextStyle(color: VkColors.greyFont, fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.w400);
  //static final fontGreyW400_14 = TextStyle(color: VkColors.greyFont, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w400);

  static final fontWhiteW600_24 = TextStyle(color: VkColors.greyLightBGColor, fontSize: 24, fontFamily: 'Roboto', fontWeight: FontWeight.w600);
  static final fontWhiteW600_14 = TextStyle(color: VkColors.greyLightBGColor, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w600);
  static final fontWhiteNorm_14 = TextStyle(color: VkColors.greyLightBGColor, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.normal);
  static final fontWhiteNormal_24 = TextStyle(color: VkColors.whiteFont, fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'Roboto');
  static final fontWhiteNormal_18 = TextStyle(color: VkColors.whiteFont, fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'Roboto');
  static final fontWhiteNormal_20 = TextStyle(color: VkColors.whiteFont, fontSize: 20, fontWeight: FontWeight.w400, fontFamily: 'Roboto');
  static final fontWhiteNormal_16 = TextStyle(color: VkColors.whiteFont, fontFamily: 'Roboto', fontSize: 16);
}