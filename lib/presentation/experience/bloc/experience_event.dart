part of 'experience_bloc.dart';

abstract class ExperienceEvent extends Equatable {
  const ExperienceEvent();

  @override
  List<Object?> get props => [];
}

class UpdateActiveStepEvent extends ExperienceEvent {
  final int activeStep;

  const UpdateActiveStepEvent(this.activeStep);

  @override
  List<Object?> get props => [activeStep];
}

class UpdateProgressEvent extends ExperienceEvent {
  final double progress;

  const UpdateProgressEvent(this.progress);

  @override
  List<Object?> get props => [progress];
}
