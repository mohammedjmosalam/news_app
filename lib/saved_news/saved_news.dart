import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/loacal/hive_local_storg.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/home/components/music_and_sport/widget/card_news.dart';

import 'bloc/saved_news_cubit.dart';

class SavedNews extends StatelessWidget {
  const SavedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedNewsCubit>(
      create: (contextB) => SavedNewsCubit(
        context: context,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Saved News',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<SavedNewsCubit, SavedNewsState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                NewsModel news = state.newsList.elementAt(index);
                return CardNews(
                  news: news,
                  onTapNews: () =>
                      context.read<SavedNewsCubit>().onTapNews(news),
                  isSaved: context.read<HiveStorg>().isKeyExist(news.title),
                  onChangeSavedNews: (value) =>
                      context.read<SavedNewsCubit>().removeNewsFromList(value),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
