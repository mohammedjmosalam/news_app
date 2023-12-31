import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/loacal/hive_local_storg.dart';
import 'package:news_app/home/components/music_and_sport/widget/card_news.dart';
import 'package:news_app/search_page/bloc/search_cubit.dart';

import '../../config/enum/loading_type.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listenWhen: (previous, current) =>
          previous.loadingTypes != current.loadingTypes,
      listener: (context, state) {
        switch (state.loadingTypes) {
          case LoadingTypes.loading:
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Loading'),
                      ],
                    ),
                  ),
                ),
              ),
            );
            break;
          case LoadingTypes.error:
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                          size: 50,
                        ),
                        const Text('Error'),
                        Text(state.errorMassage),
                        ElevatedButton(
                            onPressed: () => context
                                .read<SearchCubit>()
                                .onTapOkOnErrorDialog(),
                            child: const Text('Ok'))
                      ],
                    ),
                  ),
                ),
              ),
            );
            break;
          case LoadingTypes.successful:
          case LoadingTypes.init:
            Navigator.pop(context);
            break;

          default:
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: state.textFieldController,
                cursorColor: Colors.red,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) =>
                    context.read<SearchCubit>().searchText(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => context.read<SearchCubit>().searchText(),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'Enter Text To Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                return CardNews(
                  news: state.newsList.elementAt(index),
                  isSaved: context
                      .read<HiveStorg>()
                      .isKeyExist(state.newsList.elementAt(index).title),
                  onTapNews: () => context
                      .read<SearchCubit>()
                      .onTapNews(state.newsList.elementAt(index)),
                );
              },
            ))
          ],
        );
      },
    );
  }
}
