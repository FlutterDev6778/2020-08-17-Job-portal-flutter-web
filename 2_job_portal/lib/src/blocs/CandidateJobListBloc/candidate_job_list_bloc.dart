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

class CandidateJobListBloc extends Bloc<CandidateJobListEvent, CandidateJobListState> {
  CandidateJobListBloc(CandidateJobListState initialState) : super(initialState);

  CandidateJobListState get initialState => CandidateJobListState.init();

  JobRepository _jobRepository = JobRepository();

  @override
  Stream<Transition<CandidateJobListEvent, CandidateJobListState>> transformEvents(events, transitionFn) {
    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<CandidateJobListState> mapEventToState(CandidateJobListEvent event) async* {
    if (event is LoadingCandidateJobListEvent) {
      yield* _mapLoadingCandidateJobListListEventToState(event.loadingStateForCandidateJobList);
    } else if (event is CandidateJobListFilterChangeEvent) {
      yield* _mapCandidateJobListFilterChangeEventToState(event.candidateJobListFilter);
    }
  }

  Stream<CandidateJobListState> _mapLoadingCandidateJobListListEventToState(int loadingStateForCandidateJobList) async* {
    yield state.update(loadingStateForCandidateJobList: loadingStateForCandidateJobList);
    if (loadingStateForCandidateJobList == 1) {
      try {
        Stream<List<JobModel>> candidateJobListStream = _jobRepository.getJobListStream(
          limit: 20,
          orderby: [
            {"key": "ts", "desc": true}
          ],
        );
        yield state.update(
          loadingStateForCandidateJobList: 2,
          candidateJobListStream: candidateJobListStream,
        );
      } catch (e) {
        yield state.update(loadingStateForCandidateJobList: -1);
      }
    }
  }

  Stream<CandidateJobListState> _mapCandidateJobListFilterChangeEventToState(FilterModel candidateJobListFilter) async* {
    yield state.update(
      candidateJobListFilter: candidateJobListFilter,
    );
  }
}
