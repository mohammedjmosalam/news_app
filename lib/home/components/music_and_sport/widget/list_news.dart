import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/loacal/hive_local_storg.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/home/components/music_and_sport/bloc/music_and_sport_cubit.dart';

import 'card_news.dart';

class ListViewNews extends StatelessWidget {
  const ListViewNews({
    super.key,
    required this.newsList,
  });
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return CardNews(
          onTapNews: () => context
              .read<MusicAndSportCubit>()
              .onTapNews(newsList.elementAt(index)),
          news: newsList.elementAt(index),
          isSaved: context
              .read<HiveStorg>()
              .isKeyExist(newsList.elementAt(index).title),
        );
      },
    );
  }
}
