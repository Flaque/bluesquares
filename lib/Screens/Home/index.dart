import 'package:flutter/material.dart';

import '../../Components/TodayButton.dart';
import '../../Components/Header.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            new Header(
              'Meditation',
            ),
            new TodayButton()
          ],
        ),
      ),
    );
  }
}
