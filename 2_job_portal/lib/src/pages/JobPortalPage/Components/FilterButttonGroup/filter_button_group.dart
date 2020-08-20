import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/models/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/utils/index.dart';
import 'package:job_portal/src/widgets/index.dart';

import 'index.dart';

class FilterButtonGroup extends StatelessWidget {
  FilterButtonGroup({
    @required this.panelIndex,
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
    this.candidateJobListBloc,
    this.candidateJobListState,
  });

  int panelIndex;

  JobPortalPageColors jobPortalPageColors;
  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;
  CandidateJobListBloc candidateJobListBloc;
  CandidateJobListState candidateJobListState;

  FilterButtonGroupStyles _filterButtonGroupStyles;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 900) {
      _filterButtonGroupStyles = FilterButtonGroupDesktopStyles(context);
    } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
      _filterButtonGroupStyles = FilterButtonGroupTabletStyles(context);
    } else if (MediaQuery.of(context).size.width < 600) {
      _filterButtonGroupStyles = FilterButtonGroupMobileStyles(context);
    }

    return _containerMain(context);
  }

  Widget _containerMain(BuildContext context) {
    return Container(
      width: _filterButtonGroupStyles.filterPanelWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// SaveFilterData
          CustomRaisedButton(
            width: _filterButtonGroupStyles.filterPanelButtonWidth,
            height: _filterButtonGroupStyles.filterPanelButtonHeight,
            color: Colors.transparent,
            borderColor: jobPortalPageColors.primaryColor,
            borderWidth: _filterButtonGroupStyles.widthDp * 2,
            borderRadius: _filterButtonGroupStyles.widthDp * 6,
            child: Text(
              FilterButtonGroupString.saveFilterButtonLabel,
              style: TextStyle(
                fontSize: _filterButtonGroupStyles.filterPanelButtonTextFontSize,
                color: jobPortalPageColors.primaryColor,
              ),
            ),
            onPressed: () {},
          ),

          /// ClearFilterData
          SizedBox(height: _filterButtonGroupStyles.widthDp * 32),
          CustomRaisedButton(
            width: _filterButtonGroupStyles.filterPanelButtonWidth,
            height: _filterButtonGroupStyles.filterPanelButtonHeight,
            color: Colors.transparent,
            borderColor: Colors.grey,
            borderWidth: _filterButtonGroupStyles.widthDp * 2,
            borderRadius: _filterButtonGroupStyles.widthDp * 6,
            child: Text(
              FilterButtonGroupString.clearFilterButtonLabel,
              style: TextStyle(
                fontSize: _filterButtonGroupStyles.filterPanelButtonTextFontSize,
                color: Colors.grey,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
