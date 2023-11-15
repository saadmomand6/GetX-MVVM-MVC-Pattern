import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/widgets/button_login.dart';
import 'package:getx_mvvm/view/widgets/input_email.dart';
import 'package:getx_mvvm/view/widgets/input_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              const InputEmail(),
              const InputPassword(),
              ButtonLogin(
                formKey: _formkey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
