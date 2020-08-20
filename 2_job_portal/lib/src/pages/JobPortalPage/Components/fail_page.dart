import 'package:flutter/material.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';
import 'package:job_portal/src/widgets/index.dart';

class FailPage extends StatelessWidget {
  FailPage({
    @required this.jobPortalPageColors,
    @required this.jobPortalBloc,
    @required this.jobPortalState,
    @required this.text,
  });

  JobPortalPageColors jobPortalPageColors;

  JobPortalBloc jobPortalBloc;
  JobPortalState jobPortalState;

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: 30)),
          SizedBox(height: 30),
          CustomRaisedButton(
            width: 100,
            height: 40,
            color: Colors.transparent,
            borderColor: jobPortalPageColors.textColor,
            borderWidth: 2,
            borderRadius: 0,
            elevation: 0,
            child: Text("Try", style: TextStyle(fontSize: 20)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
