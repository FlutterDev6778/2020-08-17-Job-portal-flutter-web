import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';

class MapView extends StatelessWidget {
  MapView({
    @required this.jobPortalPageColors,
    @required this.jobPortalPageStyles,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
  });

  JobPortalPageStyles jobPortalPageStyles;
  JobPortalPageColors jobPortalPageColors;

  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      JobPortalPageAssets.mapImage,
      width: jobPortalPageStyles.deviceWidth,
      height: jobPortalPageStyles.mapViewComponentHeight,
      fit: BoxFit.cover,
    );
  }
}
