import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ClassStartingSoon extends StatefulWidget {
  @override
  _ClassStartingSoonState createState() => _ClassStartingSoonState();
}

class _ClassStartingSoonState extends State<ClassStartingSoon> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('classstartingsoon').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Text('please wait while loading');
        }else{
          return ListView.builder(
            physics: ScrollPhysics(parent:BouncingScrollPhysics()),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot css = snapshot.data.documents[index];
              return Card(
                              child: ListTile(
                  leading: Icon(Icons.library_books,color: Colors.purple,),
                  title: Text(css['title']),
                  subtitle: Text("Class Starting on: " + css['date']),
                ),
              );
            },
          );
        }
      },
    );
  }
}