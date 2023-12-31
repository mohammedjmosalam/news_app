part of 'saved_news_cubit.dart';

class SavedNewsState extends Equatable {
  const SavedNewsState({
    this.newsList = const [],
  });
  final List<NewsModel> newsList;
  SavedNewsState copyWith({
    List<NewsModel>? newsList,
  }) =>
      SavedNewsState(
        newsList: newsList ?? this.newsList,
      );
  @override
  List<Object> get props => [newsList];
}
