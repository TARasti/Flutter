import 'package:flutter/material.dart';
import 'package:softsanc_events_screens/Inventry.dart';
import 'package:softsanc_events_screens/generate_bill.dart';

import 'package:softsanc_events_screens/track_units.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GenerateBill(),
    );
  }
}
