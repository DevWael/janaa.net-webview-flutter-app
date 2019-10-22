import 'package:flutter/material.dart';
import 'package:janastore/screens/home.dart';
import 'package:janastore/screens/settings_screen.dart';
import 'package:janastore/config.dart';
import 'package:janastore/prefrences.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
//    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MyHomePage(title: AppConfig.appTitle, lang: 'en/'));
      case '/settings':
        return MaterialPageRoute(
            builder: (_) => SettingsPage(
                  title: 'Settings',
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error 404!'),
        ),
        body: Center(
          child: Text('The Requested Screen Cannot be found!'),
        ),
      );
    });
  }
}
