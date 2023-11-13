import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/resources/routes/routes_names.dart';
import 'package:getx_mvvm/view_models/Controller/user_preference/user_preferences_view_model.dart';

class SplashService {
  UserPreference up = UserPreference();
  void islogin() {
    up.getuser().then((value){
      if (value.token!.isEmpty || value.token.toString() == 'null') {
        Timer(const Duration(seconds: 3), () => Get.toNamed(RoutesNames.login));
      }else{
Timer(const Duration(seconds: 3), () => Get.toNamed(RoutesNames.home));
      }
    });
    
  }
}
