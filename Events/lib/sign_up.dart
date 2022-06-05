import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key key}) : super(key: key);

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'http://www.userlogos.org/files/backgrounds/efidol/bkgd.jpg'),
                    fit: BoxFit.fitHeight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: Text(
                    'Events',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey[200],
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomTextField(
                        text: 'Username',
                      ),
                      CustomTextField(
                        text: 'Email',
                      ),
                      CustomTextField(
                        text: 'Password',
                      ),
                      CustomTextField(
                        text: 'Confirm Password',
                      ),
                      CustomTextField(
                        text: 'Birthday',
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Text('SIGNUP'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String text;
  CustomTextField({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          hintText: text,
        ),
      ),
    );
  }
}
