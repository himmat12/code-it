// import 'package:code_it/components.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(
                      'https://codeit.com.np/wp-content/uploads/2019/05/codeIT-logo.png',
                    ),
                  ),
                  accountName: Text('CODE IT'),
                  accountEmail: Text('Dharan'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 190.0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                _drawerKey.currentState.openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
            title: Text('CODE IT'),
            centerTitle: true,
            backgroundColor: Colors.deepOrange,
            elevation: 20.0,
            flexibleSpace: Carousel(
              boxFit: BoxFit.cover,
              showIndicator: false,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(seconds: 1),
              images: [
                NetworkImage(
                  'https://scontent.fktm6-1.fna.fbcdn.net/v/t1.0-9/31416783_1803676396321645_8038166643955264815_n.jpg?_nc_cat=102&_nc_oc=AQn-B65waynDGEROgt-GyAfbz30k8DG_FnvLJSp44E6kj3v0sglwtHrEjJRVzcFu140&_nc_ht=scontent.fktm6-1.fna&oh=2e7a2c9fac02925350d37c87c5aff2cb&oe=5DCD6FD0',
                ),
                NetworkImage(
                  'https://scontent.fktm6-1.fna.fbcdn.net/v/t1.0-9/34316217_1840492462640038_8915662686935580672_n.jpg?_nc_cat=110&_nc_oc=AQlb2iTcUeM73qZTCwyhYe_hZ9c3204y_dtj_TT9Qy-JZOw85d5On9Q6ni4S_igjj7w&_nc_ht=scontent.fktm6-1.fna&oh=5f06971a342d5cb863416f56e9bd1734&oe=5DD67915',
                ),
                NetworkImage(
                  'https://scontent.fktm6-1.fna.fbcdn.net/v/t1.0-9/32350042_1820405961315355_4923209333665169408_n.jpg?_nc_cat=100&_nc_oc=AQlyrCO1MKY-TD84c724NNov9a5hZPbk52_t7kX3Ryex5O8dEheCAzHrmus_kBAOKWs&_nc_ht=scontent.fktm6-1.fna&oh=1617fc09de6d2a4c729fc92cb9e20626&oe=5DD1CD94',
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              StreamBuilder(
                stream: Firestore.instance.collection('things').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document =
                            snapshot.data.documents[index];
                        return Container(
                          height: 200.0,
                          child: Text(document['title']),
                        );
                      },
                    );
                  }
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
