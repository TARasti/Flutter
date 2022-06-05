import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softsanc_events_screens/pick_location.dart';

class NewEvent extends StatefulWidget {
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  String _startDate = ' ', _startTime = ' ', _endDate = ' ', _endTime = ' ';

  String d = ' ', t = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Event Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Alaina',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Event Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            _displayDateTime("Start Date and Time", 1),
            _displayDateTime("End Date and Time", 2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: 'Discription',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Center(
              child: Column(
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text('Share With'),
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                        child: Text('Next'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PickLocation()));
                        },
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dateTimePicker(int flag) {
    return Column(
      children: [
        FlatButton(
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1947),
                    lastDate: DateTime(2099))
                .then((value) => setState(() {
                      d = DateFormat('yyyy-MM-dd').format(value);
                      if (d == null || d == ' ') {
                        d = "Pick Date";
                        print(d);
                      }
                    }));
          },
          child: Container(child: Text('Pic Date')),
        ),
        FlatButton(
            child: Text('Pick Time'),
            onPressed: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value) => setState(() {
                        t = value.toString();
                      }));
            }),
        RaisedButton(
          onPressed: () {
            setState(() {
              if (flag == 1) {
                _startDate = d;
                _startTime = t;
              } else if (flag == 2) {
                _endDate = d;
                _endTime = t;
              }
            });
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        )
      ],
    );
  }

  Widget _displayDateTime(String toShow, int flag) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return _dateTimePicker(flag);
              });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toShow,
                  style: TextStyle(fontSize: 12),
                ),
                if (flag == 1)
                  Text('Date: $_startDate Time: $_startTime')
                else if (flag == 2)
                  Text('Date: $_endDate Time: $_endTime')
              ],
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
