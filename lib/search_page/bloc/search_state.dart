part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.newsList = const [],
    this.errorMassage = '',
    this.loadingTypes = LoadingTypes.init,
    required this.textFieldController,
  });
  final List<NewsModel> newsList;
  final LoadingTypes loadingTypes;
  final String errorMassage;
  final TextEditingController textFieldController;

  SearchState copyWith({
    List<NewsModel>? newsList,
    LoadingTypes? loadingTypes,
    String? errorMassage,
  }) =>
      SearchState(
        errorMassage: errorMassage ?? this.errorMassage,
        loadingTypes: loadingTypes ?? this.loadingTypes,
        newsList: newsList ?? this.newsList,
        textFieldController: textFieldController,
      );
  @override
  List<Object> get props =>
      [newsList, loadingTypes, errorMassage, textFieldController];
}
