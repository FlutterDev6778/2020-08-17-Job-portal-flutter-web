import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart' as EL;
import 'package:job_portal/src/blocs/index.dart';

import 'index.dart';

class SettingMenu extends StatelessWidget {
  SettingMenuStyles _settingMenuStyles;
  ThemeBloc _themeBloc;

  @override
  Widget build(BuildContext context) {
    _settingMenuStyles = SettingMenuStyles(context);
    _themeBloc = BlocProvider.of<ThemeBloc>(context);

    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: PopupMenuButton(
            padding: EdgeInsets.zero,
            offset: Offset(0, 0),
            onSelected: (item) async {
              switch (item) {
                case 0:
                  if (state.themeMode != ThemeModeConstants.dark) {
                    _themeBloc.add(ThemeChanged(themeMode: ThemeModeConstants.dark));
                  }
                  break;
                case 1:
                  if (state.themeMode != ThemeModeConstants.light) {
                    _themeBloc.add(ThemeChanged(themeMode: ThemeModeConstants.light));
                  }
                  break;

                default:
              }
            },
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  Icon(Icons.more_vert, size: _settingMenuStyles.iconSize, color: Colors.white),
                  SizedBox(width: 20),
                ],
              ),
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                height: _settingMenuStyles.textFontSize * 2,
                value: 0,
                child: Text("SettingMenu.darkMode".tr(), style: TextStyle(fontSize: _settingMenuStyles.textFontSize)),
              ),
              PopupMenuItem(
                height: _settingMenuStyles.textFontSize * 2,
                value: 1,
                child: Text("SettingMenu.lightMode".tr(), style: TextStyle(fontSize: _settingMenuStyles.textFontSize)),
              ),
            ],
          ),
        );
      },
    );
  }
}
