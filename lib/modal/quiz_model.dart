class Quiz {
  final int questionId ;
  final String questionDesc;
  final List<QuestionOption> options;
  final int answer;

  Quiz({
    required this.questionId,
    required this.questionDesc,
    required this.answer,
    required this.options,
  });

}

class QuestionOption{
  final int id ;
  final String text ;

  QuestionOption({
    required this.id,
    required this.text,
  });
}