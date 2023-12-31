import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/enum/catagories_type_news.dart';
import '../../../../config/enum/loading_type.dart';
import '../../../../data/api/news_api.dart';
import '../../../../data/repostory/news_api.dart';
import '../bloc/music_and_sport_cubit.dart';
import '../widget/list_news.dart';
import '../widget/show_error.dart';

class MusicAndSportNews extends StatelessWidget {
  const MusicAndSportNews({
    super.key,
    required this.catagoriesTypeNews,
  });
  final CatagoriesTypeNews catagoriesTypeNews;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MusicAndSportCubit>(
      create: (contextB) => MusicAndSportCubit(
        newsApiRepository: NewsApiRepository(
          newsApi: NewsApi(),
        ),
        catagoriesTypeNews: catagoriesTypeNews,
        context: context,
      ),
      child: BlocBuilder<MusicAndSportCubit, MusicAndSportState>(
        builder: (context, state) {
          if (state.loadingTypes == LoadingTypes.loading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          } else if (state.loadingTypes == LoadingTypes.error) {
            return ShowErrorMassage(
              errorMassage: state.errorMassage,
            );
          } else {
            return ListViewNews(
              newsList: state.listNews,
            );
          }
        },
      ),
    );
  }
}
