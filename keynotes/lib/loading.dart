import 'package:flutter/material.dart';
import 'package:keynotes/main.dart';
import 'notes_list.dart';
import 'dbhelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<NotesList> notesList = [];
  void setList() async {
    notesList = await DBHelper.instance.getAllData();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home(
                  notesList: notesList,
                )));
  }

  @override
  void initState() {
    super.initState();
    setList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'KeyNotes',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontFamily: 'IndieFlower',
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpinKitThreeBounce(
                color: Colors.black,
                size: 20.0,
              ),
            ],
          ),
        ));
  }
}
