import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utils/utils.dart';

import '../resources/components/round_button.dart';
import '../view_models/Controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final logincontroller = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'.tr),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: logincontroller.emailcontroller.value,
                focusNode: logincontroller.emailfocusnode.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackbar('Email', 'Enter Email');
                  }
                },
                onFieldSubmitted: (Value) {
                  Utils.changeFieldFocus(context,logincontroller.emailfocusnode.value, logincontroller.passswordfocusnode.value,);
                },
                decoration: InputDecoration(
                  hintText: 'email_hint'.tr,
                  border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))
                ),
              ),
              TextFormField(
                controller: logincontroller.passwordcontroller.value,
                focusNode: logincontroller.passswordfocusnode.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackbar('Email', 'Enter Email');
                  }
                },
                decoration: InputDecoration(
                    hintText: 'email_hint'.tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              RoundButton(
                title: 'login'.tr,
                textColor: Colors.white,
                height: 20,
                width: 200,
                buttonColor: Colors.teal,
                onpress: () {
                  if (_formkey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
