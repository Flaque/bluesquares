import 'package:flutter/material.dart';

import "../Streak/index.dart";
import "../../main.dart";
import '../../Components/NothingHere.dart';
import "../../Components/StreakListItem.dart";
import "../../Components/Header.dart";
import "../../Components/BottomSheetDialog.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO: Remove and replace with saved data.
  final List<String> streaks = [
    "Meditate",
    "Stretch",
    "Abs 💪",
    "Running",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: new FloatingActionButton(
          tooltip: 'Add',
          child: new Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(new CustomRoute(
                builder: (context) => new StreakScreen(data: "")));
          },
        ),
        body: streaks.isEmpty
            ? NothingHere()
            : new Container(
                decoration:
                    new BoxDecoration(color: Theme.of(context).backgroundColor),
                child: new ListView(children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      new StreaksHeader(),
                      new Container(
                          margin: EdgeInsets.only(top: 80.0),
                          child: new Stack(
                              children: List.generate(streaks.length, (index) {
                            return new Container(
                                margin: EdgeInsets.only(top: index * 80.0),
                                child: StreakListItem(
                                  streaks[index],
                                  index,
                                  onTap: (int index) {
                                    Navigator.of(context).push(new CustomRoute(
                                        builder: (context) => new StreakScreen(
                                            data: streaks[index])));
                                  },
                                  onLongPress: (int index) {
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
                                                setState(() {
                                                  streaks.removeAt(index);
                                                });
                                              }
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        });
                                  },
                                ));
                          })))
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
