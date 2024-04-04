import 'package:equatable/equatable.dart';
import 'package:pro_profile/core/pro_profile_export.dart';

part 'reach_event.dart';
part 'reach_state.dart';

class ReachBloc extends Bloc<ReachEvent, ReachState> {
  ReachBloc(super.initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  void _onInitialize(
      HomeInitialEvent event,
      Emitter<ReachState> emit,
      ) async {
    emit(state.copyWith());
  }
}
