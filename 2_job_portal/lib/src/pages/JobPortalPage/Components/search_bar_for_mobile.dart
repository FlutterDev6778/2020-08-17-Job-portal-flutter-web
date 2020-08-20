import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';
import 'package:provider/provider.dart';

class SearchBarForMobile extends StatelessWidget {
  SearchBarForMobile({
    @required this.jobPortalPageColors,
    @required this.jobPortalPageStyles,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
  });

  JobPortalPageStyles jobPortalPageStyles;
  JobPortalPageColors jobPortalPageColors;

  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchBarProvider()),
      ],
      child: Consumer<SearchBarProvider>(builder: (context, searchBarProvider, _) {
        return Container(
          width: jobPortalPageStyles.deviceWidth - jobPortalPageStyles.primaryHorizontalPadding * 2,
          child: CustomTextFormField(
            width: double.infinity,
            height: jobPortalPageStyles.searchBarTextFieldHeight,
            controller: _controller,
            fixedHeightState: false,
            fillColor: Colors.white,
            borderColor: jobPortalPageColors.backgroundColor,
            borderWidth: 1,
            // borderRadius: jobPortalPageStyles.widthDp * 6,
            borderType: 2,
            textFontSize: jobPortalPageStyles.searchBarTextFontSize,
            hintTextFontSize: jobPortalPageStyles.searchBarTextFontSize,
            hintText: (searchBarProvider.selectType == 0) ? JobPortalPageString.searchbarJobTitleHint : JobPortalPageString.searchbarAddressHint,
            contentHorizontalPadding: jobPortalPageStyles.searchBarTextFieldContentsHorizontalPadding,
            prefixIcon: GestureDetector(
              child: Container(
                width: jobPortalPageStyles.searchBarSearchButtonWidth,
                height: jobPortalPageStyles.searchBarSearchButtonHeight,
                color: jobPortalPageColors.primaryColor,
                alignment: Alignment.center,
                child: Icon(Icons.search, size: jobPortalPageStyles.searchBarIconSize, color: Colors.white),
              ),
              onTap: () {},
            ),
            suffixIcon: _containerPopupButton(context, searchBarProvider),
          ),
        );
      }),
    );
  }

  Widget _containerPopupButton(BuildContext context, SearchBarProvider searchBarProvider) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      offset: Offset(0, 0),
      onSelected: (item) async {
        switch (item) {
          case 0:
            searchBarProvider.setSelectType(0);
            break;
          case 1:
            searchBarProvider.setSelectType(1);
            break;
          default:
        }
      },
      child: Container(
        width: jobPortalPageStyles.searchBarSearchButtonWidth,
        height: jobPortalPageStyles.searchBarSearchButtonHeight,
        decoration: BoxDecoration(border: Border(left: BorderSide(width: 1, color: Colors.black26))),
        alignment: Alignment.center,
        child: Icon(Icons.filter_list, size: jobPortalPageStyles.searchBarIconSize, color: Colors.black),
      ),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          height: jobPortalPageStyles.searchBarTextFontSize * 2,
          value: 0,
          child: Text(
            JobPortalPageString.searchBarJobLabel,
            style: TextStyle(fontSize: jobPortalPageStyles.searchBarTextFontSize),
          ),
        ),
        PopupMenuItem(
          height: jobPortalPageStyles.searchBarTextFontSize * 2,
          value: 1,
          child: Text(
            JobPortalPageString.searchBarAddressLabel,
            style: TextStyle(fontSize: jobPortalPageStyles.searchBarTextFontSize),
          ),
        ),
      ],
    );
  }
}

class SearchBarProvider extends ChangeNotifier {
  static SearchBarProvider of(BuildContext context, {bool listen = false}) => Provider.of<SearchBarProvider>(context, listen: listen);

  int _selectType = 0;
  int get selectType => _selectType;
  void setSelectType(int selectType, {bool isNotifiable = true}) {
    if (_selectType != selectType) {
      _selectType = selectType;
      if (isNotifiable) notifyListeners();
    }
  }
}
