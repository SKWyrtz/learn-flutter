import 'package:flutter/material.dart';
import '../../../models/guess.dart';
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

class GuessView extends StatefulWidget {
  const GuessView({super.key});
  static const routeName = '/guess';

  @override
  State<GuessView> createState() => _GuessViewState();
}

class _GuessViewState extends State<GuessView> {
  bool hasGuessed = false;
  late ThemeData theme;

  final GuessService _guessService = GuessService();
  Guess? currentGuess;

  @override
  void initState() {
    super.initState();
    _loadGuess();
  }

  void _loadGuess() async {
    currentGuess = await _guessService.fetchGuess();
    setState(() {
      tankGuesses = currentGuess!;
    });
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess the Tank'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 3,
          child: GridView.count(
              padding: const EdgeInsets.all(8.0),
              primary: false,
              crossAxisCount: 2,
              children: [
                ...tankGuesses.options
                    .map((tank) => _buildGuessOption(tank as Tank))
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
                    Text(correctTank.name,
                        style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold)),
                  ]),
                  if (hasGuessed)
                    ElevatedButton(
                        onPressed: () => {print("skibidi")}, child: Text("BOB"))
                ],
              ),
            ))),
      ]),
    );
  }

  Widget _buildGuessOption(Tank tank) {
    return Container(
      child: Card(
          margin: EdgeInsets.all(5),
          color: hasGuessed
              ? theme.colorScheme.secondary
              : theme.colorScheme.primary,
          child: InkWell(
            //TODO: Maybe not necessary wiht inkwell - use gesture detector
            splashColor: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.0),
            onTap: () {
              _onGuessSelected(tank);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(tank.imagePath),
                  ),
                  SizedBox(height: 10),
                  if (hasGuessed)
                    Text(
                      tank.name,
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                    )
                ],
              )),
            ),
            // My design code here
          )),
    );
  }

  _onGuessSelected(Tank tank) {
    if (tank == correctTank) {
      print("Correct!");
    } else {
      print("Incorrect!");
    }
    setState(() {
      hasGuessed = true;
    });
  }
}
