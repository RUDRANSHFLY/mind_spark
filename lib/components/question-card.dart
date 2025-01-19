import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../state/quiz-provider.dart';
import '../modal/quiz_model.dart';

class QuestionCard extends StatefulWidget {
  final Quiz question;
  const QuestionCard({super.key, required this.question});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? selectedOptionId;
  bool? isCorrect;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void handleQuestionChange(int optionId) async {
    bool isOptionCorrect = optionId == widget.question.answer;

    setState(() {
      selectedOptionId = optionId;
      isCorrect = isOptionCorrect;
    });

    final quizProvider = Provider.of<QuizProvider>(context, listen: false);

    // Play sound and provide feedback
    try {
      String soundAsset =
      isOptionCorrect ? 'assets/sound/right.mp3' : 'assets/sound/wrong.mp3';
      await player.setAsset(soundAsset);
      player.play();

      isOptionCorrect
          ? HapticFeedback.lightImpact()
          : HapticFeedback.heavyImpact();
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }

    // Delay and then update the quiz state
    Future.delayed(const Duration(seconds: 1), () {
      quizProvider.updateActiveQuizCount(isOptionCorrect);
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    int activeCount = quizProvider.getActiveQuestionCount + 1;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Q-$activeCount: ${widget.question.questionDesc}",
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
                onTap: () => handleQuestionChange(option.id),
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
            },
          ),
        ],
      ),
    );
  }
}
