import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../guess/guess_view.dart';
import '../../settings/settings_view.dart';
import '../shared/background_container.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  final String assetPath = 'assets/images/tank.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: AppBackgroundContainer(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              _buildSvg(context),
              _buildTitle(context),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.restorablePushNamed(context, GuessWidget.routeName);
                },
                child: Text("Start Game"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.restorablePushNamed(
                      context, SettingsView.routeName);
                },
                child: Text("Exit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSvg(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: 150,
      height: 150,
      colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    return Text("Guess the Tank", style: textStyle);
  }
}
