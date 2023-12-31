import 'package:flutter/material.dart';
import 'package:news_app/config/root/app_roots.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/home/home.dart';
import 'package:news_app/saved_news/saved_news.dart';

import '../../search_page/search_page.dart';
import '../../show_single_news/show_single_news.dart';

class OnGenerateRoot {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoot.home:
        return MaterialPageRoute(builder: (context) => const Home());
      case AppRoot.searchPage:
        return MaterialPageRoute(builder: (context) => const SearchPage());
      case AppRoot.savedNews:
        return MaterialPageRoute(builder: (context) => const SavedNews());
      case AppRoot.showNewsContent:
        NewsModel newsModel = routeSettings.arguments as NewsModel;
        return MaterialPageRoute(
            builder: (context) => ShowSingleNews(
                  newsModel: newsModel,
                ));
    }
    return null;
  }
}
