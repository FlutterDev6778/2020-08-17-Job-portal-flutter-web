import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:job_portal/src/models/index.dart';

@immutable
class JobPortalState {
  final int loadingStateForJobPortal; //// 0: init, 1: loading, -1: failed 2: success
  final int tabIndex;
  final UserModel userModel;

  JobPortalState({
    @required this.loadingStateForJobPortal,
    @required this.tabIndex,
    @required this.userModel,
  });

  factory JobPortalState.init() {
    return JobPortalState(
      loadingStateForJobPortal: 0,
      tabIndex: 0,
      userModel: UserModel(),
    );
  }

  JobPortalState update({
    int loadingStateForJobPortal,
    int tabIndex,
    Map<int, FilterModel> filterModelData,
    UserModel userModel,
  }) {
    return copyWith(
      loadingStateForJobPortal: loadingStateForJobPortal,
      tabIndex: tabIndex,
      filterModelData: filterModelData,
      userModel: userModel,
    );
  }

  JobPortalState copyWith({
    int loadingStateForJobPortal,
    int tabIndex,
    Map<int, FilterModel> filterModelData,
    UserModel userModel,
  }) {
    return JobPortalState(
      loadingStateForJobPortal: loadingStateForJobPortal ?? this.loadingStateForJobPortal,
      tabIndex: tabIndex ?? this.tabIndex,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  String toString() {
    return '''JobPortalState {
      loadingStateForJobPortal: $loadingStateForJobPortal,
      tabIndex: ${tabIndex.toString()},
    }''';
  }
}
