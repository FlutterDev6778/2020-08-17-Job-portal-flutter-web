import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/models/job_model.dart';
import 'package:job_portal/src/pages/JobPortalPage/Components/JobPanelButttonGroup/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';
import 'package:date_time_format/date_time_format.dart';

import 'index.dart';

class JobListWidget extends StatelessWidget {
  JobListWidget({
    @required this.panelIndex,
    @required this.jobModel,
    @required this.themeMode,
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
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

  JobListWidgetStyles _jobListWidgetStyles;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (MediaQuery.of(context).size.width >= 900) {
        _jobListWidgetStyles = JobListWidgetDesktopStyles(context);
      } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
        ////  tablet
        _jobListWidgetStyles = JobListWidgetTabletStyles(context);
      } else if (MediaQuery.of(context).size.width < 600) {
        _jobListWidgetStyles = JobListWidgetMobileStyles(context);
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

    return Column(
      children: [
        Container(
          height: _jobListWidgetStyles.cardHeight,
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: _jobListWidgetStyles.cardHorizontalPadding,
            vertical: _jobListWidgetStyles.cardVerticalPadding,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// job description
                          Text(
                            jobModel.title,
                            style: TextStyle(fontSize: _jobListWidgetStyles.titleFontSize, color: jobPortalPageColors.textColor),
                          ),
                          SizedBox(height: _jobListWidgetStyles.textItemSpacing),
                          Text(
                            jobModel.companyName,
                            style: TextStyle(fontSize: _jobListWidgetStyles.textFontSize, color: jobPortalPageColors.textColor),
                          ),
                          SizedBox(height: _jobListWidgetStyles.textItemSpacing),
                          Row(
                            children: [
                              Text(
                                DateTimeFormat.format(DateTime.fromMillisecondsSinceEpoch(jobModel.createdTs), format: "d/m/Y"),
                                style: TextStyle(fontSize: _jobListWidgetStyles.textFontSize, color: jobPortalPageColors.textColor),
                              ),
                              SizedBox(width: _jobListWidgetStyles.textItemSpacing),
                              Text(
                                jobModel.location,
                                style: TextStyle(fontSize: _jobListWidgetStyles.textFontSize, color: jobPortalPageColors.textColor),
                              ),
                            ],
                          ),
                          SizedBox(height: _jobListWidgetStyles.textItemSpacing),
                          Wrap(
                            spacing: _jobListWidgetStyles.widthDp * 10,
                            runSpacing: _jobListWidgetStyles.widthDp * 10,
                            children: jobModel.jobTypeList.map((String item) {
                              return Container(
                                width: _jobListWidgetStyles.widthDp * 8 + item.length * _jobListWidgetStyles.smallFontSize * 0.7,
                                height: _jobListWidgetStyles.jobTypeItemHeight,
                                padding: EdgeInsets.symmetric(horizontal: _jobListWidgetStyles.widthDp * 8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(_jobListWidgetStyles.jobTypeItemHeight / 2),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: _jobListWidgetStyles.smallFontSize, color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: _jobListWidgetStyles.textItemSpacing),
                          Wrap(
                            spacing: _jobListWidgetStyles.widthDp * 10,
                            runSpacing: _jobListWidgetStyles.widthDp * 10,
                            children: jobModel.experiences.map((String item) {
                              return Container(
                                width: _jobListWidgetStyles.widthDp * 16 + item.length * _jobListWidgetStyles.smallFontSize * 0.5,
                                height: _jobListWidgetStyles.jobTypeItemHeight,
                                padding: EdgeInsets.symmetric(horizontal: _jobListWidgetStyles.widthDp * 8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(_jobListWidgetStyles.jobTypeItemHeight / 2),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: _jobListWidgetStyles.smallFontSize, color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _jobListWidgetStyles.textItemSpacing + _jobListWidgetStyles.widthDp * 4),
                    Container(
                      width: double.infinity,
                      child: Text(
                        jobModel.roleOverView,
                        style: TextStyle(fontSize: _jobListWidgetStyles.textFontSize, color: jobPortalPageColors.textColor),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: _jobListWidgetStyles.widthDp * 60),
              Container(
                width: _jobListWidgetStyles.buttonWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// applied Employees
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          JobListWidgetString.otherApplicantsLabel,
                          style: TextStyle(
                            fontSize: _jobListWidgetStyles.smallFontSize,
                            color: jobPortalPageColors.textColor,
                          ),
                        ),
                        SizedBox(height: _jobListWidgetStyles.widthDp * 5),
                        CustomAvatarStackWidget(
                          avatarSize: _jobListWidgetStyles.avatarSize,
                          userData: userDataList,
                        ),
                      ],
                    ),

                    JobPanelButtonGroup(
                      panelIndex: panelIndex,
                      themeMode: themeMode,
                      jobModel: jobModel,
                      buttonsState: {"details": true, "save": true},
                      spacing: _jobListWidgetStyles.widthDp * 16,
                      aboveSpace: true,
                      belowSpace: false,
                      jobPortalPageColors: jobPortalPageColors,
                      jobPortalBloc: jobPortalBloc,
                      jobPortalState: jobPortalState,
                      candidateJobListBloc: candidateJobListBloc,
                      candidateJobListState: candidateJobListState,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 90, thickness: 1, color: jobPortalPageColors.primaryColor),
      ],
    );
  }
}
