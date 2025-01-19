import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String desc;
  final VoidCallback onClick;
  final String duration;
  final double correctAnswerPoint;
  final double wrongAnswerPoint;

  const QuizCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.onClick,
      required this.duration,
      required this.correctAnswerPoint,
      required this.wrongAnswerPoint});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  desc,
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    duration,
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ]),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      '$correctAnswerPoint',
                      style: TextStyle(fontSize: 20, color: Colors.green[700]),
                    ),
                    const SizedBox(width: 20,),
                    Icon(
                      Icons.close,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      '-$wrongAnswerPoint',
                      style: TextStyle(fontSize: 20, color: Colors.green[700]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
