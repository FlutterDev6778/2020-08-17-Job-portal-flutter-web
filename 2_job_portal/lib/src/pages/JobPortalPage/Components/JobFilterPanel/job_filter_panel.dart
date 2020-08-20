import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/models/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/utils/index.dart';
import 'package:job_portal/src/widgets/index.dart';

import 'index.dart';

class JobFilterPanel extends StatelessWidget {
  JobFilterPanel({
    @required this.panelIndex,
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
    this.candidateJobListBloc,
    this.candidateJobListState,
  });

  int panelIndex;
  JobPortalPageColors jobPortalPageColors;

  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  CandidateJobListBloc candidateJobListBloc;
  CandidateJobListState candidateJobListState;

  CurrencyTextFieldController _salaryController;
  CurrencyTextFieldController _hourlyController;

  FilterModel _filterModel;

  JobFilterPanelStyles _jobFilterPanelStyles;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 900) {
      _jobFilterPanelStyles = JobFilterPanelDesktopStyles(context);
    } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
      _jobFilterPanelStyles = JobFilterPanelTabletStyles(context);
    } else if (MediaQuery.of(context).size.width < 600) {
      _jobFilterPanelStyles = JobFilterPanelMobileStyles(context);
    }

    return _containerMain(context);
  }

  Widget _containerMain(BuildContext context) {
    _salaryController = CurrencyTextFieldController(rightSymbol: jobPortalState.userModel.currencySymbol);
    _hourlyController = CurrencyTextFieldController(rightSymbol: jobPortalState.userModel.currencySymbol);

    switch (panelIndex) {
      case 0:
        _filterModel = FilterModel.fromJson(candidateJobListState.candidateJobListFilter.toJson());

        break;
      default:
    }

    _salaryController.text = (_filterModel.salaryFilter != 0) ? _filterModel.salaryFilter.toString() : "";
    _hourlyController.text = (_filterModel.hourlyFilter != 0) ? _filterModel.hourlyFilter.toString() : "";

    return Container(
      width: _jobFilterPanelStyles.filterPanelWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// SortFilter
          Text(
            JobFilterPanelString.sortFilterLabel,
            style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
          ),
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemLabelSpacing),
          Wrap(
            spacing: _jobFilterPanelStyles.widthDp * 12,
            runSpacing: _jobFilterPanelStyles.widthDp * 16,
            children: JobFilterPanelString.sortFilterList.map((item) {
              return GestureDetector(
                onTap: () {
                  _filterModel.sortFilter = JobFilterPanelString.sortFilterList.indexOf(item);
                  _changeFilterEvent();
                },
                child: Container(
                  width: _jobFilterPanelStyles.widthDp * 16 + item.length * _jobFilterPanelStyles.filterPanelTextFontSize * 0.8,
                  height: _jobFilterPanelStyles.filterPanelFilterItemHeight,
                  padding: EdgeInsets.symmetric(horizontal: _jobFilterPanelStyles.widthDp * 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (_filterModel.sortFilter == JobFilterPanelString.sortFilterList.indexOf(item))
                        ? jobPortalPageColors.selectedFilterItemColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(_jobFilterPanelStyles.filterPanelFilterItemHeight / 2),
                    border: Border.all(
                      width: 2,
                      color: (_filterModel.sortFilter == JobFilterPanelString.sortFilterList.indexOf(item))
                          ? jobPortalPageColors.selectedFilterItemBorderColor
                          : jobPortalPageColors.unSelectedFilterItemBorderColor,
                    ),
                  ),
                  child: Text(item, style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTextFontSize)),
                ),
              );
            }).toList(),
          ),

          /// SalaryFilter
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemSpacing),
          Text(
            JobFilterPanelString.saleryFilterLabel,
            style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
          ),
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemLabelSpacing),
          CustomTextFormField(
            width: double.infinity,
            height: _jobFilterPanelStyles.filterPanelFilterItemHeight,
            controller: _salaryController,
            fixedHeightState: false,
            textFontSize: _jobFilterPanelStyles.filterPanelTextFontSize,
            hintText: "\$100",
            borderType: 1,
            borderColor: jobPortalPageColors.textColor,
            textColor: jobPortalPageColors.textColor,
            fillColor: Colors.transparent,
            prefixIcon: Icon(
              Icons.edit,
              size: _jobFilterPanelStyles.filterPanelTextFontSize * 1.2,
              color: jobPortalPageColors.textColor,
            ),
            keyboardType: TextInputType.number,
            onChangeHandler: (input) {
              _filterModel.salaryFilter = double.parse(_salaryController.doubleValue.toString()).toInt();
              _changeFilterEvent();
            },
          ),

          /// HourlyFilter
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemSpacing),
          Text(
            JobFilterPanelString.hourlyFilterLabel,
            style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
          ),
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemLabelSpacing),
          CustomTextFormField(
            width: double.infinity,
            height: _jobFilterPanelStyles.filterPanelFilterItemHeight,
            controller: _hourlyController,
            fixedHeightState: false,
            textFontSize: _jobFilterPanelStyles.filterPanelTextFontSize,
            hintText: "\$100",
            borderType: 1,
            borderColor: jobPortalPageColors.textColor,
            textColor: jobPortalPageColors.textColor,
            fillColor: Colors.transparent,
            prefixIcon: Icon(
              Icons.edit,
              size: _jobFilterPanelStyles.filterPanelTextFontSize * 1.2,
              color: jobPortalPageColors.textColor,
            ),
            keyboardType: TextInputType.number,
            onChangeHandler: (input) {
              _filterModel.hourlyFilter = double.parse(_hourlyController.doubleValue.toString()).toInt();
              _changeFilterEvent();
            },
          ),

          /// distance filter
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemSpacing),
          Text(
            JobFilterPanelString.distanceFilterLabel,
            style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
          ),
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemLabelSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${JobPortalPageConstants.fromDistance}${JobFilterPanelString.distanceUnit}",
                style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTextFontSize, color: jobPortalPageColors.textColor),
              ),
              Text(
                "${_filterModel.distanceFilter} ${JobFilterPanelString.distanceUnit}",
                style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTextFontSize, color: jobPortalPageColors.textColor),
              ),
              Text(
                "${JobPortalPageConstants.toDistance}+${JobFilterPanelString.distanceUnit}",
                style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTextFontSize, color: jobPortalPageColors.textColor),
              ),
            ],
          ),
          Slider(
            onChanged: (value) {
              _filterModel.distanceFilter = value.toInt();
              _changeFilterEvent();
            },
            onChangeEnd: (value) {
              // FilterModel filterModel = FilterModel.fromJson(jobPortalState.filterModelData[panelIndex].toJson());
              // filterModel.distanceFilter = value.toInt();
              // jobPortalBloc.add(
              //   ChangeFilterDataEvent(panelIndex: panelIndex, filterModel: filterModel),
              // );
            },
            value: _filterModel.distanceFilter.toDouble(),
            min: JobPortalPageConstants.fromDistance.toDouble(),
            max: JobPortalPageConstants.toDistance.toDouble(),
            inactiveColor: jobPortalPageColors.textColor,
            activeColor: jobPortalPageColors.textColor,
          ),

          /// JobType Filter
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemSpacing),
          Text(
            JobFilterPanelString.jobTypeFilterLabel,
            style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
          ),
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemLabelSpacing),
          Wrap(
            spacing: _jobFilterPanelStyles.widthDp * 12,
            runSpacing: _jobFilterPanelStyles.widthDp * 16,
            children: JobFilterPanelString.jobTypeFilterList.map((item) {
              return GestureDetector(
                onTap: () {
                  List<String> list = _filterModel.jobTypeFilterList.join(',').split(',');
                  if (list.contains(item)) {
                    list.remove(item);
                  } else {
                    list.add(item);
                  }

                  _filterModel.jobTypeFilterList = list;

                  _changeFilterEvent();
                },
                child: Container(
                  width: _jobFilterPanelStyles.widthDp * 16 + item.length * _jobFilterPanelStyles.filterPanelTextFontSize * 0.8,
                  height: _jobFilterPanelStyles.filterPanelFilterItemHeight,
                  padding: EdgeInsets.symmetric(horizontal: _jobFilterPanelStyles.widthDp * 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (_filterModel.jobTypeFilterList.contains(item)) ? jobPortalPageColors.selectedFilterItemColor : Colors.white,
                    borderRadius: BorderRadius.circular(_jobFilterPanelStyles.filterPanelFilterItemHeight / 2),
                    border: Border.all(
                      width: 2,
                      color: (_filterModel.jobTypeFilterList.contains(item))
                          ? jobPortalPageColors.selectedFilterItemBorderColor
                          : jobPortalPageColors.unSelectedFilterItemBorderColor,
                    ),
                  ),
                  child: Text(item, style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTextFontSize)),
                ),
              );
            }).toList(),
          ),

          /// Experiences  Filter
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemSpacing),
          Text(
            JobFilterPanelString.experienceFilterLabel,
            style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
          ),
          SizedBox(height: _jobFilterPanelStyles.filterPanelItemLabelSpacing),
          Wrap(
            spacing: _jobFilterPanelStyles.widthDp * 12,
            runSpacing: _jobFilterPanelStyles.widthDp * 16,
            children: JobFilterPanelString.experienceFilterList.map((item) {
              return GestureDetector(
                onTap: () {
                  List<String> list = _filterModel.experienceFilterList.join(',').split(',');
                  if (list.contains(item)) {
                    list.remove(item);
                  } else {
                    list.add(item);
                  }

                  _filterModel.experienceFilterList = list;

                  _changeFilterEvent();
                },
                child: Container(
                  width: _jobFilterPanelStyles.widthDp * 16 + item.length * _jobFilterPanelStyles.filterPanelTextFontSize * 0.8,
                  height: _jobFilterPanelStyles.filterPanelFilterItemHeight,
                  padding: EdgeInsets.symmetric(horizontal: _jobFilterPanelStyles.widthDp * 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (_filterModel.experienceFilterList.contains(item)) ? jobPortalPageColors.selectedFilterItemColor : Colors.white,
                    borderRadius: BorderRadius.circular(_jobFilterPanelStyles.filterPanelFilterItemHeight / 2),
                    border: Border.all(
                      width: 2,
                      color: (_filterModel.experienceFilterList.contains(item))
                          ? jobPortalPageColors.selectedFilterItemBorderColor
                          : jobPortalPageColors.unSelectedFilterItemBorderColor,
                    ),
                  ),
                  child: Text(item, style: TextStyle(fontSize: _jobFilterPanelStyles.filterPanelTextFontSize)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _changeFilterEvent() {
    switch (panelIndex) {
      case 0:
        candidateJobListBloc.add(
          CandidateJobListFilterChangeEvent(candidateJobListFilter: _filterModel),
        );
        break;
      default:
    }
  }
}
