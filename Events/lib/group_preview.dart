import 'package:flutter/material.dart';

class GroupPreview extends StatefulWidget {
  const GroupPreview({Key key}) : super(key: key);

  @override
  _GroupPreviewState createState() => _GroupPreviewState();
}

class _GroupPreviewState extends State<GroupPreview> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.network(
                  'https://images.unsplash.com/photo-1551972251-12070d63502a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=667&q=80'),
            ),
            Text(
              'Group Name',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Container(
              height: height * 0.1,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Discription'),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
            ),
            Container(
              width: width,
              color: Colors.lightBlue,
              child: FlatButton(
                child: Text('Show Members'),
                onPressed: () {},
              ),
            ),
            Container(
              width: width,
              color: Colors.lightBlue,
              child: FlatButton(
                child: Text('Create Event'),
                onPressed: () {},
              ),
            ),
            Container(
              width: width,
              color: Colors.lightBlue,
              child: FlatButton(
                child: Text('Group Events'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
