import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:smart_office/models/poll/poll_model.dart';

class PollsService {
  Future<List<PollTopic>> getActivePollTopic() async {
    try {
      final response = await Dio().get('https://www.lutijdxgodfapi.ru/polls/active');
      final json = response.data;
      List<PollTopic> allPollTopic = [];
      for (Map<String, dynamic> pollTopic in json) {
        allPollTopic.add(PollTopic.fromJson(pollTopic));
      }
      return allPollTopic;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Нет активных опросов');
        return [];
      } else {
        debugPrint('Ошибка не связана c сервером');
        return [];
      }
    }
  }
}