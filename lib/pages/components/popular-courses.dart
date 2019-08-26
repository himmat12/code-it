import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';


class PopularCourse extends StatefulWidget {
  @override
  _PopularCourseState createState() => _PopularCourseState();
}

class _PopularCourseState extends State<PopularCourse> {
  _launchURL(String websiteLink) async {
  String url = websiteLink;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('popularcourse').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Please wait while loading');
        } else {
          return ListView.builder(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot pc = snapshot.data.documents[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 180.0,
                  height: 180.0,
                  child: InkWell(
                    onTap: (){
                      var course = pc['title'].toString();
                      switch(course){
                        case "JAVA" :
                        _launchURL('https://codeit.com.np/java/');
                          //Open Java Link
                          break;
                        case "PHP":
                          //Open Flutter Link
                          _launchURL('https://codeit.com.np/php-training/');
                          break;
                         
                      }
                    },
                  
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 140.0,
                            child: Image.network(
                              pc['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              pc['title'],
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
