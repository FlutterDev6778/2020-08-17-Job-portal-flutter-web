import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/models/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Panels/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/utils/index.dart';
import 'package:job_portal/src/widgets/index.dart';

import 'index.dart';

class JobPanelButtonGroup extends StatelessWidget {
  JobPanelButtonGroup({
    @required this.panelIndex,
    @required this.themeMode,
    @required this.jobModel,
    @required this.spacing,
    @required this.aboveSpace,
    @required this.belowSpace,
    this.buttonWidth,
    this.buttonHeight,
    this.replacementState = false,
    ////
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
    @required this.buttonsState,
    this.candidateJobListBloc,
    this.candidateJobListState,
  });

  int panelIndex;
  String themeMode;
  JobModel jobModel;
  JobPortalPageColors jobPortalPageColors;
  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  CandidateJobListBloc candidateJobListBloc;
  CandidateJobListState candidateJobListState;

  bool replacementState;

  Map<String, bool> buttonsState;
  double buttonWidth;
  double buttonHeight;
  double spacing;
  bool aboveSpace;
  bool belowSpace;

  JobPanelButtonGroupStyles _detailJobButtonGroupStyles;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 900) {
      _detailJobButtonGroupStyles = JobPanelButtonGroupDesktopStyles(context);
    } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
      _detailJobButtonGroupStyles = JobPanelButtonGroupTabletStyles(context);
    } else if (MediaQuery.of(context).size.width < 600) {
      _detailJobButtonGroupStyles = JobPanelButtonGroupMobileStyles(context);
    }

    return _containerMain(context);
  }

  Widget _containerMain(BuildContext context) {
    return Container(
      width: buttonWidth ?? _detailJobButtonGroupStyles.buttonWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Details button
          (aboveSpace && buttonsState["details"] != null && buttonsState["details"]) ? SizedBox(height: spacing) : SizedBox(),
          (buttonsState["details"] != null && buttonsState["details"])
              ? CustomRaisedButton(
                  width: buttonWidth ?? _detailJobButtonGroupStyles.buttonWidth,
                  height: buttonHeight ?? _detailJobButtonGroupStyles.buttonHeight,
                  color: Colors.transparent,
                  borderColor: jobPortalPageColors.primaryColor,
                  borderWidth: _detailJobButtonGroupStyles.widthDp * 2,
                  borderRadius: _detailJobButtonGroupStyles.widthDp * 6,
                  child: Text(
                    JobPanelButtonGroupString.detailsButtonLabel,
                    style: TextStyle(
                      fontSize: _detailJobButtonGroupStyles.buttonTextFontSize,
                      color: jobPortalPageColors.primaryColor,
                    ),
                  ),
                  onPressed: () {
                    if (replacementState)
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => JobDetailsPanel(
                            panelIndex: panelIndex,
                            themeMode: themeMode,
                            jobModel: jobModel,
                            jobPortalPageColors: jobPortalPageColors,
                            jobPortalBloc: jobPortalBloc,
                            jobPortalState: jobPortalState,
                            candidateJobListBloc: candidateJobListBloc,
                            candidateJobListState: candidateJobListState,
                          ),
                        ),
                      );
                    else
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => JobDetailsPanel(
                            panelIndex: panelIndex,
                            themeMode: themeMode,
                            jobModel: jobModel,
                            jobPortalPageColors: jobPortalPageColors,
                            jobPortalBloc: jobPortalBloc,
                            jobPortalState: jobPortalState,
                            candidateJobListBloc: candidateJobListBloc,
                            candidateJobListState: candidateJobListState,
                          ),
                        ),
                      );
                  },
                )
              : SizedBox(),
          (belowSpace && buttonsState["details"] != null && buttonsState["details"]) ? SizedBox(height: spacing) : SizedBox(),

          /// SaveButton
          (aboveSpace && buttonsState["save"] != null && buttonsState["save"]) ? SizedBox(height: spacing) : SizedBox(),
          (buttonsState["save"] != null && buttonsState["save"])
              ? CustomRaisedButton(
                  width: buttonWidth ?? _detailJobButtonGroupStyles.buttonWidth,
                  height: buttonHeight ?? _detailJobButtonGroupStyles.buttonHeight,
                  color: Colors.transparent,
                  borderColor: Colors.grey,
                  borderWidth: _detailJobButtonGroupStyles.widthDp * 2,
                  borderRadius: _detailJobButtonGroupStyles.widthDp * 6,
                  child: Text(
                    JobPanelButtonGroupString.saveButtonLabel,
                    style: TextStyle(
                      fontSize: _detailJobButtonGroupStyles.buttonTextFontSize,
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {},
                )
              : SizedBox(),
          (belowSpace && buttonsState["save"] != null && buttonsState["save"]) ? SizedBox(height: spacing) : SizedBox(),

          /// Apply button
          (aboveSpace && buttonsState["apply"] != null && buttonsState["apply"]) ? SizedBox(height: spacing) : SizedBox(),
          (buttonsState["apply"] != null && buttonsState["apply"])
              ? CustomRaisedButton(
                  width: buttonWidth ?? _detailJobButtonGroupStyles.buttonWidth,
                  height: buttonHeight ?? _detailJobButtonGroupStyles.buttonHeight,
                  color: Colors.transparent,
                  borderColor: Colors.grey,
                  borderWidth: _detailJobButtonGroupStyles.widthDp * 2,
                  borderRadius: _detailJobButtonGroupStyles.widthDp * 6,
                  child: Text(
                    JobPanelButtonGroupString.applyButtonLabel,
                    style: TextStyle(
                      fontSize: _detailJobButtonGroupStyles.buttonTextFontSize,
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {},
                )
              : SizedBox(),
          (belowSpace && buttonsState["apply"] != null && buttonsState["apply"]) ? SizedBox(height: spacing) : SizedBox(),
        ],
      ),
    );
  }
}
