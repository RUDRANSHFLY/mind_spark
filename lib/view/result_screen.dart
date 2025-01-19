import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../state/quiz-provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    double score = quizProvider.getScore;
    double count = quizProvider.getTotalScore;
    int correctAnswers = quizProvider.getCorrectAnswerCount;
    int wrongAnswers = quizProvider.getWrongAnswerCount;


    return Placeholder(
      child: Scaffold(
        body: SafeArea(
            child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.tealAccent,
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Result',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$score / $count',
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Take Another',style: TextStyle(fontSize: 30,color: Colors.white),),
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text('Correct Answer : ',style: TextStyle(fontSize: 25),)
                ,Text(correctAnswers.toString(),style: const TextStyle(fontSize: 25),),
                const SizedBox(width: 10,),
                const Icon(Icons.check,color: Colors.green,size: 35,)
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text('Wrong Answer : ', style: TextStyle(fontSize: 25),)
                ,Text(wrongAnswers.toString(),style: const TextStyle(fontSize: 25),),
                  const SizedBox(width: 10,),
                const Icon(Icons.close,color: Colors.red,size: 35,)
              ],)
            ],
          ),
        )),
      ),
    );
  }
}
