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

class PipelinePanel extends StatefulWidget {
  PipelinePanel({
    @required this.panelIndex,
    @required this.themeMode,
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
  });

  int panelIndex;
  String themeMode;
  JobPortalPageColors jobPortalPageColors;
  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  @override
  _PipelinePanelState createState() => _PipelinePanelState();
}

class _PipelinePanelState extends State<PipelinePanel> {
  PipelinePanelStyles _pipelinePanelStyles;
  PipelinePanelColors _pipelinePanelColors;

  PipelineBloc _pipelineBloc;
  PipelineState _pipelineState;

  int maxLength = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PipelineBloc>(create: (context) => PipelineBloc(PipelineState.init())),
      ],
      child: Builder(builder: (context) {
        if (MediaQuery.of(context).size.width >= 900) {
          _pipelinePanelStyles = PipelinePanelDesktopStyles(context);
        } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
          ////  tablet
          _pipelinePanelStyles = PipelinePanelTabletStyles(context);
        } else if (MediaQuery.of(context).size.width < 600) {
          _pipelinePanelStyles = PipelinePanelMobileStyles(context);
        }

        _pipelineBloc = BlocProvider.of<PipelineBloc>(context);

        return _containerMain(context);
      }),
    );
  }

  Widget _containerMain(BuildContext context) {
    return Container(
      width: _pipelinePanelStyles.deviceWidth,
      padding: EdgeInsets.symmetric(
        horizontal: _pipelinePanelStyles.primaryHorizontalPaddingPadding,
        vertical: _pipelinePanelStyles.primaryHorizontalVerticalPadding,
      ),
      child: BlocConsumer<PipelineBloc, PipelineState>(
        listener: (context, state) {},
        builder: (context, state) {
          _pipelineState = state;
          if (state.loadingStateForPipeline == 0) {
            _pipelineBloc.add(LoadingPipelineEvent(loadingStateForPipeline: 1));
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _containerSavedJobPanel(context),
              Expanded(
                child: Center(
                  child: Container(
                    width: 1,
                    height: (_pipelinePanelStyles.widthDp * 300 + _pipelinePanelStyles.cardSpacing) * maxLength,
                    color: Color(0xFF403F3F),
                    child: SizedBox(),
                  ),
                ),
              ),
              _containerAppliedJobPanel(context),
              Expanded(
                child: Center(
                  child: Container(
                    width: 1,
                    height: (_pipelinePanelStyles.widthDp * 300 + _pipelinePanelStyles.cardSpacing) * maxLength,
                    color: Color(0xFF403F3F),
                    child: SizedBox(),
                  ),
                ),
              ),
              _containerInterviewJobPanel(context),
              Expanded(
                child: Center(
                  child: Container(
                    width: 1,
                    height: (_pipelinePanelStyles.widthDp * 300 + _pipelinePanelStyles.cardSpacing) * maxLength,
                    color: Color(0xFF403F3F),
                    child: SizedBox(),
                  ),
                ),
              ),
              _containerHiredJobPanel(context),
            ],
          );
        },
      ),
    );
  }

  Widget _containerSavedJobPanel(BuildContext context) {
    return Container(
      width: _pipelinePanelStyles.cardWidth,
      child: StreamBuilder<List<JobModel>>(
        stream: _pipelineState.savedJobListStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingPage(
              jobPortalPageColors: widget.jobPortalPageColors,
              jobPortalBloc: widget.jobPortalBloc,
              jobPortalState: widget.jobPortalState,
            );
          }

          if (snapshot.data.length == 0 || snapshot.data.isEmpty) {
            return FailPage(
              jobPortalPageColors: widget.jobPortalPageColors,
              jobPortalBloc: widget.jobPortalBloc,
              jobPortalState: widget.jobPortalState,
              text: "No Saved Data",
            );
          }

          if (maxLength < snapshot.data.length) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {
                maxLength = snapshot.data.length;
              });
            });
          }

          return Column(
            children: [
              Center(
                child: Text(
                  PipelinePanelString.savedLabel,
                  style: TextStyle(
                    fontSize: _pipelinePanelStyles.textFontSize,
                    color: widget.jobPortalPageColors.textColor,
                  ),
                ),
              ),
              SizedBox(
                height: _pipelinePanelStyles.widthDp * 30,
              ),
              Column(
                children: snapshot.data.map((jobModel) {
                  return Column(
                    children: [
                      Draggable(
                        feedback: Material(
                          color: Colors.transparent,
                          child: JobCard2Widget(
                            panelIndex: widget.panelIndex,
                            themeMode: widget.themeMode,
                            jobModel: jobModel,
                            jobPortalPageColors: widget.jobPortalPageColors,
                            jobPortalBloc: widget.jobPortalBloc,
                            jobPortalState: widget.jobPortalState,
                            pipelineBloc: _pipelineBloc,
                            pipelineState: _pipelineState,
                          ),
                        ),
                        child: JobCard2Widget(
                          panelIndex: widget.panelIndex,
                          themeMode: widget.themeMode,
                          jobModel: jobModel,
                          jobPortalPageColors: widget.jobPortalPageColors,
                          jobPortalBloc: widget.jobPortalBloc,
                          jobPortalState: widget.jobPortalState,
                          pipelineBloc: _pipelineBloc,
                          pipelineState: _pipelineState,
                        ),
                      ),
                      SizedBox(height: _pipelinePanelStyles.cardSpacing),
                    ],
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _containerAppliedJobPanel(BuildContext context) {
    return Container(
      width: _pipelinePanelStyles.cardWidth,
      child: StreamBuilder<List<JobModel>>(
        stream: _pipelineState.appliedJobListStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingPage(
              jobPortalPageColors: widget.jobPortalPageColors,
              jobPortalBloc: widget.jobPortalBloc,
              jobPortalState: widget.jobPortalState,
            );
          }

          if (snapshot.data.length == 0 || snapshot.data.isEmpty) {
            return FailPage(
              jobPortalPageColors: widget.jobPortalPageColors,
              jobPortalBloc: widget.jobPortalBloc,
              jobPortalState: widget.jobPortalState,
              text: "No Saved Data",
            );
          }

          return Column(
            children: [
              Center(
                child: Text(
                  PipelinePanelString.appliedLabel,
                  style: TextStyle(
                    fontSize: _pipelinePanelStyles.textFontSize,
                    color: widget.jobPortalPageColors.textColor,
                  ),
                ),
              ),
              SizedBox(
                height: _pipelinePanelStyles.widthDp * 30,
              ),
              Column(
                children: snapshot.data.map((jobModel) {
                  return Column(
                    children: [
                      JobCard2Widget(
                        panelIndex: widget.panelIndex,
                        themeMode: widget.themeMode,
                        jobModel: jobModel,
                        jobPortalPageColors: widget.jobPortalPageColors,
                        jobPortalBloc: widget.jobPortalBloc,
                        jobPortalState: widget.jobPortalState,
                        pipelineBloc: _pipelineBloc,
                        pipelineState: _pipelineState,
                      ),
                      SizedBox(height: _pipelinePanelStyles.cardSpacing),
                    ],
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _containerInterviewJobPanel(BuildContext context) {
    return Container(
      width: _pipelinePanelStyles.cardWidth,
      child: StreamBuilder<List<JobModel>>(
        stream: _pipelineState.interviewJobListStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingPage(
              jobPortalPageColors: widget.jobPortalPageColors,
              jobPortalBloc: widget.jobPortalBloc,
              jobPortalState: widget.jobPortalState,
            );
          }

          if (snapshot.data.length == 0 || snapshot.data.isEmpty) {
            return FailPage(
              jobPortalPageColors: widget.jobPortalPageColors,
              jobPortalBloc: widget.jobPortalBloc,
              jobPortalState: widget.jobPortalState,
              text: "No Saved Data",
            );
          }

          return Column(
            children: [
              Center(
                child: Text(
                  PipelinePanelString.interviewLabel,
                  style: TextStyle(
                    fontSize: _pipelinePanelStyles.textFontSize,
                    color: widget.jobPortalPageColors.textColor,
                  ),
                ),
              ),
              SizedBox(
                height: _pipelinePanelStyles.widthDp * 30,
              ),
              Column(
                children: snapshot.data.map((jobModel) {
                  return Column(
                    children: [
                      JobCard2Widget(
                        panelIndex: widget.panelIndex,
                        themeMode: widget.themeMode,
                        jobModel: jobModel,
                        jobPortalPageColors: widget.jobPortalPageColors,
                        jobPortalBloc: widget.jobPortalBloc,
                        jobPortalState: widget.jobPortalState,
                        pipelineBloc: _pipelineBloc,
                        pipelineState: _pipelineState,
                      ),
                      SizedBox(height: _pipelinePanelStyles.cardSpacing),
                    ],
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _containerHiredJobPanel(BuildContext context) {
    return Container(
      width: _pipelinePanelStyles.cardWidth,
      child: StreamBuilder<List<JobModel>>(
        stream: _pipelineState.hiredJobListStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingPage(
              jobPortalPageColors: widget.jobPortalPageColors,
              jobPortalBloc: widget.jobPortalBloc,
              jobPortalState: widget.jobPortalState,
            );
          }

          if (snapshot.data.length == 0 || snapshot.data.isEmpty) {
            return FailPage(
              jobPortalPageColors: widget.jobPortalPageColors,
              jobPortalBloc: widget.jobPortalBloc,
              jobPortalState: widget.jobPortalState,
              text: "No Saved Data",
            );
          }

          return Column(
            children: [
              Center(
                child: Text(
                  PipelinePanelString.hiredLabel,
                  style: TextStyle(
                    fontSize: _pipelinePanelStyles.textFontSize,
                    color: widget.jobPortalPageColors.textColor,
                  ),
                ),
              ),
              SizedBox(
                height: _pipelinePanelStyles.widthDp * 30,
              ),
              Column(
                children: snapshot.data.map((jobModel) {
                  return Column(
                    children: [
                      JobCard2Widget(
                        panelIndex: widget.panelIndex,
                        themeMode: widget.themeMode,
                        jobModel: jobModel,
                        jobPortalPageColors: widget.jobPortalPageColors,
                        jobPortalBloc: widget.jobPortalBloc,
                        jobPortalState: widget.jobPortalState,
                        pipelineBloc: _pipelineBloc,
                        pipelineState: _pipelineState,
                      ),
                      SizedBox(height: _pipelinePanelStyles.cardSpacing),
                    ],
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
