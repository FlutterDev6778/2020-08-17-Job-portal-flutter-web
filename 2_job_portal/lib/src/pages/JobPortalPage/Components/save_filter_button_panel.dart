// import 'package:flutter/material.dart';

// import 'package:job_portal/src/blocs/index.dart';
// import 'package:job_portal/src/models/index.dart';
// import 'package:job_portal/src/pages/App/index.dart';
// import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
// import 'package:job_portal/src/pages/JobPortalPage/index.dart';
// import 'package:job_portal/src/utils/index.dart';
// import 'package:job_portal/src/widgets/index.dart';

// class SaveFilterButtonPanel extends StatelessWidget {
//   SaveFilterButtonPanel({
//     @required this.panelIndex,
//     @required this.jobPortalPageColors,
//     @required this.jobPortalPageStyles,
//     @required this.jobPortalBloc,
//     @required this.jobPortalState,
//     this.candidateJobListBloc,
//     this.candidateJobListState,
//   });

//   int panelIndex;

//   JobPortalPageStyles jobPortalPageStyles;
//   JobPortalPageColors jobPortalPageColors;

//   JobPortalBloc jobPortalBloc;
//   JobPortalState jobPortalState;

//   CandidateJobListBloc candidateJobListBloc;
//   CandidateJobListState candidateJobListState;

//   FilterModel _filterModel;

//   @override
//   Widget build(BuildContext context) {
//     switch (panelIndex) {
//       case 0:
//         _filterModel = FilterModel.fromJson(candidateJobListState.candidateJobListFilter.toJson());

//         break;
//       default:
//     }

//     return Container(
//       width: jobPortalPageStyles.filterPanelWidth,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// SaveFilterData
//           CustomRaisedButton(
//             width: jobPortalPageStyles.filterPanelButtonWidth,
//             height: jobPortalPageStyles.filterPanelButtonHeight,
//             color: Colors.transparent,
//             borderColor: jobPortalPageColors.primaryColor,
//             borderWidth: jobPortalPageStyles.widthDp * 2,
//             borderRadius: jobPortalPageStyles.widthDp * 6,
//             child: Text(
//               JobPortalPageString.saveFilterButtonLabel,
//               style: TextStyle(
//                 fontSize: jobPortalPageStyles.filterPanelButtonTextFontSize,
//                 color: jobPortalPageColors.primaryColor,
//               ),
//             ),
//             onPressed: () {},
//           ),

//           /// ClearFilterData
//           SizedBox(height: jobPortalPageStyles.filterPanelItemSpacing),
//           CustomRaisedButton(
//             width: jobPortalPageStyles.filterPanelButtonWidth,
//             height: jobPortalPageStyles.filterPanelButtonHeight,
//             color: Colors.transparent,
//             borderColor: Colors.grey,
//             borderWidth: jobPortalPageStyles.widthDp * 2,
//             borderRadius: jobPortalPageStyles.widthDp * 6,
//             child: Text(
//               JobPortalPageString.clearFilterButtonLabel,
//               style: TextStyle(
//                 fontSize: jobPortalPageStyles.filterPanelButtonTextFontSize,
//                 color: Colors.grey,
//               ),
//             ),
//             onPressed: () {},
//           )
//         ],
//       ),
//     );
//   }
// }
