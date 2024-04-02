import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pro_profile/core/pro_profile_export.dart';
import 'package:pro_profile/presentation/home/models/home_model.dart';

import '../models/home_item_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        homeModel: state.homeModel?.copyWith(homeItemList: homeItemList())));
  }

  List<HomeItemModel> homeItemList() {
    return [
      /*HomeItemModel(unsplashImg: ProProfileImageConstant.imgUnsplashD2w1ljioq),
      HomeItemModel(unsplashImg: ProProfileImageConstant.imgUnsplashWoc71cKzq),
      HomeItemModel(unsplashImg: ProProfileImageConstant.imgUnsplash5sf6nrb1meg),
      HomeItemModel(unsplashImg: ProProfileImageConstant.imgUnsplashOqtafyt5ktw),
      HomeItemModel(unsplashImg: ProProfileImageConstant.imgUnsplashGkfqeoubrco),
      HomeItemModel(unsplashImg: ProProfileImageConstant.imgUnsplashMp7apsum7ae)*/
    ];
  }
}
