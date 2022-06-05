import 'package:flutter/material.dart';
import 'package:keynotes/Screens/checkedListData.dart';
import 'package:keynotes/Screens/remainderScreen.dart';
import 'notes_list.dart';
import 'edit_notes.dart';
import 'dbhelper.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(
    // theme: ThemeData(brightness: Brightness.dark),
    // themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Loading(),
      '/edit': (context) => EditNotes(),
      '/remainder': (context) => Remainder(),
    },
  ));
}

class Home extends StatefulWidget {
  final List<NotesList> notesList;
  Home({this.notesList});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool trigger = false;
  List<int> selectedNotes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          actions: [_popUpMenuOption()],
          title: Text(
            'KeyNotes',
            style: TextStyle(fontFamily: 'Roboto'),
          ),
          centerTitle: true,
        ),
        //TODO
        bottomNavigationBar: BottomAppBar(
          notchMargin: 4.0,
          shape: CircularNotchedRectangle(),
          color: Colors.blue[800],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
            child: Row(children: [
              IconButton(
                icon: Icon(
                  Icons.check_box_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => TODO()));
                },
              ),
              IconButton(
                  icon: (Icon(Icons.add_alert_outlined, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Remainder()));
                  }),
              IconButton(
                  icon: (Icon(
                    Icons.mic,
                    color: Colors.white,
                  )),
                  onPressed: null)
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          hoverColor: Colors.blue[800],
          onPressed: () async {
            try {
              dynamic result = await Navigator.pushNamed(context, '/edit',
                  arguments: {'id': 'new'});
              if (result['title'] != '' || result['note'] != '') {
                setState(() {
                  widget.notesList.add(NotesList(
                    title: result['title'],
                    note: result['note'],
                    color: result['color'],
                    appBarColor: result['appBarColor'],
                    textFamily: result['textFamily'],
                  ));
                });
              }
            } catch (e) {}
          },
          child: Icon(Icons.add),
          tooltip: 'New Note',
        ),
        body: widget.notesList.isEmpty
            ? Center(
                child: Text(
                  '+ Add a note',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: widget.notesList.length,
                itemBuilder: (context, index) {
                  String subnotes = widget.notesList[index].note;
                  return Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0),
                    child: Card(
                      color: Color(int.parse(widget.notesList[index].color)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                        child: ListTile(
                          onTap: () async {
                            dynamic returnValue = await Navigator.pushNamed(
                                context, '/edit',
                                arguments: {
                                  'title': widget.notesList[index].title,
                                  'note': widget.notesList[index].note,
                                  'id': 'old',
                                  'color': widget.notesList[index].color,
                                  'appBarColor':
                                      widget.notesList[index].appBarColor,
                                  'textFamily':
                                      widget.notesList[index].textFamily,
                                  'noteID': widget.notesList[index].noteID,
                                });
                            if (returnValue['title'] != ' ' &&
                                returnValue['note'] != ' ') {
                              setState(() {
                                DBHelper.instance.update(returnValue,
                                    widget.notesList[index].noteID);

                                widget.notesList[index].title =
                                    returnValue['title'];
                                widget.notesList[index].note =
                                    returnValue['note'];
                                widget.notesList[index].color =
                                    returnValue['color'];
                                widget.notesList[index].appBarColor =
                                    returnValue['appBarColor'];
                                widget.notesList[index].textFamily =
                                    returnValue['textFamily'];
                              });
                            }
                          },
                          title: Text(
                            widget.notesList[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: widget.notesList[index].textFamily,
                            ),
                          ),
                          // TODO
                          // onLongPress: () {
                          //   setState(() {
                          //     trigger = true;
                          //     selectedNotes.add(index);
                          //     print(selectedNotes);
                          //   });
                          // },
                          // leading: _setLeadingProperty(),
                          subtitle: Text(
                            subnotes,
                            style: TextStyle(
                                fontFamily: widget.notesList[index].textFamily),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              _showDialogBox(
                                  DBHelper.instance
                                      .delete(widget.notesList[index].noteID),
                                  '!',
                                  'single',
                                  index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }

  Widget _popUpMenuOption() {
    return PopupMenuButton(itemBuilder: (context) {
      return <PopupMenuEntry>[
        PopupMenuItem(
          child: FlatButton(
            child: Text('Delete All           '),
            onPressed: () {
              Navigator.pop(context);
              _showDialogBox(DBHelper.instance.deleteAll(), ' All', 'all', 0);
            },
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: FlatButton(
            child: Text('About                '),
            onPressed: () {
              Navigator.pop(context);
              _showAboutDialog();
            },
          ),
          value: 1,
        ),
      ];
    });
  }

  // TODO
  // Icon _setLeadingProperty() {
  //   print(trigger);
  //   return trigger == true ? Icon(Icons.check_box) : null;
  // }

  _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'KeyNotes',
      applicationVersion: '1.0',
      applicationLegalese: 'Developed by Softsanc.',
    );
  }

  // ignore: non_constant_identifier_names
  _showDialogBox(DBHelper, String str, String key, int index) {
    showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('Delete$str'),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do you want to Delete$str'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: () async {
                          await DBHelper;
                          setState(() {
                            key == 'all'
                                ? widget.notesList.clear()
                                : widget.notesList.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Yes')),
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No'))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
