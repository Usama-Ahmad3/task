import 'package:get/get_navigation/get_navigation.dart';
import 'package:task/screens/homeScreen.dart';

import 'routeName.dart';

class Routes {
  static appRoutes() => [
        GetPage(
            name: RouteName.homeScreen,
            page: () => HomeScreen(),
            transition: Transition.circularReveal,
            transitionDuration: const Duration(milliseconds: 300)),
      ];
}
