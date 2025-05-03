import 'package:flutter/material.dart';
import 'package:learn_flutter/src/models/quiz_option.dart';
import '../../../models/quiz.dart';
import '../../../models/tank.dart';
import '../../../services/guess_api_service.dart';
import '../../shared/background_container.dart';

// var correctTank = Tank("1", "Grant", "assets/images/tanks/grant.jpg");
// var tankList = [
//   correctTank,
//   Tank("2", "Panzer IV", "assets/images/tanks/panzer_iv.jpg"),
//   Tank("3", "Panzer V (Panther)", "assets/images/tanks/panzer_v_panther.jpg"),
//   Tank("4", "sherman", "assets/images/tanks/sherman.jpg"),
// ];
// Guess tankGuesses = Guess(options: tankList, correctAnswer: correctTank);

class QuizView extends StatefulWidget {
  const QuizView({super.key});
  static const routeName = '/quiz';

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  bool hasAnswered = false;
  int? answerIndex;
  late ThemeData theme;

  final QuizService _quizService = QuizService();
  Quiz? currentQuiz;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  void _loadQuiz() async {
    final quiz = await _quizService.fetchQuiz();
    setState(() {
      currentQuiz = quiz;
    });
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    if (currentQuiz == null) {
      return Scaffold(
        appBar: _buildAppBar(), //TODO: fix replicated code
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 3,
          child: GridView.count(
              padding: const EdgeInsets.all(8.0),
              primary: false,
              crossAxisCount: 2,
              children: [
                ...currentQuiz!.options
                    .map((tank) => _buildQuizOption(tank as Tank))
              ]),
        ),
        Expanded(
            flex: 2,
            child: AppBackgroundContainer(
                child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    Text("Click on the tank you think is correct",
                        style: theme.textTheme.labelSmall),
                    Text(currentQuiz!.correctAnswer.name,
                        style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold)),
                  ]),
                  if (hasAnswered)
                    ElevatedButton(
                        onPressed: () => {print("skibidi")}, child: Text("BOB"))
                ],
              ),
            ))),
      ]),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(title: const Text('Guess the Tank'));
  }

  Widget _buildQuizOption(Tank tank) {
    final backgroundColor = hasAnswered
        ? _colorQuizOption(tank, answerIndex!)
        : theme.colorScheme.primary;

    return Card(
      margin: const EdgeInsets.all(5),
      color: backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: theme.colorScheme.secondary,
        onTap: () => _onOptionSelected(tank),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(tank.imagePath),
              ),
              const SizedBox(height: 10),
              if (hasAnswered)
                Text(
                  tank.name,
                  style: TextStyle(color: theme.colorScheme.onPrimary),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _colorQuizOption(QuizOption option, int answerIndex) {
    if (option == currentQuiz!.correctAnswer) {
      return Colors.green;
    } else if (option == currentQuiz!.options[answerIndex]) {
      return Colors.red;
    }
    return theme.colorScheme.secondary;
  }

  void _onOptionSelected(Tank tank) {
    final correctTank = currentQuiz!.correctAnswer;
    print(tank == correctTank ? "Correct!" : "Incorrect!");
    setState(() {
      hasAnswered = true;
      answerIndex = currentQuiz!.options.indexOf(tank);
    });
  }
}
