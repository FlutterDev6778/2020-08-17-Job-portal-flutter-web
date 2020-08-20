import 'package:job_portal/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class JobDetailsEvent extends Equatable {
  const JobDetailsEvent();

  @override
  List<Object> get props => [];
}

/// candidate job list loading event
class LoadingJobDetailsEvent extends JobDetailsEvent {
  final int loadingStateForJobDetails;

  const LoadingJobDetailsEvent({@required this.loadingStateForJobDetails});

  @override
  List<Object> get props => [loadingStateForJobDetails];

  @override
  String toString() => 'LoadingJobDetailsEvent { isOpened :${[loadingStateForJobDetails]} }';
}

class OtherMatchesJobListStreamEvent extends JobDetailsEvent {
  final FilterModel filterModel;
  final JobModel jobModel;

  const OtherMatchesJobListStreamEvent({@required this.filterModel, @required this.jobModel});

  @override
  List<Object> get props => [filterModel.toJson()];

  @override
  String toString() => 'LoadingJobDetailsEvent { isOpened }';
}
