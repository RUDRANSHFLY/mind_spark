import 'package:flutter/material.dart';
import 'package:mind_spark/state/quiz-provider.dart';
import 'package:mind_spark/view/home_screen.dart';
import 'package:mind_spark/view/quiz_screen.dart';
import 'package:mind_spark/view/result_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // tested with just a hot reload.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/' : (context) => const HomeScreen(),
          '/quiz-screen' : (context) => const QuizScreen(),
          '/result-screen' : (context) => const ResultScreen(),
        },
      ),
    );
  }
}


