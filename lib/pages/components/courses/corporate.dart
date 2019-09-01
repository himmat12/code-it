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

class CorporatePage extends StatefulWidget {
  @override
  _CorporatePageState createState() => _CorporatePageState();
}

class _CorporatePageState extends State<CorporatePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('corporate').snapshots(),
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
                          case 'Advance Excel':
                            _launchURL('https://codeit.com.np/advanced-excel/');
                            break;

                          case 'IT Corporate Training':
                            _launchURL(
                                'https://codeit.com.np/corporate-training/');
                            break;

                          case 'IT Support Officer Training':
                            _launchURL(
                                'https://codeit.com.np/it-support-officer/');
                            break;

                          case 'MS Access Training':
                            _launchURL(
                                'https://codeit.com.np/ms-access-training/');
                            break;

                          case 'Microsoft Word Office Training':
                            _launchURL(
                                'https://codeit.com.np/microsoft-office-training/');
                            break;

                          case 'Tally ERP 9':
                            _launchURL('https://codeit.com.np/tally-erp-9/');
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
