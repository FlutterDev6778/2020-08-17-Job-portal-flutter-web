import 'package:job_portal/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class OtherApplicantListEvent extends Equatable {
  const OtherApplicantListEvent();

  @override
  List<Object> get props => [];
}

/// candidate job list loading event
class LoadingOtherApplicantListEvent extends OtherApplicantListEvent {
  final int loadingStateForOtherApplicantList;

  const LoadingOtherApplicantListEvent({@required this.loadingStateForOtherApplicantList});

  @override
  List<Object> get props => [loadingStateForOtherApplicantList];

  @override
  String toString() => 'LoadingOtherApplicantListEvent { isOpened :${[loadingStateForOtherApplicantList]} }';
}

/// Change Filter Event
class OtherApplicantListFilterChangeEvent extends OtherApplicantListEvent {
  final FilterModel candidateJobListFilter;

  const OtherApplicantListFilterChangeEvent({@required this.candidateJobListFilter});

  @override
  List<Object> get props => [candidateJobListFilter];

  @override
  String toString() => 'TabIndexEvent { isOpened ';
}

class OtherApplicantListStream extends OtherApplicantListEvent {
  final FilterModel filterModel;
  final int lastTs;

  const OtherApplicantListStream({@required this.filterModel, @required this.lastTs});

  @override
  List<Object> get props => [filterModel.toJson(), lastTs];

  @override
  String toString() => 'LoadingOtherApplicantListEvent { isOpened :${[lastTs]} }';
}

class NewOtherApplicantListStream extends OtherApplicantListEvent {
  final FilterModel filterModel;

  const NewOtherApplicantListStream({@required this.filterModel});

  @override
  List<Object> get props => [filterModel.toJson()];

  @override
  String toString() => 'LoadingOtherApplicantListEvent { isOpened }';
}
