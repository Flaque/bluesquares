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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
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
    return new FadeTransition(opacity: animation, child: child);
  }
}
