import 'package:mind_spark/modal/quiz_model.dart';

class QuizInfo {
  final String title;
  final String topic;
  final int duration;
  final double correctAnswerPoint;
  final double wrongAnswerPoint ;
  final List<Quiz> questions ;

  QuizInfo({
    required this.title,
    required this.topic,
    required this.duration,
    required this.correctAnswerPoint,
    required this.wrongAnswerPoint,
    required this.questions,
  });
}
