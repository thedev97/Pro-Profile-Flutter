import 'package:equatable/equatable.dart';
import 'package:pro_profile/core/pro_profile_export.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc(super.initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  void _onInitialize(
      HomeInitialEvent event,
      Emitter<ProjectState> emit,
      ) async {
    emit(state.copyWith());
  }
}
