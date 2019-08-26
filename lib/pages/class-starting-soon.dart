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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 180.0,
                        child: Image.network(css['image'],fit: BoxFit.cover,),
                      ),
                      ListTile(
                        title: Text(css['title'],style: TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: Text("Starting on: " + css['date']),
                        trailing: RaisedButton(
                          color: Colors.deepOrange,
                          textColor: Colors.white,
                          onPressed: (){},
                          child: Text('Enroll Now'),
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
