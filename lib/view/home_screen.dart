import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mind_spark/components/quiz_card.dart';
import 'package:mind_spark/modal/quiz_info.dart';
import 'package:mind_spark/services/quiz_api_service.dart';
import 'package:mind_spark/state/quiz-provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  QuizInfo? _quizData ;
  bool _isLoading = true ;

  void onClick(){
      Navigator.pushNamed(context, '/quiz-screen');
  }

  void _resetQuiz(){
    final quizProvider = Provider.of<QuizProvider>(context,listen: false);
    quizProvider.resetQuiz();
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _resetQuiz();
    _loadQuizData();
  }

  Future<void> _loadQuizData() async{
    try{
      ApiQuizService api = ApiQuizService();
      QuizInfo fetchQuiz = await api.fetchQuizData();

      if (!mounted) return;

      final quizProvider = Provider.of<QuizProvider>(context,listen: false);
      quizProvider.addAllQuizQuestions(fetchQuiz.questions);


      quizProvider.addPoints(fetchQuiz.wrongAnswerPoint, fetchQuiz.correctAnswerPoint);

      setState(() {
        _quizData = fetchQuiz;
        _isLoading = false;
      });

    }catch(e){
      if(kDebugMode){
        print("Error fetching quiz data : $e");
      }
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.green[300],
        centerTitle: true,
        title: const Text('Mind Spark'),
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _quizData == null
              ? const Center(child: Text('Failed to load quiz data'))
              : SizedBox(
                width: double.infinity,
                child: Column(
                          crossAxisAlignment : CrossAxisAlignment.center,
                          children: [
                            QuizCard(title: _quizData!.title, desc: _quizData!.topic, onClick: onClick, duration: _quizData!.duration.toString(), correctAnswerPoint: _quizData!.correctAnswerPoint, wrongAnswerPoint: _quizData!.wrongAnswerPoint,)
                          ],
                        ),
              )
      ),
    );
  }
}
