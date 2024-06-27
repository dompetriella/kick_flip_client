import 'package:flutter/material.dart';

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({super.key});

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
