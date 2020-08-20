import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:job_portal/src/blocs/index.dart';

import './index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppRoutes.configureRoutes();
    return MultiProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc(ThemeState.init())),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate,
          const FallbackCupertinoLocalisationsDelegate(),
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(context),
        onGenerateRoute: AppRoutes.router.generator,
      ),
    );
  }
}
