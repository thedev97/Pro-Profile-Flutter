part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<String> featuredImages;
  final List<String> projectImages;

  const HomeState(
      {this.featuredImages = const [], this.projectImages = const []});

  @override
  List<Object?> get props => [featuredImages, projectImages];

  HomeState copyWith(
      {List<String>? featuredImages, List<String>? projectImages}) {
    return HomeState(
        featuredImages: featuredImages ?? this.featuredImages,
        projectImages: projectImages ?? this.projectImages);
  }
}
