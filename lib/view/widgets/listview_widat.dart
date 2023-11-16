import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';
import '../../resources/components/general_exception.dart';
import '../../resources/components/internal_exception_widget.dart';
import '../../view_models/Controller/home/list_controller.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final lvm = Get.put(ListViewModel());
   @override
  void initState() {
    super.initState();
    lvm.listApiViewModel();
  }
  @override
  Widget build(BuildContext context) {
   
    return Obx(() {
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
                    subtitle:
                        Text(lvm.userlist.value.data![index].email.toString()),
                  ),
                );
              });
      }
      return const SizedBox();
    });
  }
}
