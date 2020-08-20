// import 'package:flutter/material.dart';

// import 'package:job_portal/src/blocs/index.dart';
// import 'package:job_portal/src/models/index.dart';
// import 'package:job_portal/src/pages/App/index.dart';
// import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
// import 'package:job_portal/src/pages/JobPortalPage/index.dart';
// import 'package:job_portal/src/utils/index.dart';
// import 'package:job_portal/src/widgets/index.dart';

// class JobFilterPanel extends StatelessWidget {
//   JobFilterPanel({
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

//   CurrencyTextFieldController _salaryController;
//   CurrencyTextFieldController _hourlyController;

//   FilterModel _filterModel;

//   @override
//   Widget build(BuildContext context) {
//     _salaryController = CurrencyTextFieldController(rightSymbol: jobPortalState.userModel.currencySymbol);
//     _hourlyController = CurrencyTextFieldController(rightSymbol: jobPortalState.userModel.currencySymbol);

//     switch (panelIndex) {
//       case 0:
//         _filterModel = FilterModel.fromJson(candidateJobListState.candidateJobListFilter.toJson());

//         break;
//       default:
//     }

//     _salaryController.text = (_filterModel.salaryFilter != 0) ? _filterModel.salaryFilter.toString() : "";
//     _hourlyController.text = (_filterModel.hourlyFilter != 0) ? _filterModel.hourlyFilter.toString() : "";

//     return Container(
//       width: jobPortalPageStyles.filterPanelWidth,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// SalaryFilter
//           Text(
//             JobPortalPageString.saleryFilterLabel,
//             style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
//           ),
//           SizedBox(height: jobPortalPageStyles.filterPanelItemLabelSpacing),
//           CustomTextFormField(
//             width: double.infinity,
//             height: jobPortalPageStyles.filterPanelFilterItemHeight,
//             controller: _salaryController,
//             fixedHeightState: false,
//             textFontSize: jobPortalPageStyles.filterPanelTextFontSize,
//             hintText: "\$100",
//             borderType: 1,
//             borderColor: jobPortalPageColors.textColor,
//             textColor: jobPortalPageColors.textColor,
//             fillColor: Colors.transparent,
//             prefixIcon: Icon(
//               Icons.edit,
//               size: jobPortalPageStyles.filterPanelTextFontSize * 1.2,
//               color: jobPortalPageColors.textColor,
//             ),
//             keyboardType: TextInputType.number,
//             onChangeHandler: (input) {
//               _filterModel.salaryFilter = double.parse(_salaryController.doubleValue.toString()).toInt();
//               _changeFilterEvent();
//             },
//           ),

//           /// HourlyFilter
//           SizedBox(height: jobPortalPageStyles.filterPanelItemSpacing),
//           Text(
//             JobPortalPageString.hourlyFilterLabel,
//             style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
//           ),
//           SizedBox(height: jobPortalPageStyles.filterPanelItemLabelSpacing),
//           CustomTextFormField(
//             width: double.infinity,
//             height: jobPortalPageStyles.filterPanelFilterItemHeight,
//             controller: _hourlyController,
//             fixedHeightState: false,
//             textFontSize: jobPortalPageStyles.filterPanelTextFontSize,
//             hintText: "\$100",
//             borderType: 1,
//             borderColor: jobPortalPageColors.textColor,
//             textColor: jobPortalPageColors.textColor,
//             fillColor: Colors.transparent,
//             prefixIcon: Icon(
//               Icons.edit,
//               size: jobPortalPageStyles.filterPanelTextFontSize * 1.2,
//               color: jobPortalPageColors.textColor,
//             ),
//             keyboardType: TextInputType.number,
//             onChangeHandler: (input) {
//               _filterModel.hourlyFilter = double.parse(_hourlyController.doubleValue.toString()).toInt();
//               _changeFilterEvent();
//             },
//           ),

//           /// distance filter
//           SizedBox(height: jobPortalPageStyles.filterPanelItemSpacing),
//           Text(
//             JobPortalPageString.distanceFilterLabel,
//             style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
//           ),
//           SizedBox(height: jobPortalPageStyles.filterPanelItemLabelSpacing),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "${JobPortalPageConstants.fromDistance}${JobPortalPageString.distanceUnit}",
//                 style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTextFontSize, color: jobPortalPageColors.textColor),
//               ),
//               Text(
//                 "${_filterModel.distanceFilter} ${JobPortalPageString.distanceUnit}",
//                 style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTextFontSize, color: jobPortalPageColors.textColor),
//               ),
//               Text(
//                 "${JobPortalPageConstants.toDistance}+${JobPortalPageString.distanceUnit}",
//                 style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTextFontSize, color: jobPortalPageColors.textColor),
//               ),
//             ],
//           ),
//           Slider(
//             onChanged: (value) {
//               _filterModel.distanceFilter = value.toInt();
//               _changeFilterEvent();
//             },
//             onChangeEnd: (value) {
//               // FilterModel filterModel = FilterModel.fromJson(jobPortalState.filterModelData[panelIndex].toJson());
//               // filterModel.distanceFilter = value.toInt();
//               // jobPortalBloc.add(
//               //   ChangeFilterDataEvent(panelIndex: panelIndex, filterModel: filterModel),
//               // );
//             },
//             value: _filterModel.distanceFilter.toDouble(),
//             min: JobPortalPageConstants.fromDistance.toDouble(),
//             max: JobPortalPageConstants.toDistance.toDouble(),
//             inactiveColor: jobPortalPageColors.textColor,
//             activeColor: jobPortalPageColors.textColor,
//           ),

