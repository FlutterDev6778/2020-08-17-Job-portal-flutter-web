import 'package:job_portal/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class JobPortalEvent extends Equatable {
  const JobPortalEvent();

  @override
  List<Object> get props => [];
}

class LoadingJobPortalEvent extends JobPortalEvent {
  final int loadingStateForJobPortal;

  const LoadingJobPortalEvent({@required this.loadingStateForJobPortal});

  @override
  List<Object> get props => [loadingStateForJobPortal];

  @override
  String toString() => 'LoadingJobPortalEvent { isOpened :${[loadingStateForJobPortal]} }';
}

class TabIndexEvent extends JobPortalEvent {
  final int tabIndex;

  const TabIndexEvent({@required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];

  @override
  String toString() => 'TabIndexEvent { isOpened :${[tabIndex]} }';
}
