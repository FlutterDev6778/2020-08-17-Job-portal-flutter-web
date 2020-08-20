import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_portal/src/Config/resposible_settings.dart';

class JobDetailsPanelStyles {
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

  double primaryHorizontalPaddingPadding;
  double primaryHorizontalVerticalPadding;
  double appbarHorizontalPadding;
  double appbarVericalPadding;
  double mainPanelHorizontalPadding;
  double mainPanelVerticalPadding;
  double leftPanelWidth;
  double mainPanelWidth;
  double rightPanelWidth;

  double appbarTitleFontSize;
  double appbarBackIconSize;
  double jobTitleFontSize;
  double descriptionFontSize;
  double mediumTextFontSize;
  double smallTextFontSize;

  JobDetailsPanelStyles(BuildContext context) {}
}

class JobDetailsPanelDesktopStyles extends JobDetailsPanelStyles {
  JobDetailsPanelDesktopStyles(BuildContext context) : super(context) {
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

    primaryHorizontalPaddingPadding = widthDp * 75;
    primaryHorizontalVerticalPadding = widthDp * 26;
    appbarHorizontalPadding = widthDp * 25;
    appbarVericalPadding = widthDp * 38;
    mainPanelHorizontalPadding = widthDp * 52;
    mainPanelVerticalPadding = widthDp * 0;

    leftPanelWidth = widthDp * 250;
    rightPanelWidth = widthDp * 254;
    mainPanelWidth = deviceWidth - primaryHorizontalPaddingPadding * 2 - leftPanelWidth - rightPanelWidth;

    appbarTitleFontSize = fontSp * 38;
    appbarBackIconSize = widthDp * 40;
    jobTitleFontSize = fontSp * 32;
    descriptionFontSize = fontSp * 24;
    mediumTextFontSize = fontSp * 18;
    smallTextFontSize = fontSp * 12;
  }
}

class JobDetailsPanelTabletStyles extends JobDetailsPanelStyles {
  JobDetailsPanelTabletStyles(BuildContext context) : super(context) {
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

    primaryHorizontalPaddingPadding = widthDp * 75;
    primaryHorizontalVerticalPadding = widthDp * 26;
    appbarHorizontalPadding = widthDp * 25;
    appbarVericalPadding = widthDp * 38;
    mainPanelHorizontalPadding = widthDp * 52;
    mainPanelVerticalPadding = widthDp * 0;

    leftPanelWidth = widthDp * 250;
    rightPanelWidth = widthDp * 254;
    mainPanelWidth = deviceWidth - primaryHorizontalPaddingPadding * 2 - leftPanelWidth - rightPanelWidth;

    appbarTitleFontSize = fontSp * 38;
    appbarBackIconSize = widthDp * 40;
    jobTitleFontSize = fontSp * 32;
    descriptionFontSize = fontSp * 24;
    mediumTextFontSize = fontSp * 18;
    smallTextFontSize = fontSp * 12;
  }
}

class JobDetailsPanelMobileStyles extends JobDetailsPanelStyles {
  JobDetailsPanelMobileStyles(BuildContext context) : super(context) {
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

    appbarHorizontalPadding = widthDp * 28;
    appbarVericalPadding = widthDp * 24;
    primaryHorizontalPaddingPadding = widthDp * 28;
    primaryHorizontalVerticalPadding = widthDp * 33;
    mainPanelHorizontalPadding = widthDp * 0;
    mainPanelVerticalPadding = widthDp * 0;

    leftPanelWidth = widthDp * 0;
    rightPanelWidth = widthDp * 0;
    mainPanelWidth = deviceWidth - primaryHorizontalPaddingPadding * 2 - leftPanelWidth - rightPanelWidth;

    appbarTitleFontSize = fontSp * 24;
    appbarBackIconSize = widthDp * 30;
    jobTitleFontSize = fontSp * 24;
    descriptionFontSize = fontSp * 24;
    mediumTextFontSize = fontSp * 18;
    smallTextFontSize = fontSp * 12;
  }
}