//           /// JobType Filter
//           SizedBox(height: jobPortalPageStyles.filterPanelItemSpacing),
//           Text(
//             JobPortalPageString.jobTypeFilterLabel,
//             style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
//           ),
//           SizedBox(height: jobPortalPageStyles.filterPanelItemLabelSpacing),
//           Wrap(
//             spacing: jobPortalPageStyles.widthDp * 12,
//             runSpacing: jobPortalPageStyles.widthDp * 16,
//             children: JobPortalPageString.jobTypeFilterList.map((item) {
//               return GestureDetector(
//                 onTap: () {
//                   List<String> list = _filterModel.jobTypeFilterList.join(',').split(',');
//                   if (list.contains(item)) {
//                     list.remove(item);
//                   } else {
//                     list.add(item);
//                   }

//                   _filterModel.jobTypeFilterList = list;

//                   _changeFilterEvent();
//                 },
//                 child: Container(
//                   width: jobPortalPageStyles.widthDp * 16 + item.length * jobPortalPageStyles.filterPanelTextFontSize * 0.8,
//                   height: jobPortalPageStyles.filterPanelFilterItemHeight,
//                   padding: EdgeInsets.symmetric(horizontal: jobPortalPageStyles.widthDp * 8),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: (_filterModel.jobTypeFilterList.contains(item)) ? jobPortalPageColors.selectedFilterItemColor : Colors.white,
//                     borderRadius: BorderRadius.circular(jobPortalPageStyles.filterPanelFilterItemHeight / 2),
//                     border: Border.all(
//                       width: 2,
//                       color: (_filterModel.jobTypeFilterList.contains(item))
//                           ? jobPortalPageColors.selectedFilterItemBorderColor
//                           : jobPortalPageColors.unSelectedFilterItemBorderColor,
//                     ),
//                   ),
//                   child: Text(item, style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTextFontSize)),
//                 ),
//               );
//             }).toList(),
//           ),

//           /// Experiences  Filter
//           SizedBox(height: jobPortalPageStyles.filterPanelItemSpacing),
//           Text(
//             JobPortalPageString.experienceFilterLabel,
//             style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
//           ),
//           SizedBox(height: jobPortalPageStyles.filterPanelItemLabelSpacing),
//           Wrap(
//             spacing: jobPortalPageStyles.widthDp * 12,
//             runSpacing: jobPortalPageStyles.widthDp * 16,
//             children: JobPortalPageString.experienceFilterList.map((item) {
//               return GestureDetector(
//                 onTap: () {
//                   List<String> list = _filterModel.experienceFilterList.join(',').split(',');
//                   if (list.contains(item)) {
//                     list.remove(item);
//                   } else {
//                     list.add(item);
//                   }

//                   _filterModel.experienceFilterList = list;

//                   _changeFilterEvent();
//                 },
//                 child: Container(
//                   width: jobPortalPageStyles.widthDp * 16 + item.length * jobPortalPageStyles.filterPanelTextFontSize * 0.8,
//                   height: jobPortalPageStyles.filterPanelFilterItemHeight,
//                   padding: EdgeInsets.symmetric(horizontal: jobPortalPageStyles.widthDp * 8),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: (_filterModel.experienceFilterList.contains(item)) ? jobPortalPageColors.selectedFilterItemColor : Colors.white,
//                     borderRadius: BorderRadius.circular(jobPortalPageStyles.filterPanelFilterItemHeight / 2),
//                     border: Border.all(
//                       width: 2,
//                       color: (_filterModel.experienceFilterList.contains(item))
//                           ? jobPortalPageColors.selectedFilterItemBorderColor
//                           : jobPortalPageColors.unSelectedFilterItemBorderColor,
//                     ),
//                   ),
//                   child: Text(item, style: TextStyle(fontSize: jobPortalPageStyles.filterPanelTextFontSize)),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   void _changeFilterEvent() {
//     switch (panelIndex) {
//       case 0:
//         candidateJobListBloc.add(
//           CandidateJobListFilterChangeEvent(candidateJobListFilter: _filterModel),
//         );
//         break;
//       default:
//     }
//   }
// }
