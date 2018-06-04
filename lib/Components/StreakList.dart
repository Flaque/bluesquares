import 'package:flutter/material.dart';

import 'StreakListItem.dart';

class StreakList extends StatelessWidget {
  StreakList({this.streaks, this.onRemove, this.onSelect});

  final List<String> streaks;
  final ValueChanged<int> onRemove;
  final ValueChanged<int> onSelect;
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.only(top: 80.0),
        child: new Stack(
            children: List.generate(streaks.length, (index) {
          return new Container(
              margin: EdgeInsets.only(top: index * 80.0),
              child: StreakListItem(
                streaks[index],
                index,
                onTap: onSelect,
                onLongPress: onRemove,
              ));
        })));
  }
}
