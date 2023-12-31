import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/loacal/hive_local_storg.dart';
import 'package:news_app/data/model/news_model.dart';

import '../../config/root/app_roots.dart';

part 'saved_news_state.dart';

class SavedNewsCubit extends Cubit<SavedNewsState> {
  final BuildContext context;
  SavedNewsCubit({
    required this.context,
  }) : super(const SavedNewsState()) {
    getAllSavedNews();
  }
  void getAllSavedNews() {
    List<Map> allNewsJson = context.read<HiveStorg>().getAllSavedNews();
    List<NewsModel> newsList = List.generate(
      allNewsJson.length,
      (index) => NewsModel.fromJson(
        (allNewsJson.elementAt(index)),
      ),
    );
    emit(state.copyWith(
      newsList: newsList,
    ));
  }

  void removeNewsFromList(String key) {
    List<NewsModel> newsList = List.from(state.newsList);

    newsList.removeWhere((element) => element.title == key);
    emit(state.copyWith(
      newsList: newsList,
    ));
  }

  void onTapNews(NewsModel news) {
    Navigator.pushNamed(
      context,
      AppRoot.showNewsContent,
      arguments: news,
    );
  }
}
