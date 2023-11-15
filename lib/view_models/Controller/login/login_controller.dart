import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/resources/routes/routes_names.dart';
import 'package:getx_mvvm/utils/utils.dart';

import '../../../models/login_model.dart';
import '../../../repository/login_repository.dart';
import '../user_preference/user_preferences_view_model.dart';

class LoginViewModel extends GetxController {
  final _myrepository = LoginRepository();

  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  final emailfocusnode = FocusNode().obs;
  final passswordfocusnode = FocusNode().obs;

  RxBool loading = false.obs;

  UserPreference up = UserPreference();

  void loginApiViewModel() {
    loading.value = true;
    Map data = {
      'email': emailcontroller.value.text,
      'password': passwordcontroller.value.text,
    };
    _myrepository.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.toastMessage(value['error'], Colors.red);
      } else {
        up.saveuser(LoginModel.fromJson(value)).then((value) {
          Get.delete<LoginViewModel>();
          Get.toNamed(RoutesNames.home);
        }).onError((error, stackTrace) {});
        Utils.snackbar('Congrates', 'Login Successfuly');
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackbar('Error', error.toString());
    });
  }
}
