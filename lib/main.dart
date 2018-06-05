import 'package:flutter/material.dart';
import 'Screens/Home/index.dart';
import './theme.dart';

void main() {
  new Routes();
}

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Blue Squares",
      theme: BlueSquaresTheme.data,
      debugShowCheckedModeBanner: false,
      home: new HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return new CustomRoute(
              builder: (_) => new HomeScreen(),
              settings: settings,
            );
        }
      },
    ));
  }
}

/// Custom Route allows custom transitions during Screen changes.
class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return child;
  }
}
