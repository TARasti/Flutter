import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
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
                      Text(
                        'Alaina',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Date'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Image.network(
                'https://www.ianbakerphotography.com/wp-content/uploads/2017/02/DSC7877.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Event Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Date From - To'),
                  Text('Location'),
                  Row(
                    children: [
                      Text('0 Interested'),
                      SizedBox(
                        width: 20,
                      ),
                      Text('0 Going'),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.messenger_sharp),
                  onPressed: () {},
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Interested'),
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
