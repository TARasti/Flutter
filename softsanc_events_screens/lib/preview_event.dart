import 'package:flutter/material.dart';
import 'package:softsanc_events_screens/home_screen.dart';

class PreviewEvent extends StatelessWidget {
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text("Preview"),
        )),
        actions: [
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: const Text('Cancel', style: TextStyle(fontSize: 18)),
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 5,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * .40,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 90.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    Text(
                      "Add Event Photo",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * .64,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                "Event Detail Card",
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
                      child: const Text('Settings',
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child:
                          const Text('Create', style: TextStyle(fontSize: 20)),
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
