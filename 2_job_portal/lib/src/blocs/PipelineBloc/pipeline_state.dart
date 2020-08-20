import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:job_portal/src/models/index.dart';

@immutable
class PipelineState {
  final int loadingStateForPipeline; //// 0: init, 1: loading, -1: failed 2: success
  final Stream<List<JobModel>> savedJobListStream;
  final Stream<List<JobModel>> appliedJobListStream;
  final Stream<List<JobModel>> interviewJobListStream;
  final Stream<List<JobModel>> hiredJobListStream;

  PipelineState({
    @required this.loadingStateForPipeline,
    @required this.savedJobListStream,
    @required this.appliedJobListStream,
    @required this.interviewJobListStream,
    @required this.hiredJobListStream,
  });

  factory PipelineState.init() {
    return PipelineState(
      loadingStateForPipeline: 0,
      savedJobListStream: null,
      appliedJobListStream: null,
      interviewJobListStream: null,
      hiredJobListStream: null,
    );
  }

  PipelineState update({
    int loadingStateForPipeline,
    Stream<List<JobModel>> savedJobListStream,
    Stream<List<JobModel>> appliedJobListStream,
    Stream<List<JobModel>> interviewJobListStream,
    Stream<List<JobModel>> hiredJobListStream,
  }) {
    return copyWith(
      loadingStateForPipeline: loadingStateForPipeline,
      savedJobListStream: savedJobListStream,
      appliedJobListStream: appliedJobListStream,
      interviewJobListStream: interviewJobListStream,
      hiredJobListStream: hiredJobListStream,
    );
  }

  PipelineState copyWith({
    int loadingStateForPipeline,
    Stream<List<JobModel>> savedJobListStream,
    Stream<List<JobModel>> appliedJobListStream,
    Stream<List<JobModel>> interviewJobListStream,
    Stream<List<JobModel>> hiredJobListStream,
  }) {
    return PipelineState(
      loadingStateForPipeline: loadingStateForPipeline ?? this.loadingStateForPipeline,
      savedJobListStream: savedJobListStream ?? this.savedJobListStream,
      appliedJobListStream: appliedJobListStream ?? this.appliedJobListStream,
      interviewJobListStream: interviewJobListStream ?? this.interviewJobListStream,
      hiredJobListStream: hiredJobListStream ?? this.hiredJobListStream,
    );
  }

  @override
  String toString() {
    return '''PipelineState {
      loadingStateForPipeline: $loadingStateForPipeline,
    }''';
  }
}
