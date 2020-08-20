import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';

class TitleBarForDesktop extends StatelessWidget {
  TitleBarForDesktop({
    @required this.jobPortalPageColors,
    @required this.jobPortalPageStyles,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
  });

  JobPortalPageStyles jobPortalPageStyles;
  JobPortalPageColors jobPortalPageColors;

  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: jobPortalPageStyles.deviceWidth,
      padding: EdgeInsets.symmetric(
        horizontal: jobPortalPageStyles.titleBarHorizontalPadding,
        vertical: jobPortalPageStyles.titleBarVerticalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            JobPortalPageString.titleBarTitle,
            style: TextStyle(fontSize: jobPortalPageStyles.titleBarFontSize, color: jobPortalPageColors.textColor),
          ),
          Row(
            children: [
              CustomRaisedButton(
                width: jobPortalPageStyles.titleBarButtonWidth,
                height: jobPortalPageStyles.titleBarButtonHeight,
                color: Colors.transparent,
                borderWidth: 2,
                borderColor: jobPortalPageColors.textColor,
                borderRadius: jobPortalPageStyles.widthDp * 6,
                child: Text(
                  JobPortalPageString.titleBarButton1Text,
                  style: TextStyle(fontSize: jobPortalPageStyles.titleBarButtonFontSize, color: jobPortalPageColors.textColor),
                ),
                elevation: 0,
                onPressed: () {},
              ),
              SizedBox(width: jobPortalPageStyles.titleBarButtonSpacing),
              CustomRaisedButton(
                width: jobPortalPageStyles.titleBarButtonWidth,
                height: jobPortalPageStyles.titleBarButtonHeight,
                color: Colors.transparent,
                borderWidth: 2,
                borderColor: jobPortalPageColors.textColor,
                borderRadius: jobPortalPageStyles.widthDp * 6,
                child: Text(
                  JobPortalPageString.titleBarButton2Text,
                  style: TextStyle(fontSize: jobPortalPageStyles.titleBarButtonFontSize, color: jobPortalPageColors.textColor),
                ),
                elevation: 0,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
