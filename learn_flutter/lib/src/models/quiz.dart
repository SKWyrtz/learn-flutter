import 'quiz_option.dart';

class Quiz {
  final List<QuizOption> options;
  final QuizOption correctAnswer;

  Quiz({
    required this.options,
    required this.correctAnswer,
  }) : assert(options.length == 4, 'Guess must have exactly 4 options');
}
