import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dbhelper.dart';

class EditNotes extends StatefulWidget {
  @override
  _EditNotesState createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  bool isNotSaved = true;
  TextEditingController myTitle = TextEditingController();
  TextEditingController myNote = TextEditingController();
  String title;
  String note;
  Map data = {};
  String bgColor = '0xffFFFFFF';
  String appBarColor = '0xff1565C0';
  String pbgColor;
  String pappBarColor;
  String defaultFamily = 'Roboto';
  String pFamily;
  int count = 0;
  int familyCount = 0;
  bool shouldPop = true;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    _getPreviousData();

    return WillPopScope(
      onWillPop: () async {
        _returnData();
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: Color(int.parse(bgColor)),
        /////////////////
        // AppBar Starts
        /////////////////
        appBar: AppBar(
          backgroundColor: Color(int.parse(appBarColor)),
          title: Text('KeyNotes'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _returnData();
            },
          ),
          actions: <Widget>[
            Builder(
              builder: (context) => FlatButton(
                splashColor: Colors.blue[900],
                onPressed: () {
                  _savingData();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Center(
                      child: Text('Saving...'),
                      heightFactor: 1,
                    ),
                    duration: Duration(seconds: 2),
                  ));
                  isNotSaved = false;
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        /////////////////
        // AppBar End
        /////////////////
        //////////////////
        /// BottomAppBar Start
        /// //////////////
        bottomNavigationBar: BottomAppBar(
          color: Color(int.parse(bgColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.text_fields_outlined),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return _textStyle();
                        });
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                child: Text('${DateFormat.jm().format(DateTime.now())}'),
              ),
              IconButton(
                  icon: Icon(Icons.color_lens),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return _colors();
                        });
                  })
            ],
          ),
        ),
        //////////////////////////
        ///BottomAppBar End
        /////////////////////////
        /// body Start
        /// //////////////////
        body: ListView(
          children: [
            Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 8.0, 0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: defaultFamily,
                  ),
                  controller: myTitle,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      )),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 220,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                child: TextField(
                  style: TextStyle(
                    fontFamily: defaultFamily,
                  ),
                  controller: myNote,
                  keyboardType: TextInputType.multiline,
                  // minLines: 10,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Notes',
                  ),
                ),
              ),
            ),
          ],
        ),
        //////////////////////
        /// body End
        /// //////////////////
      ),
    );
  }

  //////////////////////
  /// TextStyle/Family Widget
  /// /////////////////////
  Widget _textStyle() {
    return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: EdgeInsets.fromLTRB(6.0, 16.0, 6.0, 16.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _myTextButton(textStyle: 'Roboto'),
                _myTextButton(textStyle: 'IndieFlower'),
                _myTextButton(textStyle: 'PatrickHand'),
                _myTextButton(textStyle: 'Kurale'),
                _myTextButton(textStyle: 'SpartanMB'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///////////////////////
  /// Colors Widget
  /// //////////////////
  Widget _colors() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _myColorButton(
                    backgroundColor: '0xffFFFFFF', appbarColor: '0xff1565C0'),
                SizedBox(
                  width: 10.0,
                ),
                _myColorButton(
                    backgroundColor: '0xff90CAF9', appbarColor: '0xff1565C0'),
                SizedBox(
                  width: 10.0,
                ),
                _myColorButton(
                    backgroundColor: '0xff18FFFF', appbarColor: '0xff00838F'),
                SizedBox(
                  width: 10.0,
                ),
                _myColorButton(
                    backgroundColor: '0xffFFEB3B', appbarColor: '0xffFDD835'),
                SizedBox(
                  width: 10.0,
                ),
                _myColorButton(
                    backgroundColor: '0xff81C784', appbarColor: '0xff2E7D32'),
                SizedBox(
                  width: 10.0,
                ),
                _myColorButton(
                    backgroundColor: '0xffbe9c91', appbarColor: '0xff8d6e63'),
                SizedBox(
                  width: 10.0,
                ),
                _myColorButton(
                    backgroundColor: '0xffff6659', appbarColor: '0xffd32f2f'),
                SizedBox(
                  width: 10.0,
                ),
                _myColorButton(
                    backgroundColor: '0xff819ca9', appbarColor: '0xff546e7a'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _savingData() {
    title = myTitle.text;
    note = myNote.text;
    bgColor = bgColor;
    appBarColor = appBarColor;
    defaultFamily = defaultFamily;
    Map<String, dynamic> dataForSave = {
      'title': title,
      'note': note,
      'color': bgColor,
      'appBarColor': appBarColor,
      'textFamily': defaultFamily,
    };
    if (title != '' || note != '') {
      if (isNotSaved && data['id'] != 'old') {
        DBHelper.instance.insertData(dataForSave);
      } else {
        DBHelper.instance.update(dataForSave, data['noteID']);
      }
    }
  }

  _returnData() {
    _savingData();
    if ((note != ' ' || title != ' ') ||
        (note.isNotEmpty || title.isNotEmpty)) {
      Navigator.pop(context, {
        'title': title,
        'note': note,
        'color': bgColor,
        'appBarColor': appBarColor,
        'textFamily': defaultFamily,
      });
    } else {
      Navigator.pop(context, {
        'title': ' ',
        'note': ' ',
        'color': bgColor,
      });
    }
  }

  _getPreviousData() {
    if (data['id'] == 'old' && (count < 1 && familyCount < 1)) {
      myTitle.text = data['title'];
      myNote.text = data['note'];
      pbgColor = data['color'];
      pappBarColor = data['appBarColor'];
      pFamily = data['textFamily'];
      count = count + 1;
      familyCount += 1;
      bgColor = pbgColor;
      appBarColor = pappBarColor;
      defaultFamily = pFamily;
    }
  }

  Widget _myTextButton({String textStyle}) {
    return ButtonTheme(
      minWidth: 50,
      child: FlatButton(
          onPressed: () {
            familyCount += 1;
            setState(() {
              defaultFamily = textStyle;
              count = 1;
            });
          },
          child: Text(
            'TextStyle',
            style: TextStyle(fontFamily: textStyle),
          )),
    );
  }

  Widget _myColorButton({String backgroundColor, String appbarColor}) {
    return ButtonTheme(
      minWidth: 50,
      height: 30,
      child: RaisedButton(
        shape: StadiumBorder(),
        onPressed: () {
          count += 1;
          familyCount = 1;
          setState(() {
            bgColor = backgroundColor;
            appBarColor = appbarColor;
          });
        },
        child: null,
        color: Color(int.parse(backgroundColor)),
      ),
    );
  }
}
