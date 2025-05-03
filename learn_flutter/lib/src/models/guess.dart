import 'guess_option.dart';

class Guess {
  final List<GuessOption> options;
  final GuessOption correctAnswer;

  Guess({
    required this.options,
    required this.correctAnswer,
  }) : assert(options.length == 4, 'Guess must have exactly 4 options');
}
