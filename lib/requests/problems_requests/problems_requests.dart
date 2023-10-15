import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_office/models/problem_and_solution/problem_model.dart';
import 'package:smart_office/models/problem_and_solution/solution_model.dart';

class ProblemsService {
  Future<List<Problem>> getActiveProblems() async {
    try {
      final response = await Dio()
          .get('https://www.lutijdxgodfapi.ru/stackoverflow/problem');
      final json = response.data;
      List<Problem> allProblems = [];
      for (Map<String, dynamic> problem in json) {
        allProblems.add(Problem.fromJson(problem));
      }
      return allProblems;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Нет активных проблем');
        return [];
      } else {
        debugPrint('Ошибка не связана c сервером');
        return [];
      }
    }
  }

  Future<List<Solution>> getSolutions(int problemId) async {
    try {
      final Map<String, dynamic> query = {'problem_id': problemId}; 
      final response = await Dio().get(
        'https://www.lutijdxgodfapi.ru/stackoverflow/problem_answers',
        queryParameters: query,
      );
      final json = response.data;
      List<Solution> allSolutions = [];
      for (Map<String, dynamic> solution in json) {
        allSolutions.add(Solution.fromJson(solution));
      }
      return allSolutions;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('Нет решений для этого вопроса');
        return [];
      } else {
        debugPrint('Ошибка не связана c сервером');
        return [];
      }
    }
  }
}
