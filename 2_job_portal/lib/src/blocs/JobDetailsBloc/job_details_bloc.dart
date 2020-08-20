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

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  JobDetailsBloc(JobDetailsState initialState) : super(initialState);

  JobDetailsState get initialState => JobDetailsState.init();

  JobRepository _jobRepository = JobRepository();

  @override
  Stream<Transition<JobDetailsEvent, JobDetailsState>> transformEvents(events, transitionFn) {
    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<JobDetailsState> mapEventToState(JobDetailsEvent event) async* {
    if (event is LoadingJobDetailsEvent) {
      yield* _mapLoadingJobDetailsListEventToState(event.loadingStateForJobDetails);
    } else if (event is OtherMatchesJobListStreamEvent) {
      yield* _mapOtherMatchesJobListStreamEventToState(event.filterModel, event.jobModel);
    }
  }

  Stream<JobDetailsState> _mapLoadingJobDetailsListEventToState(int loadingStateForJobDetails) async* {
    yield state.update(loadingStateForJobDetails: loadingStateForJobDetails);
  }

  Stream<JobDetailsState> _mapOtherMatchesJobListStreamEventToState(FilterModel filterModel, JobModel jobModel) async* {
    try {
      Stream<List<JobModel>> otherMathcesJobListStream = _jobRepository.getJobListStream(
        limit: 5,
        orderby: [
          {"key": "ts", "desc": true}
        ],
      );
      yield state.update(
        otherMathcesJobListStream: otherMathcesJobListStream,
      );
    } catch (e) {
      yield state.update(otherMathcesJobListStream: Stream<List<JobModel>>.empty());
    }
  }
}
