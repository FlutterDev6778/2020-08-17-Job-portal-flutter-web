import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/models/job_model.dart';
import 'package:job_portal/src/pages/JobPortalPage/Components/JobPanelButttonGroup/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';
import 'package:date_time_format/date_time_format.dart';

import 'index.dart';

class JobCardWidget extends StatelessWidget {
  JobCardWidget({
    @required this.type,
    @required this.jobModel,
    @required this.panelIndex,
    @required this.themeMode,
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
    this.candidateJobListBloc,
    this.candidateJobListState,
    this.replacementState = false,
    this.width,
    this.height,
  });

  int type;
  int panelIndex;
  String themeMode;
  JobModel jobModel;
  JobPortalPageColors jobPortalPageColors;
  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;
  CandidateJobListBloc candidateJobListBloc;
  CandidateJobListState candidateJobListState;

  JobCardWidgetStyles _jobCardWidgetStyles;

  double width;
  double height;

  bool replacementState;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (MediaQuery.of(context).size.width >= 900) {
        _jobCardWidgetStyles = JobCardWidgetDesktopStyles(context);
      } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
        ////  tablet
        _jobCardWidgetStyles = JobCardWidgetTabletStyles(context);
      } else if (MediaQuery.of(context).size.width < 600) {
        _jobCardWidgetStyles = JobCardWidgetMobileStyles(context);
      }

      return _containerMain(context);
    });
  }

  Widget _containerMain(BuildContext context) {
    List<Map<String, dynamic>> userDataList = [
      {
        "name": "kyuk",
        "avatarUrl": "https://www.lovettdentistrywebster.com/wp-content/uploads/2019/12/whitening_14.jpg",
      },
      {
        "name": "ewrer",
        "avatarUrl": "https://marinortho.com/wp-content/uploads/2019/05/5-heather.jpg",
      },
      {
        "name": "aag",
      },
      {
        "name": "gegd",
        "avatarUrl": "https://www.pickndazzle.com/upload/beauty-buzz/7-things-french-women-never-do-to-their-hair/French.jpg",
      },
      {
        "name": "gegd",
        "avatarUrl": "https://www.pickndazzle.com/upload/beauty-buzz/7-things-french-women-never-do-to-their-hair/French.jpg",
      },
      {
        "name": "gegd",
        "avatarUrl": "https://www.pickndazzle.com/upload/beauty-buzz/7-things-french-women-never-do-to-their-hair/French.jpg",
      },
      {
        "name": "gegd",
        "avatarUrl": "https://www.pickndazzle.com/upload/beauty-buzz/7-things-french-women-never-do-to-their-hair/French.jpg",
      },
    ];

    return Container(
      width: width ?? _jobCardWidgetStyles.cardWidth,
      height: height ?? _jobCardWidgetStyles.cardHeight,
      color: (type == 0) ? Colors.transparent : jobPortalPageColors.jobCardColor1,
      padding: EdgeInsets.symmetric(
        horizontal: _jobCardWidgetStyles.cardHorizontalPadding,
        vertical: _jobCardWidgetStyles.cardVerticalPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// job description
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobModel.title,
                  style: TextStyle(fontSize: _jobCardWidgetStyles.titleFontSize, color: (type == 1) ? Colors.white : jobPortalPageColors.textColor),
                ),
                // SizedBox(height: _jobCardWidgetStyles.textItemSpacing),
                Text(
                  jobModel.companyName,
                  style: TextStyle(fontSize: _jobCardWidgetStyles.textFontSize, color: (type == 1) ? Colors.white : jobPortalPageColors.textColor),
                ),
                // SizedBox(height: _jobCardWidgetStyles.textItemSpacing),
                Text(
                  DateTimeFormat.format(DateTime.fromMillisecondsSinceEpoch(jobModel.createdTs), format: "d/m/Y"),
                  style: TextStyle(fontSize: _jobCardWidgetStyles.textFontSize, color: (type == 1) ? Colors.white : jobPortalPageColors.textColor),
                ),
                // SizedBox(height: _jobCardWidgetStyles.textItemSpacing),
                Text(
                  jobModel.location,
                  style: TextStyle(fontSize: _jobCardWidgetStyles.textFontSize, color: (type == 1) ? Colors.white : jobPortalPageColors.textColor),
                ),
                // SizedBox(height: _jobCardWidgetStyles.textItemSpacing),
                Wrap(
                  spacing: _jobCardWidgetStyles.widthDp * 10,
                  runSpacing: _jobCardWidgetStyles.widthDp * 10,
                  children: jobModel.jobTypeList.map((String item) {
                    return Container(
                      width: _jobCardWidgetStyles.widthDp * 8 + item.length * _jobCardWidgetStyles.smallFontSize * 0.7,
                      height: _jobCardWidgetStyles.jobTypeItemHeight,
                      padding: EdgeInsets.symmetric(horizontal: _jobCardWidgetStyles.widthDp * 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(_jobCardWidgetStyles.jobTypeItemHeight / 2),
                        color: Colors.white,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(fontSize: _jobCardWidgetStyles.smallFontSize, color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
                // SizedBox(height: _jobCardWidgetStyles.textItemSpacing),
                Wrap(
                  spacing: _jobCardWidgetStyles.widthDp * 10,
                  runSpacing: _jobCardWidgetStyles.widthDp * 10,
                  children: jobModel.experiences.map((String item) {
                    return Container(
                      width: _jobCardWidgetStyles.widthDp * 16 + item.length * _jobCardWidgetStyles.smallFontSize * 0.5,
                      height: _jobCardWidgetStyles.jobTypeItemHeight,
                      padding: EdgeInsets.symmetric(horizontal: _jobCardWidgetStyles.widthDp * 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(_jobCardWidgetStyles.jobTypeItemHeight / 2),
                        color: Colors.white,
                      ),
                      child: Text(
                        item,
                        style: TextStyle(fontSize: _jobCardWidgetStyles.smallFontSize, color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          /// applied Employees
          SizedBox(height: _jobCardWidgetStyles.widthDp * 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                JobCardWidgetString.otherApplicantsLabel,
                style: TextStyle(
                  fontSize: _jobCardWidgetStyles.smallFontSize,
                  color: (type == 1) ? Colors.white : jobPortalPageColors.textColor,
                ),
              ),
              SizedBox(height: _jobCardWidgetStyles.widthDp * 5),
              CustomAvatarStackWidget(
                avatarSize: _jobCardWidgetStyles.avatarSize,
                userData: userDataList,
              ),
            ],
          ),

          /// buttons
          SizedBox(height: _jobCardWidgetStyles.widthDp * 8),
          JobPanelButtonGroup(
            panelIndex: panelIndex,
            themeMode: themeMode,
            jobModel: jobModel,
            buttonsState: {"details": true, "save": true},
            spacing: _jobCardWidgetStyles.widthDp * 16,
            aboveSpace: true,
            belowSpace: false,
            replacementState: replacementState,
            jobPortalPageColors: jobPortalPageColors,
            jobPortalBloc: jobPortalBloc,
            jobPortalState: jobPortalState,
            candidateJobListBloc: candidateJobListBloc,
            candidateJobListState: candidateJobListState,
          ),
        ],
      ),
    );
  }
}
