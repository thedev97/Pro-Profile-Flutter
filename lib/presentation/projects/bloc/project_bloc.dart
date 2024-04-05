import 'package:equatable/equatable.dart';
import 'package:pro_profile/core/pro_profile_export.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc(ProjectState experienceState) : super(const ProjectState());

  Stream<ProjectState> mapEventToState(ProjectEvent event) async* {
    if (event is UpdateActiveStepEvent) {
      yield state.copyWith(activeStep: event.activeStep);
    } else if (event is UpdateProgressEvent) {
      yield state.copyWith(progress: event.progress);
    }
  }
}