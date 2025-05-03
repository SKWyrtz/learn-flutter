import 'dart:async';

import '../models/quiz.dart';
import '../models/tank.dart';

class QuizService {
  Future<Quiz> fetchQuiz() async {
    await Future.delayed(Duration(milliseconds: 500)); // simulate network delay

    var correctTank = Tank("1", "Grant", "assets/images/tanks/grant.jpg");
    var tankList = [
      correctTank,
      Tank("2", "Panzer IV", "assets/images/tanks/panzer_iv.jpg"),
      Tank("3", "Panzer V (Panther)",
          "assets/images/tanks/panzer_v_panther.jpg"),
      Tank("4", "Sherman", "assets/images/tanks/sherman.jpg"),
    ];

    return Quiz(options: tankList, correctAnswer: correctTank);
  }
}
