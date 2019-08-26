import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class PopularCourse extends StatefulWidget {
  @override
  _PopularCourseState createState() => _PopularCourseState();
}

class _PopularCourseState extends State<PopularCourse> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('popularcourse').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Text('Please wait while loading');
        }else{
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot pc = snapshot.data.documents[index];
              return Container(
                width: 120.0,
                child: Card(
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        height: 80.0,
                        child: Image.network(pc['image'],fit: BoxFit.cover,),
                      ),
                      ListTile(
                        title: Text(pc['title']),
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