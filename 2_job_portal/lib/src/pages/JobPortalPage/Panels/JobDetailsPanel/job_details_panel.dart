import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/models/job_model.dart';
import 'package:job_portal/src/pages/JobPortalPage/Components/JobFilterPanel/job_filter_panel.dart';
import 'package:job_portal/src/pages/JobPortalPage/Components/JobPanelButttonGroup/job_panel_button_group.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:provider/provider.dart';

import 'index.dart';

class JobDetailsPanel extends StatefulWidget {
  JobDetailsPanel({
    @required this.panelIndex,
    @required this.themeMode,
    @required this.jobModel,
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
    @required this.candidateJobListBloc,
    @required this.candidateJobListState,
  });

  int panelIndex;
  String themeMode;
  JobModel jobModel;
  JobPortalPageColors jobPortalPageColors;
  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;
  CandidateJobListBloc candidateJobListBloc;
  CandidateJobListState candidateJobListState;

  @override
  _JobDetailsPanelState createState() => _JobDetailsPanelState();
}

class _JobDetailsPanelState extends State<JobDetailsPanel> {
  JobDetailsPanelStyles _jobDetailsPanelStyles;
  JobDetailsPanelColors _jobDetailsPanelColors;
  JobDetailsBloc _jobDetailsBloc;

  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobDetailsBloc>(create: (context) => JobDetailsBloc(JobDetailsState.init())),
      ],
      child: Builder(builder: (context) {
        if (MediaQuery.of(context).size.width >= 900) {
          _jobDetailsPanelStyles = JobDetailsPanelDesktopStyles(context);
        } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
          ////  tablet
          _jobDetailsPanelStyles = JobDetailsPanelTabletStyles(context);
        } else if (MediaQuery.of(context).size.width < 600) {
          _jobDetailsPanelStyles = JobDetailsPanelMobileStyles(context);
        }

        _jobDetailsBloc = BlocProvider.of<JobDetailsBloc>(context);

        if (kIsWeb) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return _containerMain(context);
            },
          );
        } else {
          return _containerMain(context);
        }
      }),
    );
  }

  Widget _containerMain(BuildContext context) {
    print("=========  detailPage  ====================");
    return Scaffold(
      backgroundColor: widget.jobPortalPageColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _contaienrAppBar(context),
            Container(
              width: _jobDetailsPanelStyles.deviceWidth,
              padding: EdgeInsets.symmetric(
                horizontal: _jobDetailsPanelStyles.primaryHorizontalPaddingPadding,
                vertical: _jobDetailsPanelStyles.primaryHorizontalVerticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _containerLeftPanel(context),
                  Expanded(
                    child: _containerDetails(context),
                  ),
                  _containerRightPanel(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contaienrAppBar(BuildContext context) {
    return Container(
      width: _jobDetailsPanelStyles.deviceWidth,
      padding: EdgeInsets.symmetric(
        horizontal: _jobDetailsPanelStyles.appbarHorizontalPadding,
        vertical: _jobDetailsPanelStyles.appbarVericalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, size: _jobDetailsPanelStyles.appbarBackIconSize, color: widget.jobPortalPageColors.textColor),
          ),
          Text(
            JobDetailsPanelString.title,
            style: TextStyle(
              fontSize: _jobDetailsPanelStyles.appbarTitleFontSize,
              color: widget.jobPortalPageColors.textColor,
            ),
          ),
          Icon(Icons.arrow_back, size: _jobDetailsPanelStyles.appbarBackIconSize, color: Colors.transparent),
        ],
      ),
    );
  }

  Widget _containerDetails(BuildContext context) {
    return Container(
      width: _jobDetailsPanelStyles.mainPanelWidth,
      padding: EdgeInsets.symmetric(
        horizontal: _jobDetailsPanelStyles.mainPanelHorizontalPadding,
        vertical: _jobDetailsPanelStyles.mainPanelVerticalPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _containerJobCharateristics(context),
          SizedBox(height: _jobDetailsPanelStyles.widthDp * 40),
          _containerRoleOverView(context),
          SizedBox(height: _jobDetailsPanelStyles.widthDp * 50),
          _containerResponsibilities(context),
          SizedBox(height: _jobDetailsPanelStyles.widthDp * 50),
          _containerBackToTop(context),
        ],
      ),
    );
  }

  Widget _containerJobCharateristics(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.jobModel.title,
          style: TextStyle(fontSize: _jobDetailsPanelStyles.jobTitleFontSize, color: widget.jobPortalPageColors.textColor),
        ),
        SizedBox(height: _jobDetailsPanelStyles.widthDp * 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (widget.jobModel.isHourly)
                    ? Row(
                        children: [
                          Text(
                            JobDetailsPanelString.hourlyLabel,
                            style: TextStyle(
                              fontSize: _jobDetailsPanelStyles.mediumTextFontSize,
                              color: widget.jobPortalPageColors.textColor,
                            ),
                          ),
                          SizedBox(width: _jobDetailsPanelStyles.widthDp * 10),
                        ],
                      )
                    : SizedBox(),
                (widget.jobModel.isSalary)
                    ? Row(
                        children: [
                          Text(
                            JobDetailsPanelString.salaryLabel,
                            style: TextStyle(
                              fontSize: _jobDetailsPanelStyles.mediumTextFontSize,
                              color: widget.jobPortalPageColors.textColor,
                            ),
                          ),
                          SizedBox(width: _jobDetailsPanelStyles.widthDp * 10),
                        ],
                      )
                    : SizedBox(),
                Text(
                  widget.jobModel.companyName,
                  style: TextStyle(
                    fontSize: _jobDetailsPanelStyles.mediumTextFontSize,
                    color: widget.jobPortalPageColors.textColor,
                  ),
                ),
                SizedBox(width: _jobDetailsPanelStyles.widthDp * 10),
              ],
            ),
            GestureDetector(
              child: Row(
                children: [
                  Icon(
                    Icons.share,
                    size: _jobDetailsPanelStyles.mediumTextFontSize,
                    color: widget.jobPortalPageColors.primaryButtonColor,
                  ),
                  Text(
                    JobDetailsPanelString.shareLabel,
                    style: TextStyle(
                      fontSize: _jobDetailsPanelStyles.mediumTextFontSize,
                      color: widget.jobPortalPageColors.primaryButtonColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: _jobDetailsPanelStyles.widthDp * 24),
        Row(
          children: [
            RoundItemGroup(
              data: widget.jobModel.jobTypeList,
              spacing: _jobDetailsPanelStyles.widthDp * 10,
              runSpacing: _jobDetailsPanelStyles.widthDp * 10,
              fontSize: _jobDetailsPanelStyles.smallTextFontSize,
              itemHeight: _jobDetailsPanelStyles.widthDp * 24,
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderColor: Colors.black,
            ),
            SizedBox(width: _jobDetailsPanelStyles.widthDp * 20),
            RoundItemGroup(
              data: widget.jobModel.experiences,
              spacing: _jobDetailsPanelStyles.widthDp * 10,
              runSpacing: _jobDetailsPanelStyles.widthDp * 10,
              fontSize: _jobDetailsPanelStyles.smallTextFontSize,
              itemHeight: _jobDetailsPanelStyles.widthDp * 24,
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderColor: Colors.black,
            ),
          ],
        ),
        SizedBox(height: _jobDetailsPanelStyles.widthDp * 24),
      ],
    );
  }

  Widget _containerRoleOverView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            (isEditable)
                ? Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: _jobDetailsPanelStyles.descriptionFontSize,
                        color: widget.jobPortalPageColors.textColor,
                      ),
                      SizedBox(width: _jobDetailsPanelStyles.widthDp * 5),
                    ],
                  )
                : SizedBox(),
            Text(
              JobDetailsPanelString.roleOverViewLabel,
              style: TextStyle(
                fontSize: _jobDetailsPanelStyles.descriptionFontSize,
                color: widget.jobPortalPageColors.textColor,
              ),
            ),
          ],
        ),
        SizedBox(height: _jobDetailsPanelStyles.widthDp * 40),
        (!isEditable)
            ? Container(
                width: _jobDetailsPanelStyles.mainPanelWidth - _jobDetailsPanelStyles.mainPanelHorizontalPadding * 2,
                child: Text(
                  widget.jobModel.roleOverView,
                  style: TextStyle(
                    fontSize: _jobDetailsPanelStyles.descriptionFontSize,
                    color: widget.jobPortalPageColors.textColor,
                  ),
                ),
              )
            : TextFormField(
                initialValue: widget.jobModel.roleOverView,
                style: TextStyle(
                  fontSize: _jobDetailsPanelStyles.descriptionFontSize,
                  color: widget.jobPortalPageColors.textColor,
                ),
                keyboardType: TextInputType.multiline,
                maxLength: null,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: widget.jobPortalPageColors.textColor),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _containerResponsibilities(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            (isEditable)
                ? Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: _jobDetailsPanelStyles.descriptionFontSize,
                        color: widget.jobPortalPageColors.textColor,
                      ),
                      SizedBox(width: _jobDetailsPanelStyles.widthDp * 5),
                    ],
                  )
                : SizedBox(),
            Text(
              JobDetailsPanelString.responsibilitiesLabel,
              style: TextStyle(
                fontSize: _jobDetailsPanelStyles.descriptionFontSize,
                color: widget.jobPortalPageColors.textColor,
              ),
            ),
          ],
        ),
        SizedBox(height: _jobDetailsPanelStyles.widthDp * 40),
        (!isEditable)
            ? Container(
                width: _jobDetailsPanelStyles.mainPanelWidth - _jobDetailsPanelStyles.mainPanelHorizontalPadding * 2,
                child: Text(
                  widget.jobModel.roleOverView,
                  style: TextStyle(
                    fontSize: _jobDetailsPanelStyles.descriptionFontSize,
                    color: widget.jobPortalPageColors.textColor,
                  ),
                  maxLines: null,
                ),
              )
            : TextFormField(
                initialValue: widget.jobModel.responsibilities,
                style: TextStyle(
                  fontSize: _jobDetailsPanelStyles.descriptionFontSize,
                  color: widget.jobPortalPageColors.textColor,
                ),
                keyboardType: TextInputType.multiline,
                maxLength: null,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: widget.jobPortalPageColors.textColor),
                  ),
                ),
                readOnly: (!isEditable),
              ),
      ],
    );
  }

  Widget _containerBackToTop(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_upward,
          size: _jobDetailsPanelStyles.appbarBackIconSize,
          color: widget.jobPortalPageColors.primaryButtonColor,
        ),
        SizedBox(width: _jobDetailsPanelStyles.widthDp * 10),
        Text(
          JobDetailsPanelString.backToTopabel,
          style: TextStyle(
            fontSize: _jobDetailsPanelStyles.appbarTitleFontSize,
            color: widget.jobPortalPageColors.textColor,
          ),
        ),
      ],
    );
  }

  Widget _containerLeftPanel(BuildContext context) {
    if (_jobDetailsPanelStyles.runtimeType == JobDetailsPanelMobileStyles) {
      return SizedBox();
    }
    return Container(
      width: _jobDetailsPanelStyles.leftPanelWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JobPanelButtonGroup(
            panelIndex: widget.panelIndex,
            themeMode: widget.themeMode,
            jobModel: widget.jobModel,
            aboveSpace: false,
            belowSpace: true,
            buttonsState: {"apply": true, "save": true},
            spacing: _jobDetailsPanelStyles.widthDp * 32,
            jobPortalPageColors: widget.jobPortalPageColors,
            jobPortalBloc: widget.jobPortalBloc,
            jobPortalState: widget.jobPortalState,
            candidateJobListBloc: widget.candidateJobListBloc,
            candidateJobListState: widget.candidateJobListState,
          ),
          SizedBox(height: _jobDetailsPanelStyles.widthDp * 60),
          JobFilterPanel(
            panelIndex: widget.panelIndex,
            jobPortalPageColors: widget.jobPortalPageColors,
            jobPortalBloc: widget.jobPortalBloc,
            jobPortalState: widget.jobPortalState,
            candidateJobListBloc: widget.candidateJobListBloc,
            candidateJobListState: widget.candidateJobListState,
          ),
          SizedBox(height: _jobDetailsPanelStyles.widthDp * 40),
          FilterButtonGroup(
            panelIndex: widget.panelIndex,
            jobPortalPageColors: widget.jobPortalPageColors,
            jobPortalBloc: widget.jobPortalBloc,
            jobPortalState: widget.jobPortalState,
            candidateJobListBloc: widget.candidateJobListBloc,
            candidateJobListState: widget.candidateJobListState,
          ),
        ],
      ),
    );
  }

  Widget _containerRightPanel(BuildContext context) {
    if (_jobDetailsPanelStyles.runtimeType == JobDetailsPanelMobileStyles) {
      return SizedBox();
    }
    return BlocConsumer<JobDetailsBloc, JobDetailsState>(listener: (context, state) {
      /// listener
    }, builder: (context, state) {
      if (state.otherMathcesJobListStream == null) {
        _jobDetailsBloc.add(OtherMatchesJobListStreamEvent(
          filterModel: widget.candidateJobListState.candidateJobListFilter,
          jobModel: widget.jobModel,
        ));
      }
      return Container(
        width: _jobDetailsPanelStyles.rightPanelWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              JobDetailsPanelString.otherMatches,
              style: TextStyle(fontSize: _jobDetailsPanelStyles.mediumTextFontSize, color: widget.jobPortalPageColors.textColor),
            ),
            SizedBox(height: _jobDetailsPanelStyles.widthDp * 24),
            StreamBuilder<List<JobModel>>(
              stream: state.otherMathcesJobListStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingPage(
                      jobPortalPageColors: widget.jobPortalPageColors, jobPortalBloc: widget.jobPortalBloc, jobPortalState: widget.jobPortalState);
                }

                if (snapshot.data.length == 0) {
                  return FailPage(
                    jobPortalPageColors: widget.jobPortalPageColors,
                    jobPortalBloc: widget.jobPortalBloc,
                    jobPortalState: widget.jobPortalState,
                    text: "No Match Data",
                  );
                }

                return Column(
                  children: snapshot.data.map((jobModel) {
                    return Column(
                      children: [
                        JobCardWidget(
                          type: 1,
                          jobModel: jobModel,
                          panelIndex: widget.panelIndex,
                          themeMode: widget.themeMode,
                          jobPortalPageColors: widget.jobPortalPageColors,
                          jobPortalBloc: widget.jobPortalBloc,
                          jobPortalState: widget.jobPortalState,
                          candidateJobListBloc: widget.candidateJobListBloc,
                          candidateJobListState: widget.candidateJobListState,
                          replacementState: true,
                        ),
                        SizedBox(height: _jobDetailsPanelStyles.widthDp * 32),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
