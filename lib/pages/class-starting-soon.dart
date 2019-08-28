import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassStartingSoon extends StatefulWidget {
  @override
  _ClassStartingSoonState createState() => _ClassStartingSoonState();
}

class _ClassStartingSoonState extends State<ClassStartingSoon> {
  launchCaller() async {
    const url = "tel:+97725525163";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
}
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('classstartingsoon').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('please wait while loading');
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot css = snapshot.data.documents[index];
              return Card(
                elevation: 3.0,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180.0,
                        child: Image.network(css['image'],fit: BoxFit.cover,),
                      ),
                      ListTile(
                        title: Text(css['title'],style: TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: Text("Starting on: " + css['date']),
                        trailing: RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: (){
                            launchCaller();
                          },
                          child: Text('Call Now'),
                        ),
                      )
                    ],
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
