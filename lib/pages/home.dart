import 'package:code_it/pages/class-starting-soon.dart';
import 'package:code_it/pages/components/info-slide.dart';
import 'package:code_it/pages/components/popular-courses.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('CODE IT'),
                accountEmail: Text('info@codeit.com.np'),
                currentAccountPicture: CircleAvatar(
                  
                  child: Container(
                    child: Image.network('https://codeit.com.np/wp-content/uploads/2019/05/codeIT-logo.png'),
                  ),
                  backgroundColor: Colors.white
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.deepOrange,
                ),
                title: Text('Home'),
              ),
               ListTile(
                leading: Icon(
                  Icons.library_books,
                  color: Colors.deepOrange,
                ),
                title: Text('Courses'),
              ),
               ListTile(
                leading: Icon(
                  Icons.notifications_active,
                  color: Colors.deepOrange,
                ),
                title: Text('Notice'),
              ),
               ListTile(
                leading: Icon(
                  Icons.group,
                  color: Colors.deepOrange,
                ),
                title: Text('Our Crew'),
              ),
              Divider(),
               ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.green,
                ),
                title: Text('About us'),
              ),
               ListTile(
                leading: Icon(
                  Icons.contacts,
                  color: Colors.green,
                ),
                title: Text('Contact us'),
              ),
              Divider(),
               ListTile(
                leading: Icon(
                  Icons.share,
                  color: Colors.blueAccent,
                ),
                title: Text('Facebook'),
              ),
              Divider(),
               ListTile(
                leading: Icon(
                  Icons.brightness_2,
                  color: Colors.black87,
                ),
                title: Text('Night Mode'),
                trailing: Switch(
                  value: false,
                  onChanged: (bool value){
                    value = value;
                  },
                ),
              ),
               ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
                title: Text('Exit'),
              )
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: InfoSlide(),
                title: Text('CODE IT'),
                centerTitle: true,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Slides Widgets

                  //Popular Course List
                  ListTile(
                    title: Text(
                      'Popular Courses',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Choosen by our students',style: TextStyle(),),
                  ),

                  Container(
                    height: 180.0,
                    child: PopularCourse(),
                  ),

                  ListTile(
                    title: Text(
                      'Upcoming Class',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Interest student can apply it'),
                  ),
                  Container(
                    height: 250.0,
                    child: ClassStartingSoon(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
