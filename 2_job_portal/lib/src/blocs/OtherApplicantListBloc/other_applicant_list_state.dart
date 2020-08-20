import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:job_portal/src/models/index.dart';

@immutable
class OtherApplicantListState {
  final int loadingStateForOtherApplicantList; //// 0: init, 1: loading, -1: failed 2: success
  final FilterModel candidateJobListFilter;
  final List<JobModel> candidateJobsList;
  final List<JobModel> newOtherApplicantsList;
  final int firstOtherApplicantTs;

  OtherApplicantListState({
    @required this.loadingStateForOtherApplicantList,
    @required this.candidateJobListFilter,
    @required this.candidateJobsList,
    @required this.newOtherApplicantsList,
    @required this.firstOtherApplicantTs,
  });

  factory OtherApplicantListState.init() {
    return OtherApplicantListState(
      loadingStateForOtherApplicantList: 0,
      candidateJobListFilter: FilterModel(),
      candidateJobsList: [],
      newOtherApplicantsList: [],
      firstOtherApplicantTs: 0,
    );
  }

  OtherApplicantListState update({
    int loadingStateForOtherApplicantList,
    FilterModel candidateJobListFilter,
    List<JobModel> candidateJobsList,
    List<JobModel> newOtherApplicantsList,
    int firstOtherApplicantTs,
  }) {
    return copyWith(
      loadingStateForOtherApplicantList: loadingStateForOtherApplicantList,
      candidateJobListFilter: candidateJobListFilter,
      candidateJobsList: candidateJobsList,
      newOtherApplicantsList: newOtherApplicantsList,
      firstOtherApplicantTs: firstOtherApplicantTs,
    );
  }

  OtherApplicantListState copyWith({
    int loadingStateForOtherApplicantList,
    int tabIndex,
    FilterModel candidateJobListFilter,
    UserModel userModel,
    List<JobModel> candidateJobsList,
    List<JobModel> newOtherApplicantsList,
    int firstOtherApplicantTs,
  }) {
    return OtherApplicantListState(
      loadingStateForOtherApplicantList: loadingStateForOtherApplicantList ?? this.loadingStateForOtherApplicantList,
      candidateJobListFilter: candidateJobListFilter ?? this.candidateJobListFilter,
      candidateJobsList: candidateJobsList ?? this.candidateJobsList,
      newOtherApplicantsList: newOtherApplicantsList ?? this.newOtherApplicantsList,
      firstOtherApplicantTs: firstOtherApplicantTs ?? this.firstOtherApplicantTs,
    );
  }

  @override
  String toString() {
    return '''OtherApplicantListState {
      loadingStateForOtherApplicantList: $loadingStateForOtherApplicantList,
    }''';
  }
}
