import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:smart_office/models/news/news_model.dart';


class NewsService {
  Future<List<News>> getNews() async {
    try {
      final response = await Dio().get('https://www.lutijdxgodfapi.ru/news/get');
      final json = response.data;
      List<News> allNews = [];
      for (Map<String, dynamic> news in json) {
        allNews.add(News.fromJson(news));
      }
      return allNews;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Нет новостей');
        return [];
      } else {
        debugPrint('Ошибка не связана c сервером');
        return [];
      }
    }
  }
}