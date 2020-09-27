import 'package:flutter/material.dart';
import 'package:diary/timetable_page.dart';
import 'package:diary/today_page.dart';
import 'package:diary/homework_page.dart';
import 'package:diary/settings_page.dart';

enum Page { timetable, today, homework, settings }

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StartPageWidget(),
    );
  }
}

class StartPageWidget extends StatefulWidget {
  StartPageWidget({Key key}) : super(key: key);

  @override
  _StartPageWidgetState createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
  static Map<Page, Widget> _widgetOptions = {
    Page.today: TodayPage(),
    Page.timetable: TimetablePage(),
    Page.settings: SettingsPage(),
    Page.homework: HomeworkPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: Text("Diary"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.schedule), text: "Timetable"),
                  Tab(icon: Icon(Icons.today), text: "Today"),
                  Tab(icon: Icon(Icons.work), text: "Homework"),
                ],
              )),
          body: TabBarView(children: [
            _widgetOptions[Page.timetable],
            _widgetOptions[Page.today],
            _widgetOptions[Page.homework],
          ]),
        ),
      ),
    );
  }
}
