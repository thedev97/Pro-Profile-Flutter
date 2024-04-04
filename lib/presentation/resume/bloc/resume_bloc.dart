import 'package:equatable/equatable.dart';
import 'package:pro_profile/core/pro_profile_export.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  ResumeBloc(super.initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  void _onInitialize(
      HomeInitialEvent event,
      Emitter<ResumeState> emit,
      ) async {
    emit(state.copyWith());
  }
}
