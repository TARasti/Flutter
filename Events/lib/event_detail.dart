import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Event Detail")),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 1,
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: NetworkImage(
                            "https://www.ianbakerphotography.com/wp-content/uploads/2017/02/DSC7877.jpg"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * .24,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                "Event Detail",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * .26,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Align(
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      child: const Text('Join Chat',
                          style: TextStyle(fontSize: 20)),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 5,
                    ),
                  ),
                ),
//            SizedBox(height: 1.0),
                Align(
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      child: const Text('Get Direction',
                          style: TextStyle(fontSize: 20)),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
