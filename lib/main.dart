import 'package:flutter/material.dart';
import 'package:my_perfect_weight/pages/BMICal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MY PERFECT WEIGHT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICal(),
    );
  }
}

