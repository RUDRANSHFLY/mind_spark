import 'package:flutter/cupertino.dart';
import 'package:mind_spark/modal/quiz_model.dart';

class QuizProvider with ChangeNotifier{

  final List<Quiz> _questions = [] ;
  int _activeQuestionCount = 0 ;
  double _score = 0 ;
  int _correctAnswerCount = 0 ;
  int _wrongAnswerCount = 0 ;

  double _correctAnswerPoint = 0 ;
  double _wrongAnswerPoint = 0 ;

  List<Quiz> get getAllQuizQuestions => _questions;
  int get getActiveQuestionCount => _activeQuestionCount;
  int get quizQuestionLength => _questions.length;
  int get activeQuestionCount => _activeQuestionCount;
  double get getScore => _score;
  double get getTotalScore => _questions.length * _correctAnswerPoint;
  int get getCorrectAnswerCount => _correctAnswerCount;
  int get getWrongAnswerCount => _wrongAnswerCount;


  void addPoints(double wrongPoint , double correctPoint){
    _correctAnswerPoint = correctPoint ;
    _wrongAnswerPoint = wrongPoint ;
    notifyListeners();
  }

  void addAllQuizQuestions(List<Quiz> questions){
    _questions.addAll(questions);
    notifyListeners();
  }

  void updateActiveQuizCount(bool isCorrect){
    if(isCorrect){
      _score += _correctAnswerPoint ;
      _correctAnswerCount++;
    }else{
      _score -= _wrongAnswerPoint ;
      _wrongAnswerCount++;
    }
    _activeQuestionCount++;
    notifyListeners();
  }

  void resetScore(){
    _score = 0 ;
    notifyListeners();
  }

  void resetActiveQuizCount(){
      _activeQuestionCount = 0 ;
      notifyListeners();
  }
  
  void resetQuiz(){
    _questions.clear() ;
    _activeQuestionCount = 0 ;
    _score = 0 ;
    _correctAnswerPoint = 0 ;
    _correctAnswerCount = 0 ;
    _wrongAnswerPoint = 0 ;
    _wrongAnswerCount = 0;
    notifyListeners();
  }


}