import 'package:code_it/pages/components/info-slide.dart';
import 'package:code_it/pages/components/popular-courses.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            // Slides Widgets
            InfoSlide(),

          //Popular Course List
          ListTile(
            leading: Icon(Icons.library_books,color: Colors.blue,),
            title: Text('Popular Courses'),
          ),
          Container(
            height: 120.0,
            child: PopularCourse(),
            )

          ],
        ),
      ),
    );
  }
}