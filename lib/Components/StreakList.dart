import 'package:flutter/material.dart';

import 'StreakListItem.dart';
import '../Models/Streak.dart';

class StreakList extends StatelessWidget {
  StreakList({List<Streak> streaks, this.onRemove, this.onSelect})
      : this.streaks = streaks.reversed.toList();

  final List<Streak> streaks;
  final ValueChanged<int> onRemove;
  final ValueChanged<int> onSelect;
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: streaks.length * 100.0 + 30,
        margin: EdgeInsets.all(10.0),
        child: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return new Stack(
              overflow: Overflow.clip,
              children: List.generate(streaks.length, (index) {
                int reversedIndex = streaks.length - index - 1;
                return new Positioned(
                    top: 100.0 * reversedIndex,
                    child: new StreakListItem(streaks[reversedIndex], index,
                        onTap: onSelect,
                        onRemove: onRemove,
                        width: constraints.maxWidth));
              }));
        }));
  }
}
