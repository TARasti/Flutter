import 'package:flutter/material.dart';

class DiscoverGroups extends StatefulWidget {
  @override
  _DiscoverGroupsState createState() => _DiscoverGroupsState();
}

class _DiscoverGroupsState extends State<DiscoverGroups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          for (int i = 0; i < 5; i++) _myContainer(),
        ],
      ),
    );
  }

  Widget _myContainer() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(border: Border.all()),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1551972251-12070d63502a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=667&q=80'),
                  radius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Name'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Join'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
