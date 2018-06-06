import 'package:flutter/material.dart';

import "../Streak/index.dart";
import "../../main.dart";
import '../../Components/NothingHere.dart';
import "../../Components/Header.dart";
import "../../Components/StreakList.dart";
import "../../Components/BottomSheetDialog.dart";
import "../../Models/UserData.dart";
import "../../Models/Streak.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Streak> streaks = [];

  @override
  void initState() {
    super.initState();

    UserData.load().then((Null) {
      setState(() {
        streaks = UserData.getStreaks();
      });
    });
  }

  void removeStreak(int index) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new BottomSheetDialog(
            title:
                "Are you sure you want to delete '${index < streaks.length ? streaks[index] : ""}'?",
            primaryOption: "Delete",
            secondaryOption: "Nope",
            completed: (bool delete) {
              if (delete) {
                UserData.remove(streaks[index]).then((Null) {
                  setState(() {
                    streaks = UserData.getStreaks();
                  });
                });
              }
              Navigator.of(context).pop();
            },
          );
        });
  }

  void selectStreak(int index) {
    Navigator.of(context).push(new CustomRoute(
        builder: (context) => new StreakScreen(streak: streaks[index])));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: new FloatingActionButton(
          tooltip: 'Add',
          child: new Icon(Icons.add),
          onPressed: () {
            Streak streak = new Streak([], "");
            UserData.add(streak).then((Null) {
              Navigator.of(context).push(new CustomRoute(
                  builder: (context) => new StreakScreen(streak: streak)));
            });
          },
        ),
        body: streaks.isEmpty
            ? NothingHere()
            : new Container(
                decoration:
                    new BoxDecoration(color: Theme.of(context).backgroundColor),
                child: new ListView(children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new StreaksHeader(),
                      new StreakList(
                        streaks: streaks,
                        onRemove: removeStreak,
                        onSelect: selectStreak,
                      ),
                    ],
                  )
                ])));
  }
}

class StreaksHeader extends StatelessWidget {
  const StreaksHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: new Header("Streaks"));
  }
}
