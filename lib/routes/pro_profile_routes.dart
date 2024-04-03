import 'package:pro_profile/presentation/home/home_screen.dart';

class ProProfileRoutes {
  static const String home = '/home';
  static const String initialRoute = '/initialRoute';

  static final routes = {
    home: (context) => const HomeScreen(),
    initialRoute: (context) => const HomeScreen(),
  };
}
