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

class OtherApplicantListBloc extends Bloc<OtherApplicantListEvent, OtherApplicantListState> {
  OtherApplicantListBloc(OtherApplicantListState initialState) : super(initialState);

  OtherApplicantListState get initialState => OtherApplicantListState.init();

  @override
  Stream<Transition<OtherApplicantListEvent, OtherApplicantListState>> transformEvents(events, transitionFn) {
    return super.transformEvents(events, transitionFn);
  }

  @override
  Stream<OtherApplicantListState> mapEventToState(OtherApplicantListEvent event) async* {
    if (event is LoadingOtherApplicantListEvent) {
      yield* _mapLoadingOtherApplicantListListEventToState(event.loadingStateForOtherApplicantList);
    } else if (event is OtherApplicantListFilterChangeEvent) {
      yield* _mapOtherApplicantListFilterChangeEventToState(event.candidateJobListFilter);
    }
  }

  Stream<OtherApplicantListState> _mapLoadingOtherApplicantListListEventToState(int loadingStateForOtherApplicantList) async* {
    yield state.update(loadingStateForOtherApplicantList: 1);
    try {
      yield state.update(loadingStateForOtherApplicantList: 2);
    } catch (e) {
      yield state.update(loadingStateForOtherApplicantList: -1);
    }
  }

  Stream<OtherApplicantListState> _mapOtherApplicantListFilterChangeEventToState(FilterModel candidateJobListFilter) async* {
    yield state.update(
      candidateJobListFilter: candidateJobListFilter,
    );
  }
}
