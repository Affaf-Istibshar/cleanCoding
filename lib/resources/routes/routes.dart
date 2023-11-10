import 'package:get/get.dart';
import 'package:mvvm/resources/routes/routes_name.dart';
import 'package:mvvm/view/home/home_screen.dart';
import 'package:mvvm/view/login/login_screen.dart';
import 'package:mvvm/view/splash_screen/splashScreen.dart';

class AppRoutes {
  static appRoutes() =>
      [   GetPage(name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 250)
      ),
        GetPage(name: RoutesName.loginView,
          page: () => const LoginView(),
          transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 250)
      ),
        GetPage(name: RoutesName.homeView,
          page: () => const HomeScreen(),
          transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 250)
      ),
];
}
