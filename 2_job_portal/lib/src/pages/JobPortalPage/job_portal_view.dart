import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Components/candidate_job_list_panel_for_desktop.dart';
import 'package:job_portal/src/pages/JobPortalPage/Panels/index.dart';

import 'index.dart';

class JobPortalView extends StatefulWidget {
  JobPortalView({
    @required this.themeMode,
  });

  String themeMode;
  State<JobPortalView> createState() => _JobPortalViewState();
}

class _JobPortalViewState extends State<JobPortalView> with TickerProviderStateMixin {
  JobPortalPageStyles _jobPortalPageStyles;
  JobPortalPageColors _jobPortalPageColors;

  TabController _tabController;

  ///
  JobPortalBloc _jobPortalBloc;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: JobPortalPageString.tabStringList.length, initialIndex: 0, vsync: this);

    _jobPortalBloc = BlocProvider.of<JobPortalBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.themeMode == ThemeModeConstants.dark) {
      _jobPortalPageColors = JobPortalPageDarkModeColors();
    } else {
      _jobPortalPageColors = JobPortalPageLightModeColors();
    }

    return Builder(builder: (context) {
      if (MediaQuery.of(context).size.width >= 900) {
        _jobPortalPageStyles = JobPortalPageDesktopStyles(context);
      } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
        ////  tablet
        _jobPortalPageStyles = JobPortalPageTabletStyles(context);
      } else if (MediaQuery.of(context).size.width < 600) {
        _jobPortalPageStyles = JobPortalPageMobileStyles(context);
      }

      if (kIsWeb) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return _containerMain(context);
          },
        );
      } else {
        return _containerMain(context);
      }
    });
  }

  Widget _containerMain(BuildContext context) {
    return BlocConsumer<JobPortalBloc, JobPortalState>(
      listener: (context, state) {
        /// listener
      },
      builder: (context, state) {
        if (state.loadingStateForJobPortal == 0) {
          print("_______  jobportal page loading 0 _______");
          _jobPortalBloc.add(LoadingJobPortalEvent(loadingStateForJobPortal: 1));
          return LoadingPage(
            jobPortalPageColors: _jobPortalPageColors,
            jobPortalBloc: _jobPortalBloc,
            jobPortalState: state,
          );
        }

        if (state.loadingStateForJobPortal == 1) {
          print("_______  jobportal page loading 1 _______");
          return LoadingPage(
            jobPortalPageColors: _jobPortalPageColors,
            jobPortalBloc: _jobPortalBloc,
            jobPortalState: state,
          );
        }

        if (state.loadingStateForJobPortal == -1) {
          print("_______  jobportal page loading 1 _______");
          return FailPage(
            jobPortalPageColors: _jobPortalPageColors,
            jobPortalBloc: _jobPortalBloc,
            jobPortalState: state,
            text: "Failed. Please Try it",
          );
        }

        _tabController.addListener(() {
          if (state.tabIndex != _tabController.index) {
            _jobPortalBloc.add(TabIndexEvent(tabIndex: _tabController.index));
          }
        });

        print("_______  jobportal page loading 2 _______");
        return DefaultTabController(
          length: JobPortalPageString.tabStringList.length,
          child: Scaffold(
            backgroundColor: _jobPortalPageColors.backgroundColor,
            body: Container(
              width: _jobPortalPageStyles.deviceWidth,
              height: _jobPortalPageStyles.deviceHeight,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (_jobPortalPageStyles.runtimeType == JobPortalPageMobileStyles)
                        ? SizedBox()
                        : TitleBarForDesktop(
                            jobPortalPageColors: _jobPortalPageColors,
                            jobPortalPageStyles: _jobPortalPageStyles,
                            jobPortalBloc: _jobPortalBloc,
                            jobPortalState: state,
                          ),
                    MapView(
                      jobPortalPageColors: _jobPortalPageColors,
                      jobPortalPageStyles: _jobPortalPageStyles,
                      jobPortalBloc: _jobPortalBloc,
                      jobPortalState: state,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: _jobPortalPageStyles.primaryHorizontalPadding,
                        vertical: _jobPortalPageStyles.primaryVerticalPadding,
                      ),
                      child: (_jobPortalPageStyles.runtimeType == JobPortalPageMobileStyles)
                          ? SearchBarForMobile(
                              jobPortalPageColors: _jobPortalPageColors,
                              jobPortalPageStyles: _jobPortalPageStyles,
                              jobPortalBloc: _jobPortalBloc,
                              jobPortalState: state,
                            )
                          : SearchBarForDesktop(
                              jobPortalPageColors: _jobPortalPageColors,
                              jobPortalPageStyles: _jobPortalPageStyles,
                              jobPortalBloc: _jobPortalBloc,
                              jobPortalState: state,
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: _jobPortalPageStyles.primaryHorizontalPadding,
                        vertical: _jobPortalPageStyles.primaryVerticalPadding,
                      ),
                      child: TabBarComponent(
                        jobPortalPageColors: _jobPortalPageColors,
                        jobPortalPageStyles: _jobPortalPageStyles,
                        jobPortalBloc: _jobPortalBloc,
                        jobPortalState: state,
                        tabController: _tabController,
                      ),
                    ),
                    (_tabController.index == 0)
                        ? CandidateJobListPanel(
                            panelIndex: 0,
                            themeMode: widget.themeMode,
                            jobPortalPageColors: _jobPortalPageColors,
                            jobPortalBloc: _jobPortalBloc,
                            jobPortalState: state,
                          )
                        : (_tabController.index == 1)
                            ? PipelinePanel(
                                panelIndex: 1,
                                themeMode: widget.themeMode,
                                jobPortalPageColors: _jobPortalPageColors,
                                jobPortalBloc: _jobPortalBloc,
                                jobPortalState: state,
                              )
                            : (_tabController.index == 2)
                                ? Text(_tabController.index.toString(),
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: _jobPortalPageColors.textColor,
                                    ))
                                : (_tabController.index == 3)
                                    ? Text(
                                        _tabController.index.toString(),
                                        style: TextStyle(
                                          fontSize: 50,
                                          color: _jobPortalPageColors.textColor,
                                        ),
                                      )
                                    : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
