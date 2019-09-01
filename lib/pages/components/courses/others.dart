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

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('others').snapshots(),
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
                          case 'Computer Basic Training':
                            _launchURL(
                                'https://codeit.com.np/computer-basics-training/');
                            break;

                          case 'Ethical Hacking':
                            _launchURL(
                                'https://codeit.com.np/ethical-hacking/');
                            break;

                          case 'MSSQL Training':
                            _launchURL('https://codeit.com.np/mssql-training/');
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
