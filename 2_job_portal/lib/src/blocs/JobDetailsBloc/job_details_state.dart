import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:job_portal/src/models/index.dart';

@immutable
class JobDetailsState {
  final int loadingStateForJobDetails; //// 0: init, 1: loading, -1: failed 2: success
  final Stream<List<JobModel>> otherMathcesJobListStream;

  JobDetailsState({
    @required this.loadingStateForJobDetails,
    @required this.otherMathcesJobListStream,
  });

  factory JobDetailsState.init() {
    return JobDetailsState(
      loadingStateForJobDetails: 0,
      otherMathcesJobListStream: null,
    );
  }

  JobDetailsState update({
    int loadingStateForJobDetails,
    Stream<List<JobModel>> otherMathcesJobListStream,
  }) {
    return copyWith(
      loadingStateForJobDetails: loadingStateForJobDetails,
      otherMathcesJobListStream: otherMathcesJobListStream,
    );
  }

  JobDetailsState copyWith({
    int loadingStateForJobDetails,
    Stream<List<JobModel>> otherMathcesJobListStream,
  }) {
    return JobDetailsState(
      loadingStateForJobDetails: loadingStateForJobDetails ?? this.loadingStateForJobDetails,
      otherMathcesJobListStream: otherMathcesJobListStream ?? this.otherMathcesJobListStream,
    );
  }

  @override
  String toString() {
    return '''JobDetailsState {
      loadingStateForJobDetails: $loadingStateForJobDetails,
    }''';
  }
}
