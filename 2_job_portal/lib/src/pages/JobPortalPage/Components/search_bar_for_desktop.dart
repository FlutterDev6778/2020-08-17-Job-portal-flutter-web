import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';

class SearchBarForDesktop extends StatelessWidget {
  SearchBarForDesktop({
    @required this.jobPortalPageColors,
    @required this.jobPortalPageStyles,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
  });

  JobPortalPageStyles jobPortalPageStyles;
  JobPortalPageColors jobPortalPageColors;

  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  TextEditingController _jobTitleController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: jobPortalPageStyles.deviceWidth - jobPortalPageStyles.primaryHorizontalPadding * 2,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormField(
                  width: jobPortalPageStyles.searchBarTextFieldWidth,
                  height: jobPortalPageStyles.searchBarTextFieldHeight,
                  controller: _jobTitleController,
                  fixedHeightState: false,
                  fillColor: Colors.white,
                  borderColor: Colors.black,
                  borderWidth: 1,
                  borderRadius: jobPortalPageStyles.widthDp * 6,
                  borderType: 2,
                  textFontSize: jobPortalPageStyles.searchBarTextFontSize,
                  hintTextFontSize: jobPortalPageStyles.searchBarTextFontSize,
                  hintText: JobPortalPageString.searchbarJobTitleHint,
                  contentHorizontalPadding: jobPortalPageStyles.searchBarTextFieldContentsHorizontalPadding,
                  prefixIcon: Icon(Icons.search, size: jobPortalPageStyles.searchBarIconSize, color: jobPortalPageColors.primaryColor),
                ),
                CustomTextFormField(
                  width: jobPortalPageStyles.searchBarTextFieldWidth,
                  height: jobPortalPageStyles.searchBarTextFieldHeight,
                  controller: _addressController,
                  fixedHeightState: false,
                  fillColor: Colors.white,
                  borderColor: Colors.black,
                  borderWidth: 1,
                  borderRadius: jobPortalPageStyles.widthDp * 6,
                  borderType: 2,
                  textFontSize: jobPortalPageStyles.searchBarTextFontSize,
                  hintTextFontSize: jobPortalPageStyles.searchBarTextFontSize,
                  hintText: JobPortalPageString.searchbarAddressHint,
                  contentHorizontalPadding: jobPortalPageStyles.searchBarTextFieldContentsHorizontalPadding,
                  prefixIcon: Icon(Icons.location_on, size: jobPortalPageStyles.searchBarIconSize, color: jobPortalPageColors.primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(width: jobPortalPageStyles.widthDp * 20),
          CustomRaisedButton(
            width: jobPortalPageStyles.searchBarSearchButtonWidth,
            height: jobPortalPageStyles.searchBarSearchButtonHeight,
            color: Colors.transparent,
            borderWidth: 2,
            borderColor: jobPortalPageColors.primaryColor,
            borderRadius: jobPortalPageStyles.widthDp * 6,
            child: Text(
              JobPortalPageString.searchbarSearchButton,
              style: TextStyle(fontSize: jobPortalPageStyles.searchBarSearchButtonFontSize, color: jobPortalPageColors.primaryColor),
            ),
            elevation: 0,
            onPressed: () {
              print(_addressController.text);
              print(_jobTitleController.text);
            },
          ),
        ],
      ),
    );
  }
}
