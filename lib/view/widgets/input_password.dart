import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view_models/Controller/login/login_controller.dart';

class InputPassword extends StatelessWidget {
  const InputPassword({super.key});

  @override
  Widget build(BuildContext context) {
        final logincontroller = Get.put(LoginViewModel());
    return TextFormField(
      controller: logincontroller.passwordcontroller.value,
      focusNode: logincontroller.passswordfocusnode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackbar('Email', 'Enter Email');
        }
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}
