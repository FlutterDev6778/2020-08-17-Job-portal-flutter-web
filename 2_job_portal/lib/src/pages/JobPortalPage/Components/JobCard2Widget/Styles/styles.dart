import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_portal/src/Config/resposible_settings.dart';

class JobCard2WidgetStyles {
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
  double textItemSpacing;
  double jobTypeItemHeight;

  double closeIconSize;
  double closeIconPadding;

  JobCard2WidgetStyles(BuildContext context) {}
}

class JobCard2WidgetDesktopStyles extends JobCard2WidgetStyles {
  JobCard2WidgetDesktopStyles(BuildContext context) : super(context) {
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

    cardWidth = widthDp * 254;
    cardHeight = widthDp * 300;
    cardHorizontalPadding = widthDp * 22;
    cardVerticalPadding = widthDp * 25;
    titleFontSize = fontSp * 18;
    textFontSize = fontSp * 14;
    smallFontSize = fontSp * 12;
    buttonWidth = double.infinity;
    buttonHeight = widthDp * 32;
    buttonTextFontSize = fontSp * 14;
    textItemSpacing = widthDp * 15;
    jobTypeItemHeight = widthDp * 22;

    closeIconSize = widthDp * 16;
    closeIconPadding = widthDp * 12;
  }
}

class JobCard2WidgetTabletStyles extends JobCard2WidgetStyles {
  JobCard2WidgetTabletStyles(BuildContext context) : super(context) {
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

    cardWidth = widthDp * 254;
    cardHeight = widthDp * 300;
    cardHorizontalPadding = widthDp * 22;
    cardVerticalPadding = widthDp * 25;
    titleFontSize = fontSp * 18;
    textFontSize = fontSp * 14;
    smallFontSize = fontSp * 12;
    buttonWidth = double.infinity;
    buttonHeight = widthDp * 32;
    buttonTextFontSize = fontSp * 14;
    textItemSpacing = widthDp * 15;
    jobTypeItemHeight = widthDp * 22;

    closeIconSize = widthDp * 12;
    closeIconPadding = widthDp * 12;
  }
}

class JobCard2WidgetMobileStyles extends JobCard2WidgetStyles {
  JobCard2WidgetMobileStyles(BuildContext context) : super(context) {
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

    cardWidth = widthDp * 254;
    cardHeight = widthDp * 300;
    cardHorizontalPadding = widthDp * 22;
    cardVerticalPadding = widthDp * 25;
    titleFontSize = fontSp * 18;
    textFontSize = fontSp * 14;
    smallFontSize = fontSp * 12;
    buttonWidth = double.infinity;
    buttonHeight = widthDp * 32;
    buttonTextFontSize = fontSp * 14;
    textItemSpacing = widthDp * 15;
    jobTypeItemHeight = widthDp * 22;

    closeIconSize = widthDp * 12;
    closeIconPadding = widthDp * 12;
  }
}
