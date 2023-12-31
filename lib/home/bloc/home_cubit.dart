import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/root/app_roots.dart';

import '../../config/enum/catagories_type_news.dart';
import '../components/music_and_sport/view/music_and_sport.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BuildContext context;
  HomeCubit({
    required this.context,
  }) : super(
          HomeState(
            pageController: PageController(),
            pagesInHome: const [
              MusicAndSportNews(
                catagoriesTypeNews: CatagoriesTypeNews.music,
              ),
              MusicAndSportNews(
                catagoriesTypeNews: CatagoriesTypeNews.sport,
              ),
            ],
          ),
        );
  void onTapTitleBottomBar(int index) {
    emit(state.copyWith(
      selectedPage: index,
    ));
    state.pageController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.decelerate,
    );
  }

  void onTapSearch() {
    Navigator.pushNamed(context, AppRoot.searchPage);
  }

  void goToSavedNews() {
    Navigator.pushNamed(context, AppRoot.savedNews);
  }
}
