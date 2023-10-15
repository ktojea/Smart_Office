import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:smart_office/models/profile/profile_model.dart';


class ProfileService {
  Future getProfile(int profileId) async {
    try {
      final response = await Dio().get('https://www.lutijdxgodfapi.ru/users/${profileId}');
      final json = response.data;
      final profile = Profile.fromJson(json);
      return profile;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Такого профиля не существует');
        return null;
      } else {
        debugPrint('Ошибка не связана c сервером');
        return null;
      }
    }
  }
}