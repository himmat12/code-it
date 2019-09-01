import 'package:code_it/pages/components/courses/courcespage/coursepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(String link) async {
  String url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Couldnot launch $url ';
  }
}

class ProgrammingPage extends StatefulWidget {
  @override
  _ProgrammingPageState createState() => _ProgrammingPageState();
}

class _ProgrammingPageState extends State<ProgrammingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('programming').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return (Center(
            child: CircularProgressIndicator(),
          ));
        } else {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data.documents[index];
              return Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      onTap: () {
                        var course = document['title'].toString();
                        switch (course) {
                          case 'Android app development':
                            _launchURL('https://codeit.com.np/android-mobile-apps-development/');
                            break;

                          case 'C Programming':
                            _launchURL('https://codeit.com.np/c-programming/');
                            break;

                          case 'C++ Programming':
                            _launchURL(
                                'https://codeit.com.np/c-programming-2/');
                            break;

                          case 'ASP.NET':
                            _launchURL('https://codeit.com.np/asp-net/');
                            break;

                          case 'JAVA':
                            _launchURL('https://codeit.com.np/java/');
                            break;

                          case 'JSP/Serverlet':
                            _launchURL('https://codeit.com.np/jsp-serverlet/');
                            break;

                          case 'Laravel Training':
                            _launchURL(
                                'https://codeit.com.np/laravel-training/');
                            break;

                          case 'Machine Learning Python':
                            _launchURL(
                                'https://codeit.com.np/machine-learning-python/');
                            break;

                          case 'Mean Stack Course':
                            _launchURL(
                                'https://codeit.com.np/mean-stack-course/');
                            break;

                          case 'PHP Training':
                            _launchURL('https://codeit.com.np/php-training/');
                            break;

                          case 'Python Django Framework':
                            _launchURL(
                                'https://codeit.com.np/django-framework-python/');
                            break;

                          case 'Rest API':
                            _launchURL('https://codeit.com.np/rest-api/');
                            break;

                          case 'Ruby On Rails':
                            _launchURL('https://codeit.com.np/ruby-on-rails/');
                            break;

                          case 'Spring Web MVC Framework':
                            _launchURL(
                                'https://codeit.com.np/spring-web-mvc-framework/');
                            break;
                        }
                      },
                      leading: SizedBox(
                        height: 80,
                        width: 60.0,
                        child: Container(
                          child: Image.network(
                            document['image'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text(
                        document['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      subtitle: Text('Duration : ' + document['duration']),
                    ),
                    Divider(),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
