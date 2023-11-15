import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view_models/Controller/login/login_controller.dart';

class InputEmail extends StatelessWidget {
  const InputEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(LoginViewModel());
    return TextFormField(
      controller: logincontroller.emailcontroller.value,
      focusNode: logincontroller.emailfocusnode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackbar('Email', 'Enter Email');
        }
      },
      onFieldSubmitted: (value) {
        Utils.changeFieldFocus(
          context,
          logincontroller.emailfocusnode.value,
          logincontroller.passswordfocusnode.value,
        );
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}
