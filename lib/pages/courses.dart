import 'package:code_it/main.dart';
import 'package:code_it/pages/components/courses/cms.dart';
import 'package:code_it/pages/components/courses/corporate.dart';
import 'package:code_it/pages/components/courses/others.dart';
import 'package:code_it/pages/components/courses/programming.dart';
import 'package:flutter/material.dart';

import 'components/courses/designing.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme
          ? ThemeData.dark()
          : ThemeData(primarySwatch: Colors.purple),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            elevation: 12.0,
            title: Text('Cources'),
            bottom: TabBar(isScrollable: true, tabs: [
              Tab(
                text: 'Programming',
              ),
              Tab(
                text: 'Designing',
              ),
              Tab(
                text: 'CMS',
              ),
              Tab(
                text: 'Corporate',
              ),
              Tab(
                text: 'Other',
              ),
            ]),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Tab(
                child: Container(
                  child: ProgrammingPage(),
                ),
              ),
              Tab(
                child: Container(
                  child: DesigningPage(),
                ),
              ),
              Tab(
                child: Container(
                  child: CmsPage(),
                ),
              ),
              Tab(
                child: Container(
                  child: CorporatePage(),
                ),
              ),
              Tab(
                child: Container(
                  child: OtherPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
