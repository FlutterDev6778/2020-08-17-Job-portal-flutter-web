import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_portal/src/Config/resposible_settings.dart';

class JobListWidgetStyles {
  double devicePixelRatio;
  double deviceWidth;
  double deviceHeight;
  double fontUnit;
  double statusbarHeight;
  double bottombarHeight;
  double appbarHeight;
  double safeAreaHeight;
  double shareWidth;
  double shareHeight;
  double widthDp;
  double heightDp;
  double fontSp;

  double cardWidth;
  double cardHeight;
  double cardHorizontalPadding;
  double cardVerticalPadding;
  double titleFontSize;
  double textFontSize;
  double smallFontSize;
  double buttonWidth;
  double buttonHeight;
  double buttonTextFontSize;
  double avatarSize;
  double textItemSpacing;
  double jobTypeItemHeight;

  JobListWidgetStyles(BuildContext context) {}
}

class JobListWidgetDesktopStyles extends JobListWidgetStyles {
  JobListWidgetDesktopStyles(BuildContext context) : super(context) {
    ScreenUtil.init(
      context,
      width: ResponsibleDesignSettings.desktopDesignWidth,
      height: ResponsibleDesignSettings.desktopDesignHeight,
      allowFontScaling: false,
    );

    devicePixelRatio = ScreenUtil.pixelRatio;
    deviceWidth = ScreenUtil.screenWidth;
    deviceHeight = ScreenUtil.screenHeight;
    statusbarHeight = ScreenUtil.statusBarHeight;
    appbarHeight = AppBar().preferredSize.height;
    bottombarHeight = ScreenUtil.bottomBarHeight;
    safeAreaHeight = deviceHeight - statusbarHeight - appbarHeight - bottombarHeight;
    shareWidth = deviceWidth / 100;
    shareHeight = deviceHeight / 100;
    widthDp = ScreenUtil().setWidth(1);
    heightDp = ScreenUtil().setHeight(1);
    fontSp = ScreenUtil().setSp(1, allowFontScalingSelf: false);

    cardWidth = double.infinity;
    cardHeight = widthDp * 170;
    cardHorizontalPadding = widthDp * 20;
    cardVerticalPadding = widthDp * 0;
    titleFontSize = fontSp * 18;
    textFontSize = fontSp * 14;
    smallFontSize = fontSp * 10;
    buttonWidth = widthDp * 210;
    buttonHeight = widthDp * 32;
    buttonTextFontSize = fontSp * 14;
    avatarSize = widthDp * 25;
    textItemSpacing = widthDp * 11;
    jobTypeItemHeight = widthDp * 20;
  }
}

class JobListWidgetTabletStyles extends JobListWidgetStyles {
  JobListWidgetTabletStyles(BuildContext context) : super(context) {
    ScreenUtil.init(
      context,
      width: ResponsibleDesignSettings.desktopDesignWidth,
      height: ResponsibleDesignSettings.desktopDesignHeight,
      allowFontScaling: false,
    );

    devicePixelRatio = ScreenUtil.pixelRatio;
    deviceWidth = ScreenUtil.screenWidth;
    deviceHeight = ScreenUtil.screenHeight;
    statusbarHeight = ScreenUtil.statusBarHeight;
    appbarHeight = AppBar().preferredSize.height;
    bottombarHeight = ScreenUtil.bottomBarHeight;
    safeAreaHeight = deviceHeight - statusbarHeight - appbarHeight - bottombarHeight;
    shareWidth = deviceWidth / 100;
    shareHeight = deviceHeight / 100;
    widthDp = ScreenUtil().setWidth(1);
    heightDp = ScreenUtil().setHeight(1);
    fontSp = ScreenUtil().setSp(1, allowFontScalingSelf: false);

    cardWidth = double.infinity;
    cardHeight = widthDp * 170;
    cardHorizontalPadding = widthDp * 20;
    cardVerticalPadding = widthDp * 0;
    titleFontSize = fontSp * 18;
    textFontSize = fontSp * 14;
    smallFontSize = fontSp * 10;
    buttonWidth = widthDp * 210;
    buttonHeight = widthDp * 32;
    buttonTextFontSize = fontSp * 14;
    avatarSize = widthDp * 25;
    textItemSpacing = widthDp * 15;
    jobTypeItemHeight = widthDp * 20;
  }
}

class JobListWidgetMobileStyles extends JobListWidgetStyles {
  JobListWidgetMobileStyles(BuildContext context) : super(context) {
    ScreenUtil.init(
      context,
      width: ResponsibleDesignSettings.mobileDesignWidth,
      height: ResponsibleDesignSettings.mobileDesignHeight,
      allowFontScaling: false,
    );

    devicePixelRatio = ScreenUtil.pixelRatio;
    deviceWidth = ScreenUtil.screenWidth;
    deviceHeight = ScreenUtil.screenHeight;
    statusbarHeight = ScreenUtil.statusBarHeight;
    appbarHeight = AppBar().preferredSize.height;
    bottombarHeight = ScreenUtil.bottomBarHeight;
    safeAreaHeight = deviceHeight - statusbarHeight - appbarHeight - bottombarHeight;
    shareWidth = deviceWidth / 100;
    shareHeight = deviceHeight / 100;
    widthDp = ScreenUtil().setWidth(1);
    heightDp = ScreenUtil().setHeight(1);
    fontSp = ScreenUtil().setSp(1, allowFontScalingSelf: false);
  }
}
