import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:job_portal/src/models/index.dart';
import 'package:job_portal/src/pages/JobPortalPage/Constants/index.dart';
import 'package:job_portal/src/providers/index.dart';
import 'package:job_portal/src/repositories/index.dart';
import 'package:job_portal/src/utils/index.dart';

import 'index.dart';

class JobPortalBloc extends Bloc<JobPortalEvent, JobPortalState> {
  JobPortalBloc(JobPortalState initialState) : super(initialState);

  JobRepository _jobRepository = JobRepository();

  JobPortalState get initialState => JobPortalState.init();

  @override
  Stream<Transition<JobPortalEvent, JobPortalState>> transformEvents(events, transitionFn) {
    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<JobPortalState> mapEventToState(JobPortalEvent event) async* {
    if (event is LoadingJobPortalEvent) {
      yield* _mapLoadingJobPortalEventToState(event.loadingStateForJobPortal);
    } else if (event is TabIndexEvent) {
      yield* _mapTabIndexEventToState(event.tabIndex);
    }
  }

  Stream<JobPortalState> _mapLoadingJobPortalEventToState(int loadingStateForJobPortal) async* {
    yield state.update(loadingStateForJobPortal: loadingStateForJobPortal);
    if (loadingStateForJobPortal == 1) {
      try {
        // /// sample job data
        // bool result = await _jobRepository.makeSampleJob();
        // if (result)
        //   yield state.update(loadingStateForJobPortal: 2);
        // else
        //   yield state.update(loadingStateForJobPortal: -1);

        yield state.update(loadingStateForJobPortal: 2);
      } catch (e) {
        yield state.update(loadingStateForJobPortal: -1);
      }
    }
  }

  Stream<JobPortalState> _mapTabIndexEventToState(int tabIndex) async* {
    yield state.update(
      tabIndex: tabIndex,
    );
  }
}
