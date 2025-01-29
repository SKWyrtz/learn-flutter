import 'package:flutter/material.dart';
import '../shared/background_container.dart';

class GuessWidget extends StatefulWidget {
  const GuessWidget({super.key});
  static const routeName = '/guess';

  @override
  State<GuessWidget> createState() => _GuessWidgetState();
}

class _GuessWidgetState extends State<GuessWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess the Tank'),
        // automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        Expanded(
          child: AppBackgroundContainer(
            child: GridView.count(
                // padding: EdgeInsets.all(20),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  Card(child: Text("Swag1")),
                  Card(child: Text("Swag2")),
                  Card(child: Text("Swag3")),
                  Card(child: Text("Swag4")),
                ]),
          ),
        ),
        Expanded(
            child: Container(
          child: Text("BOB"),
        ))
      ]),
    );
  }
}
