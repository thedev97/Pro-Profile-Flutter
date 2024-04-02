import 'package:flutter/material.dart';
import 'package:pro_profile/presentation/home/home_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        home: HomeScreen.builder,
        initialRoute: HomeScreen.builder
      };
}
