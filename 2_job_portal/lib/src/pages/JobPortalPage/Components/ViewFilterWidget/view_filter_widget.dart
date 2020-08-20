import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/models/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/utils/index.dart';
import 'package:job_portal/src/widgets/index.dart';

import 'index.dart';

class ViewFilterWidget extends StatelessWidget {
  ViewFilterWidget({
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

  FilterModel _filterModel;

  ViewFilterWidgetStyles _viewFilterWidgetStyles;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 900) {
      _viewFilterWidgetStyles = ViewFilterWidgetDesktopStyles(context);
    } else if (MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 900) {
      _viewFilterWidgetStyles = ViewFilterWidgetTabletStyles(context);
    } else if (MediaQuery.of(context).size.width < 600) {
      _viewFilterWidgetStyles = ViewFilterWidgetMobileStyles(context);
    }

    return _containerMain(context);
  }

  Widget _containerMain(BuildContext context) {
    switch (panelIndex) {
      case 0:
        _filterModel = FilterModel.fromJson(candidateJobListState.candidateJobListFilter.toJson());
        break;
      default:
    }

    return Container(
      width: _viewFilterWidgetStyles.filterPanelWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// view filter
          Text(
            ViewFilterWidgetString.viewFilterLabel,
            style: TextStyle(fontSize: _viewFilterWidgetStyles.filterPanelTitleFontSize, color: jobPortalPageColors.textColor),
          ),
          SizedBox(height: _viewFilterWidgetStyles.filterPanelItemLabelSpacing),
          Wrap(
            spacing: _viewFilterWidgetStyles.widthDp * 12,
            runSpacing: _viewFilterWidgetStyles.widthDp * 16,
            children: ViewFilterWidgetString.viewFilterList.map((item) {
              return GestureDetector(
                onTap: () {
                  _filterModel.viewFilter = ViewFilterWidgetString.viewFilterList.indexOf(item);
                  _changeFilterEvent(context, _filterModel);
                },
                child: Container(
                  width: _viewFilterWidgetStyles.widthDp * 16 + item.length * _viewFilterWidgetStyles.filterPanelTextFontSize * 0.8,
                  height: _viewFilterWidgetStyles.filterPanelFilterItemHeight,
                  padding: EdgeInsets.symmetric(horizontal: _viewFilterWidgetStyles.widthDp * 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (_filterModel.viewFilter == ViewFilterWidgetString.viewFilterList.indexOf(item))
                        ? jobPortalPageColors.selectedFilterItemColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(_viewFilterWidgetStyles.filterPanelFilterItemHeight / 2),
                    border: Border.all(
                      width: 2,
                      color: (_filterModel.viewFilter == ViewFilterWidgetString.viewFilterList.indexOf(item))
                          ? jobPortalPageColors.selectedFilterItemBorderColor
                          : jobPortalPageColors.unSelectedFilterItemBorderColor,
                    ),
                  ),
                  child: Text(item, style: TextStyle(fontSize: _viewFilterWidgetStyles.filterPanelTextFontSize)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _changeFilterEvent(BuildContext context, FilterModel filterModel) {
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
