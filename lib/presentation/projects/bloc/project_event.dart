part of 'project_bloc.dart';

@immutable
abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object?> get props => [];
}

class UpdateActiveStepEvent extends ProjectEvent {
  final int activeStep;

  const UpdateActiveStepEvent(this.activeStep);

  @override
  List<Object?> get props => [activeStep];
}

class UpdateProgressEvent extends ProjectEvent {
  final double progress;

  const UpdateProgressEvent(this.progress);

  @override
  List<Object?> get props => [progress];
}