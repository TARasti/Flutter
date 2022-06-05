import 'package:flutter/material.dart';
import 'package:softsanc_events_screens/utils/mycard.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key key}) : super(key: key);

  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Booking History'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Interested',
              ),
              Tab(
                text: 'Going',
              ),
              Tab(
                text: 'MayBe',
              ),
            ],
          ),
        ),
        body: ListView(
          children: [for (int i = 0; i < 5; i++) MyCard()],
        ),
      ),
    );
  }
}
