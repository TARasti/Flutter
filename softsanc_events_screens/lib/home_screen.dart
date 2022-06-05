import 'package:flutter/material.dart';
import 'account.dart';
import 'package:softsanc_events_screens/utils/mycard.dart';
import 'new_event.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color defaultColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              text: 'Home',
            ),
            Tab(
              text: 'Local',
            ),
            Tab(
              text: 'Group',
            ),
          ]),
          title: Text('Event'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.portrait_rounded),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Account()));
              },
            ),
          ],
        ),
        body: MyCard(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewEvent()));
          },
          child: Text('+'),
        ),
      ),
    );
  }
}
