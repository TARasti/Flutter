import 'package:flutter/material.dart';

import 'package:softsanc_events_screens/profile_information.dart';
import 'booking_history.dart';
import 'groups.dart';
import 'sign_in.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // AppBar/////////////
      ///////////////////
      appBar: AppBar(
        title: Text(
          'Account',
        ),
        leading: IconButton(icon: Icon(Icons.close), onPressed: () {}),
      ),
      ////// Body//////////////
      ////////////////////////
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          'Alaina',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profileinformation()));
                        },
                        child: Text('View Profile'),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 8.0),
                child: Text(
                  'MY ACCOUNT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _myButton('Private Events', width, 'PE'),
                    _myButton('Booking History', width, 'BH'),
                    _myButton('Groups', width, 'GP'),
                    _myButton('Friends', width, 'FD'),
                    _myButton('Category', width, 'CT'),
                    _myButton('Logout', width, 'LO'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 8.0),
                child: Text(
                  'ABOUT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _myButton('About Us', width, 'AU'),
                    _myButton('Send Feedback', width, 'SF'),
                    _myButton('Privacy Policy', width, 'PP'),
                    _myButton('Term and Conditions', width, 'TC'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myButton(String data, double width, String flag) {
    return FlatButton(
      onPressed: () {
        if (flag == 'PE') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookingHistory()));
        } else if (flag == 'GP') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Groups()));
        } else if (flag == 'LO') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        } else if (flag == 'BH') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BookingHistory()));
        }
      },
      child: Container(
        width: width,
        child: Text(data),
      ),
    );
  }
}
