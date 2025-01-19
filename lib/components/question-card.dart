import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mind_spark/modal/quiz_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';


import '../state/quiz-provider.dart';

class QuestionCard extends StatefulWidget {
  final Quiz question;
  const QuestionCard({super.key, required this.question});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? selectedOptionId;
  bool? isCorrect;

  void handleQuestionChange(int optionId) {
    bool isOptionCorrect = optionId == widget.question.answer;

    setState(() {
      selectedOptionId = optionId;
      isCorrect = isOptionCorrect;
    });

    final quizProvider = Provider.of<QuizProvider>(context, listen: false);


    Future.delayed(const Duration(seconds: 2), () async {
      if (isOptionCorrect) {
        await player.setAsset('assets/sound/right.mp3');
        player.play();
        HapticFeedback.lightImpact();
      } else {
        await player.setAsset('assets/sound/wrong.mp3');
        player.play();
        HapticFeedback.heavyImpact();
      }
      quizProvider.updateActiveQuizCount(isOptionCorrect);
    });
  }

  late AudioPlayer player;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

    @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    int activeCount = quizProvider.getActiveQuestionCount;
    activeCount++;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Q-$activeCount : ${widget.question.questionDesc}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.question.options.length,
              itemBuilder: (context, index) {
                final option = widget.question.options[index];
                bool isSelected = selectedOptionId == option.id;
                bool isOptionCorrect = option.id == widget.question.answer;
                return GestureDetector(
                  onTap: () {
                    handleQuestionChange(option.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected
                          ? (isOptionCorrect ? Colors.green : Colors.red)
                          : CupertinoColors.systemGrey5,
                    ),
                    child: Text(
                      option.text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
