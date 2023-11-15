import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/components/round_button.dart';
import '../../view_models/Controller/login/login_controller.dart';

class ButtonLogin extends StatelessWidget {
  final formKey;
   ButtonLogin({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(LoginViewModel());

    
    return Obx(() {
      return RoundButton(
        title: 'login'.tr,
        textColor: Colors.white,
        height: 20,
        width: 200,
        loading: logincontroller.loading.value,
        buttonColor: Colors.teal,
        onpress: () {
          if (formKey.currentState!.validate()) {
            logincontroller.loginApiViewModel();
          }
        },
      );
    });
  }
}
