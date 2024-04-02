class HomeItemModel {
  HomeItemModel({
    this.unsplashImg,
    this.id,
  }) {
    unsplashImg = unsplashImg ?? "";
    id = id ?? "";
  }

  String? unsplashImg;

  String? id;
}
