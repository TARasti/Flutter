import 'package:flutter/material.dart';
import 'package:softsanc_events_screens/create_group_02.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Group Name',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        readOnly: true,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return _setPrivacy();
                              });
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          hintText: 'Privacy',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Discription',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.3,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Container(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateGroup02()));
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text('Next')),
                        color: Colors.blue,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _setPrivacy() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.close), onPressed: () {}),
                Text(
                  'Choose Privacy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                FlatButton(onPressed: () {}, child: Text('Done')),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                'Private',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'Only members can see who\'s in the group and what they post.'),
              leading: Radio(
                value: 'Private',
                onChanged: null,
                groupValue: 'privacy',
              ),
            ),
            ListTile(
              title: Text(
                'Public',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'Anyone can see who\'s in the group and what they post.'),
              leading: Radio(
                value: 'Public',
                onChanged: null,
                groupValue: 'privacy',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
