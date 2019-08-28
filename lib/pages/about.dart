import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('About us'),
        ),
        body: ListView(
          children: <Widget>[
            Image.network('src')
          ],
        ),
      ),
    );
  }
}
