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

class DesigningPage extends StatefulWidget {
  @override
  _DesigningPageState createState() => _DesigningPageState();
}

class _DesigningPageState extends State<DesigningPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('designing').snapshots(),
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
                          case 'Graphics Designing':
                            _launchURL(
                                'https://codeit.com.np/graphic-designing/');
                            break;

                          case 'Illustrator':
                            _launchURL('https://codeit.com.np/illustrator/');
                            break;

                          case 'In Design':
                            _launchURL('https://codeit.com.np/in-design/');
                            break;

                          case 'Photoshop':
                            _launchURL('https://codeit.com.np/photoshop/');
                            break;

                          case 'Web Designing Training':
                            _launchURL('https://codeit.com.np/web-designing/');
                            break;

                          case 'XHTML  / Css':
                            _launchURL('https://codeit.com.np/xhtml-css3/');
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
