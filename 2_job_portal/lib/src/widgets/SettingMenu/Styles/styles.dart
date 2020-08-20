import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SettingMenuStyles {
  double devicePixelRatio;
  double deviceWidth;
  double deviceHeight;
  double shareWidth;
  double shareHeight;
  double fontUnit;
  double statusbarHeight;
  double bottombarHeight;

  double iconSize;
  double textFontSize;

  SettingMenuStyles(BuildContext context) {
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    shareWidth = deviceWidth / 100;
    shareHeight = deviceHeight / 100;
    fontUnit = shareWidth * devicePixelRatio;
    statusbarHeight = MediaQuery.of(context).padding.top;
    bottombarHeight = MediaQuery.of(context).viewInsets.bottom;

    iconSize = 20;
    textFontSize = 20;
  }
}
