import 'package:flutter/material.dart';

class JobPortalPageColors {
  Color primaryColor;
  Color backgroundColor;
  Color textColor;

  Color tabBarBorderColor;
  Color unSelectedTabColor;
  Color selectedFilterItemColor;
  Color selectedFilterItemBorderColor;
  Color unSelectedFilterItemBorderColor;

  Color primaryButtonColor;
  Color secondaryButtonColor;

  Color jobCardColor1;

  JobPortalPageColors() {
    primaryColor = Color(0xFFB58970);

    tabBarBorderColor = Color(0xFF404040);
    unSelectedTabColor = Color(0xFF7B7B7B);
    selectedFilterItemColor = Color(0xFFDDBCA4);

    primaryButtonColor = primaryColor;
    secondaryButtonColor = Color(0xFFA4A4A4);

    jobCardColor1 = Color(0xFF232323);
  }
}

class JobPortalPageDarkModeColors extends JobPortalPageColors {
  JobPortalPageDarkModeColors() {
    backgroundColor = Colors.black;
    textColor = Colors.white;
    selectedFilterItemBorderColor = Colors.white;
    unSelectedFilterItemBorderColor = Colors.white;
  }
}

class JobPortalPageLightModeColors extends JobPortalPageColors {
  JobPortalPageLightModeColors() {
    backgroundColor = Colors.white;
    textColor = Colors.black;
    selectedFilterItemBorderColor = Colors.grey;
    unSelectedFilterItemBorderColor = Colors.grey;
  }
}
