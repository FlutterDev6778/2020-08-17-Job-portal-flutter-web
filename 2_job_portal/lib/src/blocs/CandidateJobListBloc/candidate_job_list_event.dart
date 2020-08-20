import 'package:job_portal/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class CandidateJobListEvent extends Equatable {
  const CandidateJobListEvent();

  @override
  List<Object> get props => [];
}

/// candidate job list loading event
class LoadingCandidateJobListEvent extends CandidateJobListEvent {
  final int loadingStateForCandidateJobList;

  const LoadingCandidateJobListEvent({@required this.loadingStateForCandidateJobList});

  @override
  List<Object> get props => [loadingStateForCandidateJobList];

  @override
  String toString() => 'LoadingCandidateJobListEvent { isOpened :${[loadingStateForCandidateJobList]} }';
}

/// Change Filter Event
class CandidateJobListFilterChangeEvent extends CandidateJobListEvent {
  final FilterModel candidateJobListFilter;

  const CandidateJobListFilterChangeEvent({@required this.candidateJobListFilter});

  @override
  List<Object> get props => [candidateJobListFilter];

  @override
  String toString() => 'TabIndexEvent { isOpened ';
}

class CandidateJobListStreamEvent extends CandidateJobListEvent {
  final FilterModel filterModel;
  final int lastTs;

  const CandidateJobListStreamEvent({@required this.filterModel, @required this.lastTs});

  @override
  List<Object> get props => [filterModel.toJson(), lastTs];

  @override
  String toString() => 'LoadingCandidateJobListEvent { isOpened :${[lastTs]} }';
}

class NewCandidateJobListStreamEvent extends CandidateJobListEvent {
  final FilterModel filterModel;

  const NewCandidateJobListStreamEvent({@required this.filterModel});

  @override
  List<Object> get props => [filterModel.toJson()];

  @override
  String toString() => 'LoadingCandidateJobListEvent { isOpened }';
}
