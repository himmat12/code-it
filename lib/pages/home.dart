import 'package:code_it/pages/class-starting-soon.dart';
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('Home'),
            )
          ],
        ),
      ),
      body: ListView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        children: <Widget>[
          // Slides Widgets
          InfoSlide(),

          //Popular Course List

          Card(
            elevation: 12.0,
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 5.0,
                  color: Colors.white70,
                                  child: ListTile(
                    leading: Icon(
                      Icons.library_books,
                      color: Colors.blue,
                    ),
                    title: Text('Popular Courses'),
                  ),
                ),
                Container(
                  height: 200.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: PopularCourse(),
                  ),
                ),
              ],
            ),
          ),

          Card(
            child: Column(
              children: <Widget>[
                Material(
                  elevation: 5.0,
                  color: Colors.white70,
                  child: ListTile(
                    leading: Icon(
                      Icons.alarm,
                      color: Colors.purple,
                    ),
                    title: Text(
                      'Upcoming Class',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: Text('Enroll Now'),
                  ),
                ),
                Container(
                  height: 200.0,
                  child: ClassStartingSoon(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
