import 'package:getx_mvvm/resources/routes/routes_names.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/login_screen.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

class AppRoutes {
  static approutes() => [
        GetPage(
            name: RoutesNames.splash,
            page: () => const SplashScreen(),
            transition: Transition.leftToRight,
            transitionDuration: const Duration(seconds: 1)),
        GetPage(
            name: RoutesNames.login,
            page: () => const LoginScreen(),
            transition: Transition.leftToRight,
            transitionDuration: const Duration(seconds: 1)),
      ];
}
