import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/resources/components/round_button.dart';

import '../resources/components/general_exception.dart';
import '../resources/components/internal_exception_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('email_hint'.tr),
      ),
      //body: GeneralExceptionWidget(onpresed: () { },
        body: RoundButton(
          title: 'Round Button', 
          height: 30, 
          width: 20, 
          onpress: (){}, 
          textColor: Colors.pink, 
          buttonColor: Colors.black),
    );
  }
}