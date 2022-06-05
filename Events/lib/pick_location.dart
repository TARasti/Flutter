import 'package:flutter/material.dart';
import 'package:softsanc_events_screens/preview_event.dart';

class PickLocation extends StatefulWidget {
  PickLocation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PickLocationState createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Pick Location")),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Location',
                labelText: 'Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviewEvent()));
                    },
                    child: const Text('Next', style: TextStyle(fontSize: 20)),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
