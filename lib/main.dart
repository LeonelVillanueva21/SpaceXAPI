import 'package:flutter/material.dart';
import 'package:spacex/widget/home.dart';

void main() {
  runApp(const SpacePage());
}

class SpacePage extends StatelessWidget {
  const SpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX',
      home: SpaceHome(),
    );
  }
}