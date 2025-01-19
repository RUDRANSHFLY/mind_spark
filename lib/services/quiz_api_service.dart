import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mind_spark/modal/quiz_info.dart';
import 'package:mind_spark/modal/quiz_model.dart';

final dio = Dio();

class ApiQuizService {
  final String apiUrl = 'https://api.jsonserve.com/Uw5CrX';

  Future<QuizInfo> fetchQuizData() async {
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var data = response.data;
        


        String title = data['title'];
        String topic = data['topic'];
        int duration = data['duration'];



        double correctAnswerMark = double.parse(data['correct_answer_marks']);
        double wrongAnswerMark = double.parse(data['negative_marks']);



         List<Quiz> quizQuestions = [];
        final questions = data['questions'];

         for (var question in questions) {
           int questionId = question['id'];
           String questionDesc = question['description'];
           int correctOptionId = 0;

           final questionOptions = question['options'];

           List<QuestionOption> questionOptionsList = [];
           for (var option in questionOptions) {
             if (option['is_correct'] == true) {
              correctOptionId = option['id'];
            }
             QuestionOption questionOption =
             QuestionOption(id: option['id'], text: option['description']);
             questionOptionsList.add(questionOption);
           }

           Quiz oneQ = Quiz(questionId: questionId, questionDesc: questionDesc, answer: correctOptionId, options: questionOptionsList);
           quizQuestions.add(oneQ);
         }

         QuizInfo quiz = QuizInfo(title: title, topic: topic, duration: duration, correctAnswerPoint: correctAnswerMark, wrongAnswerPoint: wrongAnswerMark, questions: quizQuestions);

         return quiz;
      } else {
        throw Exception('Unable to load quiz data');
      }
    } catch (e) {
      throw Exception("Error fetching on quiz data : $e");
    }
  }
}
