import 'package:job_portal/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class PipelineEvent extends Equatable {
  const PipelineEvent();

  @override
  List<Object> get props => [];
}

/// candidate job list loading event
class LoadingPipelineEvent extends PipelineEvent {
  final int loadingStateForPipeline;

  const LoadingPipelineEvent({@required this.loadingStateForPipeline});

  @override
  List<Object> get props => [loadingStateForPipeline];

  @override
  String toString() => 'LoadingPipelineEvent { isOpened :${[loadingStateForPipeline]} }';
}
