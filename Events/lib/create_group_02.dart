import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:softsanc_events_screens/groups.dart';

class CreateGroup02 extends StatefulWidget {
  @override
  _CreateGroup02State createState() => _CreateGroup02State();
}

class _CreateGroup02State extends State<CreateGroup02> {
  File _image;
  Future pickImageFromCamera() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      try {
        _image = File(image.path);
      } catch (e) {
        print(e);
      }
    });
  }

  Future pickImageFromGallery() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      try {
        _image = File(image.path);
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Groups()));
            },
            child: Text('Cancel'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: (context),
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pickImageFromCamera();
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  title: Text('Camera'),
                                  leading: Icon(Icons.camera),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pickImageFromGallery();
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  title: Text('Gallery'),
                                  leading: Icon(Icons.image),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _image = null;
                                    Navigator.pop(context);
                                  });
                                },
                                child: ListTile(
                                  title: Text('Remove Picture'),
                                  leading: Icon(Icons.remove),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                  // pickimage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: _image == null
                        ? Text('+ Upload Photo')
                        : Image.file(_image),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: FlatButton(
                child: Text('Create Group'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Groups()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
