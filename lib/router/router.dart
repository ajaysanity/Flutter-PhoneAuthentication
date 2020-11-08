
import 'package:flutter/material.dart';
import 'package:zlatko_test/router/router_constant.dart';
import 'package:zlatko_test/screens/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings, {String data}) {
  switch (settings.name) {
    case loginScreen:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case errorScreen:
      return MaterialPageRoute(builder: (context) => ErrorScreen());
    default:
      return MaterialPageRoute(builder: (context) => ErrorScreen());

  }
}