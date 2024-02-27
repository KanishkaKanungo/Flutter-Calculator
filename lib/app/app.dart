//import 'package:calculator/view/calculator_view.dart';
import 'package:calculator/view/home_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      //  // primarySwatch: Colors.deepOrange,
      ),
      home: const HomeView(),
    );
  }
}
