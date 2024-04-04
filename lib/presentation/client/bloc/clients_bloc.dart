import 'package:equatable/equatable.dart';
import 'package:pro_profile/core/pro_profile_export.dart';

part 'clients_event.dart';
part 'clients_state.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  ClientsBloc(super.initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  void _onInitialize(
      HomeInitialEvent event,
      Emitter<ClientsState> emit,
      ) async {
    emit(state.copyWith());
  }
}
