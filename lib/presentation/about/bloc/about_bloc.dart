import 'package:equatable/equatable.dart';
import 'package:pro_profile/core/pro_profile_export.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc(super.initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  void _onInitialize(
      HomeInitialEvent event,
      Emitter<AboutState> emit,
      ) async {
    emit(state.copyWith());
  }
}
