import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_portal/src/blocs/index.dart';
import 'package:job_portal/src/pages/App/index.dart';
import 'package:job_portal/src/widgets/SettingMenu/index.dart';

import 'index.dart';

class JobPortalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('JobPortal'),
              backgroundColor: Color(0xFF232323),
              actions: <Widget>[
                SettingMenu(),
              ],
            ),
            body: MultiBlocProvider(
              providers: [
                BlocProvider<JobPortalBloc>(create: (context) => JobPortalBloc(JobPortalState.init())),
                BlocProvider<CandidateJobListBloc>(create: (context) => CandidateJobListBloc(CandidateJobListState.init())),
              ],
              child: JobPortalView(themeMode: state.themeMode),
            ),
          );
        },
      ),
    );
  }
}
