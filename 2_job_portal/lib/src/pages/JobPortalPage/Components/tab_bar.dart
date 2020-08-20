import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';
import 'package:provider/provider.dart';

class TabBarComponent extends StatelessWidget {
  TabBarComponent({
    @required this.jobPortalPageColors,
    @required this.jobPortalPageStyles,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
    @required this.tabController,
  });

  JobPortalPageStyles jobPortalPageStyles;
  JobPortalPageColors jobPortalPageColors;

  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: jobPortalPageStyles.tabBarVerticalPadding),
      child: Container(
        width: jobPortalPageStyles.deviceWidth - jobPortalPageStyles.primaryHorizontalPadding * 2,
        height: jobPortalPageStyles.tabBarHeight,
        decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(width: 3, color: jobPortalPageColors.tabBarBorderColor))),
        child: TabBar(
          controller: tabController,
          labelStyle: TextStyle(fontSize: jobPortalPageStyles.tabBarLabelFontSize, fontWeight: FontWeight.bold),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: jobPortalPageColors.textColor,
          unselectedLabelColor: jobPortalPageColors.unSelectedTabColor,
          indicatorColor: jobPortalPageColors.primaryColor,
          indicatorWeight: 5,
          isScrollable: (jobPortalPageStyles.runtimeType == JobPortalPageMobileStyles) ? true : false,
          tabs: JobPortalPageString.tabStringList.map((item) {
            return Text(
              item,
              style: TextStyle(fontSize: jobPortalPageStyles.tabBarLabelFontSize, fontWeight: FontWeight.bold),
            );
          }).toList(),
        ),
      ),
    );
  }
}
