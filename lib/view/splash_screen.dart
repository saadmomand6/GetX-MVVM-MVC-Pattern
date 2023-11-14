import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  SplashService splashscreen = Get.put(SplashService());

  @override
  void initState() {
    super.initState();
    splashscreen.islogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('email_hint'.tr),
      ),
      //body: GeneralExceptionWidget(onpresed: () { },
      // body: RoundButton(
      //   title: 'Round Button',
      //   height: 30,
      //   width: 20,
      //   onpress: (){},
      //   textColor: Colors.pink,
      //   buttonColor: Colors.black),
      body: Center(
        child: Text('Welcome'.tr),
      ),
    );
  }
}
