import 'package:flutter/material.dart';

class Remainder extends StatefulWidget {
  @override
  _RemainderState createState() => _RemainderState();
}

class _RemainderState extends State<Remainder> {
  DateTime _date;
  TimeOfDay _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remainder Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'title'),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_date != null) Text('$_date'),
                if (_time != null) Text('$_time'),
                RaisedButton(
                    child: Text('Pick Date'),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1947),
                              lastDate: DateTime(2099))
                          .then((value) => setState(() {
                                _date = value;
                              }));
                      print(_date);
                    }),
                RaisedButton(
                    child: Text('Pick Time'),
                    onPressed: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) => setState(() {
                                _time = value;
                              }));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
