part of 'project_bloc.dart';

class ProjectState extends Equatable {
  final int activeStep;
  final double progress;

  const ProjectState({this.activeStep = 0, this.progress = 0.0});

  @override
  List<Object?> get props => [activeStep, progress];

  ProjectState copyWith({int? activeStep, double? progress}) {
    return ProjectState(
      activeStep: activeStep ?? this.activeStep,
      progress: progress ?? this.progress,
    );
  }
}
