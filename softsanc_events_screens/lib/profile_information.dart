import 'package:flutter/material.dart';

class Profileinformation extends StatefulWidget {
  const Profileinformation({Key key}) : super(key: key);

  @override
  _ProfileinformationState createState() => _ProfileinformationState();
}

class _ProfileinformationState extends State<Profileinformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                  radius: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Alaina'),
                      Text('Islamabad'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('0'),
                      Text('Events'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('0'),
                      Text('Following'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('0'),
                      Text('Follower'),
                    ],
                  ),
                ),
              ],
            ),
            Text('Birthday: March, 16 2000'),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('ATTENDED'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('CREATED'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('SAVED'),
                ),
              ],
            ),
            Divider(
              thickness: 2,
            )
          ],
        ),
      )),
    );
  }
}
