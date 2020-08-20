// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:job_portal/src/blocs/index.dart';
// import 'package:job_portal/src/models/index.dart';
// import 'package:job_portal/src/pages/JobPortalPage/Components/JobFilterPanel/index.dart';
// import 'package:job_portal/src/pages/JobPortalPage/Components/job_filter_panel.dart';
// import 'package:job_portal/src/pages/JobPortalPage/index.dart';
// import 'package:job_portal/src/pages/JobPortalPage/index.dart';
// import 'package:job_portal/src/widgets/index.dart';

// class CandidateJobListPanelForDesktop extends StatelessWidget {
//   CandidateJobListPanelForDesktop({
//     @required this.panelIndex,
//     @required this.themeMode,
//     @required this.jobPortalPageColors,
//     @required this.jobPortalPageStyles,
//     @required this.jobPortalBloc,
//     @required this.jobPortalState,
//   });

//   int panelIndex;
//   String themeMode;
//   JobPortalPageStyles jobPortalPageStyles;
//   JobPortalPageColors jobPortalPageColors;
//   CandidateJobListBloc _candidateJobListBloc;
//   CandidateJobListState _candidateJobListState;
//   JobPortalBloc jobPortalBloc;
//   JobPortalState jobPortalState;

//   @override
//   Widget build(BuildContext context) {
//     _candidateJobListBloc = BlocProvider.of<CandidateJobListBloc>(context);

//     return BlocConsumer<CandidateJobListBloc, CandidateJobListState>(listener: (context, state) {
//       /// listener
//     }, builder: (context, state) {
//       _candidateJobListState = state;
//       if (state.loadingStateForCandidateJobList == 0) {
//         print("_______  candidateJob list loading 0  _______");
//         _candidateJobListBloc.add(LoadingCandidateJobListEvent(loadingStateForCandidateJobList: 1));
//         return LoadingPage(
//           jobPortalPageColors: jobPortalPageColors,
//           jobPortalBloc: jobPortalBloc,
//           jobPortalState: jobPortalState,
//         );
//       }
//       if (state.loadingStateForCandidateJobList == 1) {
//         print("_______  candidateJob list loading 1  _______");
//         return LoadingPage(
//           jobPortalPageColors: jobPortalPageColors,
//           jobPortalBloc: jobPortalBloc,
//           jobPortalState: jobPortalState,
//         );
//       }

//       if (state.loadingStateForCandidateJobList == -1) {
//         print("_______  candidateJob list loading -1  _______");
//         return FailPage(
//           jobPortalPageColors: jobPortalPageColors,
//           jobPortalBloc: jobPortalBloc,
//           jobPortalState: jobPortalState,
//           text: "Failed. Please Try it",
//         );
//       }

//       return StreamBuilder<List<JobModel>>(
//           stream: state.candidateJobListStream,
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               print("_______  candidateJobListStream hasdata  no_______");
//               return LoadingPage(
//                 jobPortalPageColors: jobPortalPageColors,
//                 jobPortalBloc: jobPortalBloc,
//                 jobPortalState: jobPortalState,
//               );
//             }

//             if (snapshot.data.length == 0) {
//               print("_______  candidateJobListStream no data _______");
//               return FailPage(
//                 jobPortalPageColors: jobPortalPageColors,
//                 jobPortalBloc: jobPortalBloc,
//                 jobPortalState: jobPortalState,
//                 text: "No Job Data",
//               );
//             }
//             print("_______  candidateJobListStream have data ${snapshot.data.length}_______");
//             List<JobModel> test = snapshot.data;
//             return Container(
//               width: jobPortalPageStyles.deviceWidth - jobPortalPageStyles.tabViewPanelHorizontalPadding * 2,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _containerFilterPanel(context),
//                   SizedBox(width: jobPortalPageStyles.jobCardWidgetSpacing),
//                   (state.candidateJobListFilter.viewFilter == 0)
//                       ? Expanded(
//                           child: Wrap(
//                             spacing: jobPortalPageStyles.jobCardWidgetSpacing,
//                             runSpacing: jobPortalPageStyles.jobCardWidgetRunSpacing,
//                             children: test.map((jobModel) {
//                               return JobCardWidget(
//                                 panelIndex: panelIndex,
//                                 themeMode: themeMode,
//                                 jobPortalPageColors: jobPortalPageColors,
//                                 jobModel: jobModel,
//                                 type: 0,
//                               );
//                             }).toList(),
//                           ),
//                         )
//                       : Expanded(
//                           child: Column(
//                             children: test.map((jobModel) {
//                               return JobListWidget(
//                                 panelIndex: panelIndex,
//                                 themeMode: themeMode,
//                                 jobPortalPageColors: jobPortalPageColors,
//                                 jobModel: jobModel,
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                 ],
//               ),
//             );
//           });
//     });
//   }

//   /// FilterPanel
//   Widget _containerFilterPanel(BuildContext context) {
//     return Column(
//       children: [
//         ViewFilterWidget(
//           panelIndex: 0,
//           jobPortalPageColors: jobPortalPageColors,
//           jobPortalBloc: jobPortalBloc,
//           jobPortalState: jobPortalState,
//           candidateJobListBloc: _candidateJobListBloc,
//           candidateJobListState: _candidateJobListState,
//         ),
//         SizedBox(height: jobPortalPageStyles.widthDp * 24),
//         JobFilterPanel(
//           panelIndex: 0,
//           jobPortalPageColors: jobPortalPageColors,
//           jobPortalBloc: jobPortalBloc,
//           jobPortalState: jobPortalState,
//           candidateJobListBloc: _candidateJobListBloc,
//           candidateJobListState: _candidateJobListState,
//         ),
//         SizedBox(height: jobPortalPageStyles.widthDp * 40),
//         FilterButtonGroup(
//           panelIndex: 0,
//           jobPortalPageColors: jobPortalPageColors,
//           jobPortalBloc: jobPortalBloc,
//           jobPortalState: jobPortalState,
//           candidateJobListBloc: _candidateJobListBloc,
//           candidateJobListState: _candidateJobListState,
//         ),
//       ],
//     );
//   }
// }
