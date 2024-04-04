import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'experience_event.dart';
part 'experience_state.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  ExperienceBloc(ExperienceState experienceState) : super(const ExperienceState());

  Stream<ExperienceState> mapEventToState(ExperienceEvent event) async* {
    if (event is UpdateActiveStepEvent) {
      yield state.copyWith(activeStep: event.activeStep);
    } else if (event is UpdateProgressEvent) {
      yield state.copyWith(progress: event.progress);
    }
  }
}