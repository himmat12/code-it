import 'package:code_it/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code IT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}

class TT extends StatelessWidget {
  final String text;
  final String tooltip;
  TT(this.text, this.tooltip);
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: Text(tooltip),
      showDuration: Duration(seconds: 1),
    );
  }
}
