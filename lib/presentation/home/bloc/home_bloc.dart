import 'package:equatable/equatable.dart';
import 'package:pro_profile/core/pro_profile_export.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  void _onInitialize(
      HomeInitialEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(
      featuredImages: ProProfileHelper.featuredImages,
      projectImages: ProProfileHelper.projectImages,
    ));
  }
}
