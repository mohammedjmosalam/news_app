import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/model/result_api.dart';

import '../../config/enum/catagories_type_news.dart';
import '../api/news_api.dart';

class NewsApiRepository {
  final NewsApi newsApi;
  NewsApiRepository({required this.newsApi});
  Future<ResultApi> getNews({
    required CatagoriesTypeNews catagoriesTypeNews,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      ResultApi resultApi =
          await newsApi.getNews(catagoriesTypeNews: catagoriesTypeNews);
      if (resultApi.isDone) {
        Map<String, dynamic> data = jsonDecode(resultApi.resultOrError);
        List dataJsonList = List.from(data['articles']);
        List<NewsModel> listNews = [];
        for (var element in dataJsonList) {
          listNews.add(NewsModel.fromJson(element));
        }
        return ResultApi(isDone: true, resultOrError: listNews);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(
        isDone: false,
        resultOrError: 'No internet access',
      );
    }
  }

  Future<ResultApi> getSearchResult({
    required String searchText,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      ResultApi resultApi =
          await newsApi.getSearchResult(searchText: searchText);
      if (resultApi.isDone) {
        Map<String, dynamic> data = jsonDecode(resultApi.resultOrError);
        List dataJsonList = List.from(data['articles']);
        List<NewsModel> listNews = [];
        for (var element in dataJsonList) {
          listNews.add(NewsModel.fromJson(element));
        }
        return ResultApi(isDone: true, resultOrError: listNews);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(
        isDone: false,
        resultOrError: 'No internet access',
      );
    }
  }
}
