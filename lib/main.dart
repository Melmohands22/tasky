import 'package:flutter/material.dart';
import 'package:tasky/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const Tasky());
}

class Tasky extends StatelessWidget {
  const Tasky({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}
