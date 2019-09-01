import 'package:code_it/pages/home.dart';
import 'package:flutter/material.dart';

bool darkTheme = false;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code IT',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
