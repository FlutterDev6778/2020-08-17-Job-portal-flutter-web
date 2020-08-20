import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_portal/src/Config/resposible_settings.dart';

class JobPortalPageStyles {
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

  double primaryHorizontalPadding;
  double primaryVerticalPadding;

  /// TitleBarForDesktop
  double titleBarHorizontalPadding;
  double titleBarVerticalPadding;
  double titleBarFontSize;
  double titleBarButtonWidth;
  double titleBarButtonHeight;
  double titleBarButtonFontSize;
  double titleBarButtonSpacing;

  /// MapView
  double mapViewComponentHeight;

  /// SearchBar
  double searchBarTextFieldWidth;
  double searchBarTextFieldHeight;
  double searchBarSearchButtonWidth;
  double searchBarSearchButtonHeight;
  double searchBarTextFontSize;
  double searchBarSearchButtonFontSize;
  double searchBarTextFieldContentsHorizontalPadding;
  double searchBarIconSize;

  /// TabBar
  double tabBarHeight;
  double tabBarVerticalPadding;
  double tabBarLabelFontSize;

  // /// TabViewPanel
  // double tabViewPanelHorizontalPadding;
  // double tabViewPanelVerticalPadding;

  // /// jobCardWidget spacing
  // double jobCardWidgetSpacing;
  // double jobCardWidgetRunSpacing;

  JobPortalPageStyles(BuildContext context) {}
}

class JobPortalPageDesktopStyles extends JobPortalPageStyles {
  JobPortalPageDesktopStyles(BuildContext context) : super(context) {
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

    primaryHorizontalPadding = widthDp * 26;
    primaryVerticalPadding = widthDp * 10;

    /// TitleBarForDesktop
    titleBarHorizontalPadding = widthDp * 107;
    titleBarVerticalPadding = widthDp * 24;
    titleBarFontSize = fontSp * 38;
    titleBarButtonWidth = widthDp * 219;
    titleBarButtonHeight = widthDp * 42;
    titleBarButtonFontSize = fontSp * 18;
    titleBarButtonSpacing = widthDp * 60;

    /// MapView
    mapViewComponentHeight = widthDp * 468;

    /// SearchBar
    searchBarTextFieldWidth = widthDp * 500;
    searchBarTextFieldHeight = widthDp * 40;
    searchBarSearchButtonWidth = widthDp * 147;
    searchBarSearchButtonHeight = widthDp * 40;
    searchBarTextFontSize = fontSp * 18;
    searchBarSearchButtonFontSize = fontSp * 14;
    searchBarTextFieldContentsHorizontalPadding = widthDp * 20;
    searchBarIconSize = widthDp * 24;

    /// TabBar
    tabBarHeight = widthDp * 50;
    tabBarVerticalPadding = widthDp * 40;
    tabBarLabelFontSize = fontSp * 24;
  }
}

class JobPortalPageTabletStyles extends JobPortalPageStyles {
  JobPortalPageTabletStyles(BuildContext context) : super(context) {
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

    primaryHorizontalPadding = widthDp * 26;
    primaryVerticalPadding = widthDp * 10;

    /// TitleBarForDesktop
    titleBarHorizontalPadding = widthDp * 107;
    titleBarVerticalPadding = widthDp * 24;
    titleBarFontSize = fontSp * 38;
    titleBarButtonWidth = widthDp * 219;
    titleBarButtonHeight = widthDp * 42;
    titleBarButtonFontSize = fontSp * 18;
    titleBarButtonSpacing = widthDp * 60;

    /// MapView
    mapViewComponentHeight = widthDp * 406;

    /// SearchBar
    searchBarTextFieldWidth = widthDp * 500;
    searchBarTextFieldHeight = widthDp * 40;
    searchBarSearchButtonWidth = widthDp * 147;
    searchBarSearchButtonHeight = widthDp * 40;
    searchBarTextFontSize = fontSp * 18;
    searchBarSearchButtonFontSize = fontSp * 14;
    searchBarTextFieldContentsHorizontalPadding = widthDp * 20;
    searchBarIconSize = widthDp * 24;

    /// TabBar
    tabBarHeight = widthDp * 50;
    tabBarVerticalPadding = widthDp * 40;
    tabBarLabelFontSize = fontSp * 24;
  }
}

class JobPortalPageMobileStyles extends JobPortalPageStyles {
  JobPortalPageMobileStyles(BuildContext context) : super(context) {
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

    primaryHorizontalPadding = widthDp * 10;
    primaryVerticalPadding = widthDp * 10;

    /// MapView
    mapViewComponentHeight = widthDp * 344;

    /// SearchBar
    searchBarTextFieldWidth = double.infinity;
    searchBarTextFieldHeight = widthDp * 40;
    searchBarSearchButtonWidth = widthDp * 50;
    searchBarSearchButtonHeight = widthDp * 40;
    searchBarTextFontSize = fontSp * 18;
    searchBarSearchButtonFontSize = fontSp * 14;
    searchBarTextFieldContentsHorizontalPadding = widthDp * 20;
    searchBarIconSize = widthDp * 24;

    /// TabBar
    tabBarHeight = widthDp * 35;
    tabBarVerticalPadding = widthDp * 40;
    tabBarLabelFontSize = fontSp * 18;
  }
}
