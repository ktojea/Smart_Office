import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:smart_office/models/registration/registration_data_model.dart';

class AuthService {
  Future resetPasswordCheckEmail(String email) async {
    try {
      final formData = {'email': email};

      final response = await Dio()
          .post('https://www.lutijdxgodfapi.ru/password-reset', data: formData);
      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        debugPrint('Error $statusCode');
        return e.response!.statusMessage;
      } else {
        debugPrint('Ошибка не в запросах...');
      }
    }
  }

  Future resetPasswordCheckCode(String email, String code) async {
    try {
      final Map<String, String> dataQuery = {
        'email': email,
        'verification_code': code
      };
      await Dio().get('https://www.lutijdxgodfapi.ru/password-reset',
          queryParameters: dataQuery);
      return true;
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        debugPrint('Error $statusCode');
        return e.response!.data['detail'];
      } else {
        debugPrint('Ошибка не в запросах...');
      }
    }
  }

  Future<String> resetPassword(
      String email, String password, String code) async {
    try {
      Map<String, String> formData = {
        'email': email,
        'password': password,
        'verification_code': code,
      };
      final response = await Dio()
          .put('https://www.lutijdxgodfapi.ru/password-reset', data: formData);
      return response.data['message'];
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        debugPrint('Error $statusCode');
        return e.response!.data['detail'];
      } else {
        debugPrint('Ошибка не в запросах...');
        return 'Ошибка не в запросах...';
      }
    }
  }

  Future<String> signInUser(String email, String password) async {
    final formData = FormData.fromMap({
      'username': email,
      'password': password,
    });
    var prefs = await SharedPreferences.getInstance();

    try {
      final response = await Dio()
          .post('https://www.lutijdxgodfapi.ru/login', data: formData);
      final _token = response.data['access_token'];
      final _userId = response.data['user_id'];
      prefs.setString('token', _token);
      prefs.setString('email', email);
      prefs.setString('password', password);
      prefs.setInt('user_id', _userId);
      return 'Успешный вход';
    } on DioException catch (e) {
      prefs.remove('email');
      prefs.remove('password');
      prefs.remove('user_id');
      prefs.remove('token');

      if (e.response != null) {
        debugPrint('Error ${e.response!.statusCode}');
        return e.response!.data['detail'];
      } else {
        debugPrint('Ошибка не в запросах...');
        return 'Error not found';
      }
    }
  }

  Future<String> regUser(RegistrationData data) async {
    final formData = {
      'name': data.name,
      'surname': data.surname,
      'email': data.email,
      'password': data.password,
    };
    try {
      await Dio().post('https://www.lutijdxgodfapi.ru/users/', data: formData);
      return 'ok';
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        debugPrint('Error $statusCode');
        if (statusCode == 400) {
          return 'Почта уже исользуется';
        } else {
          return 'Неверный формат почты';
        }
      } else {
        debugPrint('Ошибка не в запросах...');
        return 'Error not found';
      }
    }
  }
}
