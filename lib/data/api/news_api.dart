import 'package:flutter/material.dart';
import 'package:news_app/config/extension/string.dart';

import '../../config/enum/catagories_type_news.dart';
import '../model/result_api.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  Future<ResultApi> getNews({
    required CatagoriesTypeNews catagoriesTypeNews,
  }) async {
    try {
      Uri uri = Uri.https(''.baseUrlNews, ''.baseUrlWithTop, {
        'country': 'us',
        'category': catagoriesTypeNews.value,
        'apiKey': ''.getApiKey,
      });
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(
            isDone: false, resultOrError: 'Some error Accord in server');
      }
    } catch (e) {
      debugPrint(e.toString());
      return ResultApi(isDone: false, resultOrError: 'Some error accord');
    }
  }

  Future<ResultApi> getSearchResult({
    required String searchText,
  }) async {
    try {
      Uri uri = Uri.https(''.baseUrlNews, ''.baseUrlWithEverything, {
        'q': searchText,
        'sortBy': 'publishedAt',
        'apiKey': ''.getApiKey,
      });
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: response.body);
      } else {
        return ResultApi(
            isDone: false, resultOrError: 'Some error Accord in server');
      }
    } catch (e) {
      debugPrint(e.toString());
      return ResultApi(isDone: false, resultOrError: 'Some error accord');
    }
  }
}
