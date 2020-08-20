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

import 'index.dart';

class CandidateJobListPanel extends StatelessWidget {
  CandidateJobListPanel({
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

  CandidateJobListPanelStyles _candidateJobListPanelStyles;

  CandidateJobListBloc _candidateJobListBloc;
  CandidateJobListState _candidateJobListState;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 900) {
      _candidateJobListPanelStyles = CandidateJobListPanelDesktopStyles(context);
    } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
      _candidateJobListPanelStyles = CandidateJobListPanelTabletStyles(context);
    } else if (MediaQuery.of(context).size.width < 600) {
      _candidateJobListPanelStyles = CandidateJobListPanelMobileStyles(context);
    }

    return _containerMain(context);
  }

  Widget _containerMain(BuildContext context) {
    _candidateJobListBloc = BlocProvider.of<CandidateJobListBloc>(context);

    return BlocConsumer<CandidateJobListBloc, CandidateJobListState>(listener: (context, state) {
      /// listener
    }, builder: (context, state) {
      _candidateJobListState = state;
      if (state.loadingStateForCandidateJobList == 0) {
        print("_______  candidateJob list loading 0  _______");
        _candidateJobListBloc.add(LoadingCandidateJobListEvent(loadingStateForCandidateJobList: 1));
        return LoadingPage(
          jobPortalPageColors: jobPortalPageColors,
          jobPortalBloc: jobPortalBloc,
          jobPortalState: jobPortalState,
        );
      }
      if (state.loadingStateForCandidateJobList == 1) {
        print("_______  candidateJob list loading 1  _______");
        return LoadingPage(
          jobPortalPageColors: jobPortalPageColors,
          jobPortalBloc: jobPortalBloc,
          jobPortalState: jobPortalState,
        );
      }

      if (state.loadingStateForCandidateJobList == -1) {
        print("_______  candidateJob list loading -1  _______");
        return FailPage(
          jobPortalPageColors: jobPortalPageColors,
          jobPortalBloc: jobPortalBloc,
          jobPortalState: jobPortalState,
          text: "Failed. Please Try it",
        );
      }

      return StreamBuilder<List<JobModel>>(
          stream: state.candidateJobListStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print("_______  candidateJobListStream hasdata  no_______");
              return LoadingPage(
                jobPortalPageColors: jobPortalPageColors,
                jobPortalBloc: jobPortalBloc,
                jobPortalState: jobPortalState,
              );
            }

            if (snapshot.data.length == 0) {
              print("_______  candidateJobListStream no data _______");
              return FailPage(
                jobPortalPageColors: jobPortalPageColors,
                jobPortalBloc: jobPortalBloc,
                jobPortalState: jobPortalState,
                text: "No Job Data",
              );
            }
            print("_______  candidateJobListStream have data ${snapshot.data.length}_______");
            List<JobModel> test = snapshot.data;
            return Container(
              width: _candidateJobListPanelStyles.deviceWidth - _candidateJobListPanelStyles.primaryHorizontalPaddingPadding * 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _containerFilterPanel(context),
                  SizedBox(width: _candidateJobListPanelStyles.jobListPanelHorizontalSpacing),
                  (state.candidateJobListFilter.viewFilter == 0)
                      ? Expanded(
                          child: Wrap(
                            spacing: _candidateJobListPanelStyles.jobCardWidgetSpacing,
                            runSpacing: _candidateJobListPanelStyles.jobCardWidgetRunSpacing,
                            children: test.map((jobModel) {
                              return JobCardWidget(
                                type: 0,
                                panelIndex: panelIndex,
                                jobModel: jobModel,
                                themeMode: themeMode,
                                jobPortalPageColors: jobPortalPageColors,
                                jobPortalBloc: jobPortalBloc,
                                jobPortalState: jobPortalState,
                                candidateJobListBloc: _candidateJobListBloc,
                                candidateJobListState: _candidateJobListState,
                              );
                            }).toList(),
                          ),
                        )
                      : Expanded(
                          child: Column(
                            children: test.map((jobModel) {
                              return JobListWidget(
                                panelIndex: panelIndex,
                                jobModel: jobModel,
                                themeMode: themeMode,
                                jobPortalPageColors: jobPortalPageColors,
                                jobPortalBloc: jobPortalBloc,
                                jobPortalState: jobPortalState,
                                candidateJobListBloc: _candidateJobListBloc,
                                candidateJobListState: _candidateJobListState,
                              );
                            }).toList(),
                          ),
                        ),
                  // SizedBox(width: _candidateJobListPanelStyles.jobListPanelHorizontalSpacing),
                ],
              ),
            );
          });
    });
  }

  /// FilterPanel
  Widget _containerFilterPanel(BuildContext context) {
    return Column(
      children: [
        ViewFilterWidget(
          panelIndex: 0,
          jobPortalPageColors: jobPortalPageColors,
          jobPortalBloc: jobPortalBloc,
          jobPortalState: jobPortalState,
          candidateJobListBloc: _candidateJobListBloc,
          candidateJobListState: _candidateJobListState,
        ),
        SizedBox(height: _candidateJobListPanelStyles.widthDp * 24),
        JobFilterPanel(
          panelIndex: 0,
          jobPortalPageColors: jobPortalPageColors,
          jobPortalBloc: jobPortalBloc,
          jobPortalState: jobPortalState,
          candidateJobListBloc: _candidateJobListBloc,
          candidateJobListState: _candidateJobListState,
        ),
        SizedBox(height: _candidateJobListPanelStyles.widthDp * 40),
        FilterButtonGroup(
          panelIndex: 0,
          jobPortalPageColors: jobPortalPageColors,
          jobPortalBloc: jobPortalBloc,
          jobPortalState: jobPortalState,
          candidateJobListBloc: _candidateJobListBloc,
          candidateJobListState: _candidateJobListState,
        ),
      ],
    );
  }
}
