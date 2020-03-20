import 'package:flutter/material.dart';
import 'package:fluttergraphs/presentation/home_screen.dart';

void main() => runApp(GraphsApp());

class GraphsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
