import 'package:flutter/material.dart';
import 'package:mind_spark/components/question-card.dart';
import 'package:mind_spark/modal/quiz_model.dart';
import 'package:provider/provider.dart';
import '../state/quiz-provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    // Access the list of questions
    List<Quiz> allQuestions = quizProvider.getAllQuizQuestions;
    int activeQuestionCount = quizProvider.getActiveQuestionCount;

    // Navigate to results screen if all questions are answered
    if (activeQuestionCount >= allQuestions.length) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, '/result-screen');
      });
      // Return an empty container or placeholder while waiting for navigation
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Display the current question
    Quiz quiz = allQuestions[activeQuestionCount];
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionCard(question: quiz),
          ],
        ),
      ),
    );
  }
}
