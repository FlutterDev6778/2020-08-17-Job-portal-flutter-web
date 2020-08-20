import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/models/job_model.dart';
import 'package:job_portal/src/pages/JobPortalPage/Components/JobPanelButttonGroup/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';
import 'package:date_time_format/date_time_format.dart';

import 'index.dart';

class JobCard2Widget extends StatelessWidget {
  JobCard2Widget({
    @required this.panelIndex,
    @required this.themeMode,
    @required this.jobModel,
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
    this.pipelineBloc,
    this.pipelineState,
    this.width,
    this.height,
  });

  int panelIndex;
  String themeMode;
  JobModel jobModel;

  JobPortalPageColors jobPortalPageColors;
  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;
  PipelineBloc pipelineBloc;
  PipelineState pipelineState;

  JobCard2WidgetStyles _jobCard2WidgetStyles;

  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (MediaQuery.of(context).size.width >= 900) {
        _jobCard2WidgetStyles = JobCard2WidgetDesktopStyles(context);
      } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
        ////  tablet
        _jobCard2WidgetStyles = JobCard2WidgetTabletStyles(context);
      } else if (MediaQuery.of(context).size.width < 600) {
        _jobCard2WidgetStyles = JobCard2WidgetMobileStyles(context);
      }

      return _containerMain(context);
    });
  }

  Widget _containerMain(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width ?? _jobCard2WidgetStyles.cardWidth,
          height: height ?? _jobCard2WidgetStyles.cardHeight,
          color: jobPortalPageColors.jobCardColor1,
          padding: EdgeInsets.symmetric(
            horizontal: _jobCard2WidgetStyles.cardHorizontalPadding,
            vertical: _jobCard2WidgetStyles.cardVerticalPadding,
          ),
          child: Column(
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
                      style: TextStyle(fontSize: _jobCard2WidgetStyles.titleFontSize, color: Colors.white),
                    ),
                    // SizedBox(height: _jobCard2WidgetStyles.textItemSpacing),
                    Text(
                      jobModel.companyName,
                      style: TextStyle(fontSize: _jobCard2WidgetStyles.textFontSize, color: Colors.white),
                    ),
                    // SizedBox(height: _jobCard2WidgetStyles.textItemSpacing),
                    Text(
                      DateTimeFormat.format(DateTime.fromMillisecondsSinceEpoch(jobModel.createdTs), format: "d/m/Y"),
                      style: TextStyle(fontSize: _jobCard2WidgetStyles.textFontSize, color: Colors.white),
                    ),
                    // SizedBox(height: _jobCard2WidgetStyles.textItemSpacing),
                    Text(
                      jobModel.location,
                      style: TextStyle(fontSize: _jobCard2WidgetStyles.textFontSize, color: Colors.white),
                    ),
                    // SizedBox(height: _jobCard2WidgetStyles.textItemSpacing),
                    RoundItemGroup(
                      data: jobModel.jobTypeList,
                      spacing: _jobCard2WidgetStyles.widthDp * 10,
                      runSpacing: _jobCard2WidgetStyles.widthDp * 10,
                      fontSize: _jobCard2WidgetStyles.smallFontSize,
                      itemHeight: _jobCard2WidgetStyles.jobTypeItemHeight,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    // SizedBox(height: _jobCard2WidgetStyles.textItemSpacing),
                    RoundItemGroup(
                      data: jobModel.experiences,
                      spacing: _jobCard2WidgetStyles.widthDp * 10,
                      runSpacing: _jobCard2WidgetStyles.widthDp * 10,
                      fontSize: _jobCard2WidgetStyles.smallFontSize,
                      itemHeight: _jobCard2WidgetStyles.jobTypeItemHeight,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),

              JobPanelButtonGroup(
                panelIndex: panelIndex,
                themeMode: themeMode,
                jobModel: jobModel,
                jobPortalPageColors: jobPortalPageColors,
                jobPortalBloc: jobPortalBloc,
                jobPortalState: jobPortalState,
                buttonsState: {"details": true},
                spacing: _jobCard2WidgetStyles.widthDp * 24,
                aboveSpace: true,
                belowSpace: false,
              ),
            ],
          ),
        ),
        Positioned(
          top: _jobCard2WidgetStyles.closeIconPadding,
          right: _jobCard2WidgetStyles.closeIconPadding,
          child: GestureDetector(
            child: Icon(Icons.close, size: _jobCard2WidgetStyles.closeIconSize, color: Colors.white),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
