import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api/news_api.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/model/result_api.dart';

import '../../config/enum/loading_type.dart';
import '../../config/root/app_roots.dart';
import '../../data/repostory/news_api.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final BuildContext context;
  SearchCubit({
    required this.context,
  }) : super(SearchState(
          textFieldController: TextEditingController(),
        ));
  void onTapOkOnErrorDialog() {
    emit(state.copyWith(
      loadingTypes: LoadingTypes.init,
      errorMassage: '',
    ));
  }

  Future<void> searchText() async {
    emit(state.copyWith(
      loadingTypes: LoadingTypes.loading,
    ));
    String textSearch = state.textFieldController.text.trim();
    NewsApiRepository newsApiRepository = NewsApiRepository(
      newsApi: NewsApi(),
    );
    ResultApi resultApi =
        await newsApiRepository.getSearchResult(searchText: textSearch);
    if (resultApi.isDone) {
      List<NewsModel> news = List.from(resultApi.resultOrError);
      emit(state.copyWith(
        loadingTypes: LoadingTypes.successful,
        newsList: news,
      ));
    } else {
      emit(state.copyWith(
        errorMassage: resultApi.resultOrError,
        loadingTypes: LoadingTypes.error,
      ));
    }
  }

  void onTapNews(NewsModel newsModel) {
    Navigator.pushNamed(
      context,
      AppRoot.showNewsContent,
      arguments: newsModel,
    );
  }
}
