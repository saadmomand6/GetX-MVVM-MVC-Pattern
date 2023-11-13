import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/resources/routes/routes_names.dart';

import '../view_models/Controller/user_preference/user_preferences_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreference up = UserPreference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          InkWell(
              onTap: () {
                up.removeuser().then((value) {
                  Get.toNamed(RoutesNames.login);
                });
              },
              child: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
