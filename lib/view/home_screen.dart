import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/resources/components/general_exception.dart';
import 'package:getx_mvvm/resources/routes/routes_names.dart';

import '../resources/components/internal_exception_widget.dart';
import '../view_models/Controller/home/list_controller.dart';
import '../view_models/Controller/user_preference/user_preferences_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final lvm = Get.put(ListViewModel());
  UserPreference up = UserPreference();

  @override
  void initState() {
    super.initState();
    lvm.listApiViewModel();
  }

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
      body: Obx(() {
        switch (lvm.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (lvm.error.value == 'No Internet') {
              return InternalExceptionWidget(
                onpresed: () {
                  lvm.refreshlistApiViewModel();
                },
              );
            } else {
              GeneralExceptionWidget(onpresed: () {
                lvm.refreshlistApiViewModel();
              });
              // return Center(child: Text(lvm.error.toString()));
            }

          case Status.COMPLETED:
            return ListView.builder(
                itemCount: lvm.userlist.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            lvm.userlist.value.data![index].avatar.toString()),
                      ),
                      title: Text(
                          lvm.userlist.value.data![index].firstName.toString()),
                      subtitle: Text(
                          lvm.userlist.value.data![index].email.toString()),
                    ),
                  );
                });
        }
        return const SizedBox();
      }),
    );
  }
}
