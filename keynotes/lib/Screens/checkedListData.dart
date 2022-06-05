import 'package:flutter/material.dart';
import 'package:keynotes/Types/todolist.dart';

class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  int i = 0;
  int length = 0;
  TextEditingController text = TextEditingController();
  IconData _icon = Icons.check_box_outline_blank_outlined;
  List<TODOType> _list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ToDo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: () {
            setState(() {
              length += 1;
            });
          },
        ),
        body: Column(
          children: [
            _todo(_list),
            Container(
              child: ListView.builder(
                  itemCount: length,
                  itemBuilder: (context, index) {
                    return _todo(_list);
                  }),
            ),
          ],
        ));
  }

  Widget _todo(List<TODOType> todo) {
    return Card(
      child: Row(
        children: [
          IconButton(
              icon: Icon(_icon),
              onPressed: () {
                // setState(() {
                //   if (todo[index].isChecked == false) {
                //     todo[index].isChecked = true;
                //     _icon = Icons.check_box;
                //   } else {
                //     todo[index].isChecked = false;
                //     _icon = Icons.check_box_outline_blank;
                //   }
                // });
              }),
          Container(
            child: TextField(
              // decoration: InputDecoration(hintText: 'discription'),
              controller: text,
            ),
          ),
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
// ListTile(
//       title:
//       subtitle: FlatButton(
//         child: Text('+'),
//         onPressed: () {
//           setState(() {
//             todo[index].discription = text.text;

//             length += 1;
//           });
//         },
//       ),
//       leading:
//       trailing:
//     );
