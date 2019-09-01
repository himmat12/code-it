import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

_linkWeb(String link) async {
  String url = link;
}

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/widget': (_) => new WebviewScaffold(
              url: _linkWeb(
                  'https://pub.dev/packages/flutter_webview_plugin#-readme-tab-'),
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Container(
                color: Colors.redAccent,
                child: const Center(
                  child: Text('Waiting.....'),
                ),
              ),
            ),
      },
    );
  }
}
