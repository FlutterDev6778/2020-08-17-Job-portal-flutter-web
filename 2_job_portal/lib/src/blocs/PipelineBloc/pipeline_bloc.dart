import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:job_portal/src/models/index.dart';
import 'package:job_portal/src/providers/index.dart';
import 'package:job_portal/src/repositories/index.dart';
import 'package:job_portal/src/utils/index.dart';

import 'index.dart';

class PipelineBloc extends Bloc<PipelineEvent, PipelineState> {
  PipelineBloc(PipelineState initialState) : super(initialState);

  PipelineState get initialState => PipelineState.init();

  JobRepository _jobRepository = JobRepository();

  @override
  Stream<Transition<PipelineEvent, PipelineState>> transformEvents(events, transitionFn) {
    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<PipelineState> mapEventToState(PipelineEvent event) async* {
    if (event is LoadingPipelineEvent) {
      yield* _mapLoadingPipelineListEventToState(event.loadingStateForPipeline);
    }
  }

  Stream<PipelineState> _mapLoadingPipelineListEventToState(int loadingStateForPipeline) async* {
    yield state.update(loadingStateForPipeline: loadingStateForPipeline);
    if (loadingStateForPipeline == 1) {
      try {
        Stream<List<JobModel>> savedJobListStream = _jobRepository.getJobListStream(
          limit: 10,
          orderby: [
            {"key": "ts", "desc": true}
          ],
        );
        Stream<List<JobModel>> appliedJobListStream = _jobRepository.getJobListStream(
          limit: 7,
          orderby: [
            {"key": "ts", "desc": true}
          ],
        );
        Stream<List<JobModel>> interviewJobListStream = _jobRepository.getJobListStream(
          limit: 4,
          orderby: [
            {"key": "ts", "desc": true}
          ],
        );
        Stream<List<JobModel>> hiredJobListStream = _jobRepository.getJobListStream(
          limit: 2,
          orderby: [
            {"key": "ts", "desc": true}
          ],
        );
        yield state.update(
          loadingStateForPipeline: 2,
          savedJobListStream: savedJobListStream,
          appliedJobListStream: appliedJobListStream,
          interviewJobListStream: interviewJobListStream,
          hiredJobListStream: hiredJobListStream,
        );
      } catch (e) {
        yield state.update(loadingStateForPipeline: -1);
      }
    }
  }
}
