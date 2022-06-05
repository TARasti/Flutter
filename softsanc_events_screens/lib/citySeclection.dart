import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

////////////////// The main Controller Class///////////////////////////
class AllCities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Heading("Expploring Interests")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //////////// Here is the First Heading/////////////

          Container(
            //////////// Here is the First Heading/////////////
            child: Heading(
              "Trending in Dera Ismail Khan",
            ),
          ),
          Row(
            children: [
              /////////////// The Buttons below the first heading//////

              Button_class("Courses"),
              SizedBox(
                width: 15.0,
              ),
              Button_class("Literature"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            //////////// Here is the Second Heading/////////////
            child: Heading("Explore Events by Your Interests"),
          ),

          SizedBox(height: 15.0),
          Flexible(
            fit: FlexFit.loose,
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                Cities("Sports",
                    'https://images.pexels.com/photos/269948/pexels-photo-269948.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                Cities("Food and drinks",
                    'https://images.pexels.com/photos/3184192/pexels-photo-3184192.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                Cities("Business",
                    'https://images.pexels.com/photos/7097/people-coffee-tea-meeting.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                Cities("Exhibition",
                    'https://images.pexels.com/photos/2363/france-landmark-lights-night.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                Cities("Parties",
                    'https://images.pexels.com/photos/5152572/pexels-photo-5152572.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                Cities("Health ",
                    'https://images.pexels.com/photos/40568/medical-appointment-doctor-healthcare-40568.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              ],
            ),
          ),
          Heading("Explore Events From Nearby Cities"),
          Row(
            children: [
              Button_class("Dera ismail khan"),
              SizedBox(
                width: 15.0,
              ),
              Button_class("Jhang Sadar"),
              SizedBox(
                width: 15.0,
              ),
              Button_class("Sargodha"),
            ],
          ),
          Row(
            children: [
              Button_class("Multan"),
              SizedBox(
                width: 15.0,
              ),
              Button_class("Mianwali"),
              SizedBox(
                width: 15.0,
              ),
              Button_class("Muzaffargarh"),
            ],
          ),

          Row(
            children: [
              SizedBox(
                height: 50.0,
              )
            ],
          )
        ]),
      ),
    );
  }
}
//////////////////// End of the main Controller class/////////////////

///////////// All headings are controlled here//////////////////////
class Heading extends StatelessWidget {
  String headingText;
  Heading(this.headingText);
  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}
/////////////////////End of Heading class/////////////////////////

////////////////// All Buttons are Controlled here////////////////
class Button_class extends StatelessWidget {
  String text;
  Button_class(this.text);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {},
        child: Text(
          text,
          style: GoogleFonts.sansita(
            fontSize: 14.0,
          ),
        ),
        color: Colors.white,
        textColor: Colors.black,
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));
  }
}
//////////////////End of the Button class /////////////////////////

///////////////// Images ////////////////////////////////////////
class Cities extends StatelessWidget {
  String image;
  String text;
  Cities(this.text, this.image);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
          elevation: 10,
          child: Stack(children: <Widget>[
            Image.network(
              image,
              // fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: GoogleFonts.sansita(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ])),
    );
  }
}
