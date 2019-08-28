import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RecentEvents extends StatefulWidget {
  @override
  _RecentEventsState createState() => _RecentEventsState();
}

class _RecentEventsState extends State<RecentEvents> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('recentevents').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Text('Please wait while loading...');
        }else{
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot revents = snapshot.data.documents[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Image.network(revents['image'],fit: BoxFit.cover,),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(revents['title']),
                      subtitle: Text(revents['location']),
                    )
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