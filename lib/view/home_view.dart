import 'package:calculator/view/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFE5A836),
      body:  SafeArea(
          child:  CalculatorView(),
        ),
    );
  }
}
