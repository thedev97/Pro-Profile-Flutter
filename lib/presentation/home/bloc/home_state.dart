part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeModel? homeModel;

  const HomeState({this.homeModel});

  @override
  List<Object?> get props => [homeModel];

  HomeState copyWith({HomeModel? homeModel}) {
    return HomeState(homeModel: homeModel ?? this.homeModel);
  }
}

