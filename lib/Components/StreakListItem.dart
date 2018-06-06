import 'package:flutter/material.dart';

import '../Models/Streak.dart';

class StreakListItem extends StatefulWidget {
  StreakListItem(this.streak, this.index,
      {this.onRemove, this.onTap, this.width});

  final Streak streak;
  final int index;
  final ValueChanged<int> onTap;
  final ValueChanged<int> onRemove;
  final double width;

  _StreakListItemState createState() => new _StreakListItemState(index, streak);
}

class _StreakListItemState extends State<StreakListItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  _StreakListItemState(this.index, this.streak);

  final int index;
  final Streak streak;
  static const percentageViewable = 0.25;
  double dx = 0.0;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = new Tween(
            begin: const Offset(0.0, 0.0),
            end: const Offset(-percentageViewable, 0.0))
        .animate(new CurveTween(curve: Curves.decelerate).animate(_controller));

    animation.addListener(() {
      setState(() {
        dx = animation.value.distance / percentageViewable;
      });
    });

    return new GestureDetector(
        onHorizontalDragUpdate: (data) {
          // we can access context.size here
          setState(() {
            _controller.value -= data.primaryDelta / context.size.width;
          });
        },
        onHorizontalDragEnd: (data) {
          if (data.primaryVelocity > 500)
            _controller.animateTo(
                .0); //close menu on fast swipe in the right direction
          else if (_controller.value >= 0.5 ||
              data.primaryVelocity <
                  -500) // fully open if dragged a lot to left or on fast swipe to left
            _controller.animateTo(1.0);
          else // close if none of above
            _controller.animateTo(.0);
        },
        child: new Stack(children: <Widget>[
          new Positioned(
              right: 0.0,
              child: new Container(
                  width: 100.0,
                  height: 100.0,
                  padding: EdgeInsets.all(20.0),
                  child: new IconButton(
                      icon: new Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _controller.reverse();
                        });
                        widget.onRemove(widget.index);
                      }))),
          new SlideTransition(
              position: animation,
              child: new Container(
                  height: 100.0,
                  width: widget.width,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        new BoxShadow(
                            offset: new Offset(8.0, 8.0),
                            color: new Color.fromRGBO(0, 0, 0, dx * 0.2),
                            blurRadius: dx * 8.0)
                      ],
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(20.0))),
                  child: new Material(
                      color: Colors.transparent,
                      child: new InkWell(
                          onTap: () {
                            setState(() {
                              _controller.reverse();
                            });
                            widget.onTap(widget.index);
                          },
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(20.0)),
                          child: new Container(
                              padding: EdgeInsets.all(30.0),
                              child: new Text(
                                  widget.streak.title.isNotEmpty
                                      ? widget.streak.title
                                      : "Untitled streak",
                                  style: new TextStyle(fontSize: 15.0)))))))
        ]));
  }
}
