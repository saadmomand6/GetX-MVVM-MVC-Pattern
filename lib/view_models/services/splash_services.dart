import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/resources/routes/routes_names.dart';

class SplashService {
  void islogin() {
    Timer(const Duration(seconds: 3), () => Get.toNamed(RoutesNames.login));
  }
}
