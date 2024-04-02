import 'package:equatable/equatable.dart';
import 'home_item_model.dart';

class HomeModel extends Equatable {
  final List<HomeItemModel> homeItemList;

  const HomeModel({this.homeItemList = const []});

  HomeModel copyWith({List<HomeItemModel>? homeItemList}) {
    return HomeModel(
      homeItemList: homeItemList ?? this.homeItemList,
    );
  }

  @override
  List<Object?> get props => [homeItemList];
}
