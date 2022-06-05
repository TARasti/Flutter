import 'package:flutter/material.dart';
import 'package:softsanc_events_screens/create_group.dart';
import 'package:softsanc_events_screens/utils/mycard.dart';

class Groups extends StatefulWidget {
  const Groups({Key key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
        actions: [
          IconButton(
              icon: Icon(Icons.add_box_rounded),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateGroup()));
              }),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text('Your Groups'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Discover'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Invites'),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all()),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1551972251-12070d63502a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=667&q=80'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Group Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Date')
                              ],
                            ),
                          ),
                        ],
                      ),
                      MyCard(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
