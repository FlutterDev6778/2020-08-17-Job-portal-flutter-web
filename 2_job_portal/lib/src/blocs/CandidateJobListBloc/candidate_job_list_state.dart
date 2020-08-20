import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:job_portal/src/models/index.dart';

@immutable
class CandidateJobListState {
  final int loadingStateForCandidateJobList; //// 0: init, 1: loading, -1: failed 2: success
  final FilterModel candidateJobListFilter;
  final List<JobModel> candidateJobsList;
  final List<JobModel> newCandidateJobsList;
  final Stream<List<JobModel>> candidateJobListStream;
  final Stream<List<JobModel>> newCandidateJobListStream;
  final int firstCandidateJobTs;

  CandidateJobListState({
    @required this.loadingStateForCandidateJobList,
    @required this.candidateJobListFilter,
    @required this.candidateJobsList,
    @required this.newCandidateJobsList,
    @required this.candidateJobListStream,
    @required this.newCandidateJobListStream,
    @required this.firstCandidateJobTs,
  });

  factory CandidateJobListState.init() {
    return CandidateJobListState(
      loadingStateForCandidateJobList: 0,
      candidateJobListFilter: FilterModel(),
      candidateJobsList: [],
      newCandidateJobsList: [],
      candidateJobListStream: null,
      newCandidateJobListStream: null,
      firstCandidateJobTs: 0,
    );
  }

  CandidateJobListState update({
    int loadingStateForCandidateJobList,
    FilterModel candidateJobListFilter,
    List<JobModel> candidateJobsList,
    List<JobModel> newCandidateJobsList,
    Stream<List<JobModel>> candidateJobListStream,
    Stream<List<JobModel>> newCandidateJobListStream,
    int firstCandidateJobTs,
  }) {
    return copyWith(
      loadingStateForCandidateJobList: loadingStateForCandidateJobList,
      candidateJobListFilter: candidateJobListFilter,
      candidateJobsList: candidateJobsList,
      newCandidateJobsList: newCandidateJobsList,
      candidateJobListStream: candidateJobListStream,
      newCandidateJobListStream: candidateJobListStream,
      firstCandidateJobTs: firstCandidateJobTs,
    );
  }

  CandidateJobListState copyWith({
    int loadingStateForCandidateJobList,
    int tabIndex,
    FilterModel candidateJobListFilter,
    UserModel userModel,
    List<JobModel> candidateJobsList,
    List<JobModel> newCandidateJobsList,
    Stream<List<JobModel>> candidateJobListStream,
    Stream<List<JobModel>> newCandidateJobListStream,
    Stream<List<JobModel>> otherMathcesJobListStream,
    int firstCandidateJobTs,
  }) {
    return CandidateJobListState(
      loadingStateForCandidateJobList: loadingStateForCandidateJobList ?? this.loadingStateForCandidateJobList,
      candidateJobListFilter: candidateJobListFilter ?? this.candidateJobListFilter,
      candidateJobsList: candidateJobsList ?? this.candidateJobsList,
      newCandidateJobsList: newCandidateJobsList ?? this.newCandidateJobsList,
      candidateJobListStream: candidateJobListStream ?? this.candidateJobListStream,
      newCandidateJobListStream: newCandidateJobListStream ?? this.newCandidateJobListStream,
      firstCandidateJobTs: firstCandidateJobTs ?? this.firstCandidateJobTs,
    );
  }

  @override
  String toString() {
    return '''CandidateJobListState {
      loadingStateForCandidateJobList: $loadingStateForCandidateJobList,
    }''';
  }
}
