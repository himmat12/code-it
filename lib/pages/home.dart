import 'package:code_it/pages/class-starting-soon.dart';
import 'package:code_it/pages/components/courses/courcespage/coursepage.dart';
import 'package:code_it/pages/components/info-slide.dart';
import 'package:code_it/pages/components/popular-courses.dart';
import 'package:code_it/pages/courses.dart';
import 'package:code_it/pages/recent-events.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:code_it/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  launchFacebookPage() async {
    const url = "https://facebook.com/codeit.np";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openCoursesPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Courses()));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme
          ? ThemeData.dark()
          : ThemeData(primarySwatch: Colors.deepPurple),
      child: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            // bottomNavigationBar: BottomAppBar(
            //   elevation: 12.0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: <Widget>[
            //       IconButton(
            //         icon: Icon(
            //           Icons.home,
            //           color: Colors.deepPurpleAccent,
            //         ),
            //         onPressed: () {},
            //         tooltip: 'Home',
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.event_available),
            //         color: Colors.deepPurpleAccent,
            //         onPressed: () {},
            //         tooltip: 'Upcoming Events',
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.library_books),
            //         color: Colors.deepPurpleAccent,
            //         onPressed: () {},
            //         tooltip: 'Courses',
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.map),
            //         color: Colors.deepPurpleAccent,
            //         onPressed: () {},
            //         tooltip: 'Map',
            //       )
            //     ],
            //   ),
            // ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text('CODE IT'),
                    accountEmail: Text('info@codeit.com.np'),
                    currentAccountPicture: CircleAvatar(
                        child: Container(
                          child: Image.network(
                              'https://codeit.com.np/wp-content/uploads/2019/05/codeIT-logo.png'),
                        ),
                        backgroundColor: Colors.white),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.deepPurple,
                    ),
                    title: Text('Home'),
                  ),
                  ListTile(
                    onTap: () {
                      openCoursesPage();
                    },
                    leading: Icon(
                      Icons.library_books,
                      color: Colors.purple,
                    ),
                    title: Text('Courses'),
                  ),
                  ListTile(
                    onTap: () {
                      CoursePage();
                    },
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
                    onTap: () {
                      launchFacebookPage();
                    },
                    leading: Icon(
                      Icons.thumb_up,
                      color: Colors.blueAccent,
                    ),
                    title: Text('Facebook'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.brightness_4,
                      color: Colors.black87,
                    ),
                    title: Text('Night Mode'),
                    trailing: Switch(
                      value: darkTheme,
                      onChanged: (bool nightMode) {
                        setState(() {
                          darkTheme = nightMode;
                        });
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
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Text('Home'),
                      ),
                      Tab(
                        child: Text('Courses'),
                      ),
                      Tab(
                        child: Text('News'),
                      ),
                      Tab(
                        child: Text('Location'),
                      ),
                    ],
                  ),
                  title: Text('CODE IT'),
                  elevation: 20.0,
                  centerTitle: true,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: InfoSlide(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Divider(),

                      //Popular Course List

                      ListTile(
                        title: Text(
                          'Popular Courses',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          'Choosen by our students',
                          style: TextStyle(),
                        ),
                      ),

                      Container(
                        height: 180.0,
                        child: PopularCourse(),
                      ),

                      Divider(),

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

                      Divider(),

                      //Recent Events

                      ListTile(
                        title: Text(
                          'Recent Events',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          'By Code IT',
                          style: TextStyle(),
                        ),
                      ),

                      Container(
                        height: 360.0,
                        child: RecentEvents(),
                      ),

                      Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
