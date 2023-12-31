import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/enum/catagories_type_news.dart';
import 'package:news_app/config/enum/loading_type.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/model/result_api.dart';
import 'package:news_app/data/repostory/news_api.dart';

import '../../../../config/root/app_roots.dart';

part 'music_and_sport_state.dart';

class MusicAndSportCubit extends Cubit<MusicAndSportState> {
  final NewsApiRepository newsApiRepository;
  final CatagoriesTypeNews catagoriesTypeNews;
  final BuildContext context;
  MusicAndSportCubit({
    required this.newsApiRepository,
    required this.catagoriesTypeNews,
    required this.context,
  }) : super(const MusicAndSportState()) {
    getNews();
  }
  Future<void> getNews() async {
    final ResultApi resultApi =
        await newsApiRepository.getNews(catagoriesTypeNews: catagoriesTypeNews);
    if (resultApi.isDone) {
      List<NewsModel> newsList = List.from(resultApi.resultOrError);
      emit(state.copyWith(
        loadingTypes: LoadingTypes.successful,
        listNews: newsList,
        errorMassage: '',
      ));
    } else {
      emit(state.copyWith(
        errorMassage: resultApi.resultOrError,
        loadingTypes: LoadingTypes.error,
      ));
    }
  }

  void refreshToGetData() {
    emit(state.copyWith(
      loadingTypes: LoadingTypes.loading,
    ));
    getNews();
  }

  void onTapNews(NewsModel newsModel) {
    Navigator.pushNamed(
      context,
      AppRoot.showNewsContent,
      arguments: newsModel,
    );
  }
}
