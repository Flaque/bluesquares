import 'package:flutter/material.dart';
import 'Screens/Home/index.dart';

void main() {
  new Routes();
}

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Blue Squares",
      theme: new ThemeData(
          accentColor: const Color.fromRGBO(106, 137, 204, 1.0),
          primarySwatch: Colors.blue,
          backgroundColor: const Color.fromRGBO(241, 242, 246, 1.0),
          canvasColor: Colors.white,
          brightness: Brightness.light),
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
