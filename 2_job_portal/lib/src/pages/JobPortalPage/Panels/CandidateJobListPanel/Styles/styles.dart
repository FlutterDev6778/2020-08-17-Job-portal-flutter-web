import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_portal/src/Config/resposible_settings.dart';

class CandidateJobListPanelStyles {
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
  double jobListPanelHorizontalSpacing;
  double jobCardWidgetSpacing;
  double jobCardWidgetRunSpacing;

  CandidateJobListPanelStyles(BuildContext context) {}
}

class CandidateJobListPanelDesktopStyles extends CandidateJobListPanelStyles {
  CandidateJobListPanelDesktopStyles(BuildContext context) : super(context) {
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
    primaryHorizontalVerticalPadding = widthDp * 16;
    jobListPanelHorizontalSpacing = widthDp * 38;
    jobCardWidgetSpacing = widthDp * 33;
    jobCardWidgetRunSpacing = widthDp * 42;
  }
}

class CandidateJobListPanelTabletStyles extends CandidateJobListPanelStyles {
  CandidateJobListPanelTabletStyles(BuildContext context) : super(context) {
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
    primaryHorizontalVerticalPadding = widthDp * 16;
    jobListPanelHorizontalSpacing = widthDp * 38;
    jobCardWidgetSpacing = widthDp * 33;
    jobCardWidgetRunSpacing = widthDp * 42;
  }
}

class CandidateJobListPanelMobileStyles extends CandidateJobListPanelStyles {
  CandidateJobListPanelMobileStyles(BuildContext context) : super(context) {
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

    primaryHorizontalPaddingPadding = widthDp * 50;
    primaryHorizontalVerticalPadding = widthDp * 0;
    jobListPanelHorizontalSpacing = widthDp * 0;
    jobCardWidgetSpacing = widthDp * 33;
    jobCardWidgetRunSpacing = widthDp * 32;
  }
}
