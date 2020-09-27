import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: ListView(children: [
          Column(
            children: [
              _weekDay("Monday"),
              _weekDay("Tuesday"),
              _weekDay("Wednesday"),
              _weekDay("Thursday"),
              _weekDay("Friday"),
              _weekDay("Saturday"),
              _weekDay("Sunday")
            ],
          )
        ]));
  }

  Widget _weekDay(String weekDayTitle) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: Colors.white,
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: InkWell(
            onTap: () => print(weekDayTitle),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(15), child: Text(weekDayTitle)),
              ],
            )));
  }
}
