part of 'music_and_sport_cubit.dart';

class MusicAndSportState extends Equatable {
  const MusicAndSportState({
    this.listNews = const [],
    this.loadingTypes = LoadingTypes.loading,
    this.errorMassage = '',
  });
  final List<NewsModel> listNews;
  final LoadingTypes loadingTypes;
  final String errorMassage;
  MusicAndSportState copyWith({
    List<NewsModel>? listNews,
    LoadingTypes? loadingTypes,
    String? errorMassage,
  }) =>
      MusicAndSportState(
        errorMassage: errorMassage ?? this.errorMassage,
        loadingTypes: loadingTypes ?? this.loadingTypes,
        listNews: listNews ?? this.listNews,
      );

  @override
  List<Object> get props => [listNews, loadingTypes, errorMassage];
}
