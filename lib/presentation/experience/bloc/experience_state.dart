part of 'experience_bloc.dart';

class ExperienceState extends Equatable {
  final int activeStep;
  final double progress;

  const ExperienceState({this.activeStep = 0, this.progress = 0.0});

  @override
  List<Object?> get props => [activeStep, progress];

  ExperienceState copyWith({int? activeStep, double? progress}) {
    return ExperienceState(
      activeStep: activeStep ?? this.activeStep,
      progress: progress ?? this.progress,
    );
  }
}
