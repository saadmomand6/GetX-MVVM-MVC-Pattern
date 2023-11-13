import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  final emailfocusnode = FocusNode().obs;
  final passswordfocusnode = FocusNode().obs;
}
