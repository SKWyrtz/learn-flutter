import 'package:flutter/material.dart';

class AppBackgroundContainer extends StatelessWidget {
  final Widget? child;

  const AppBackgroundContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: child,
    );
  }
}
