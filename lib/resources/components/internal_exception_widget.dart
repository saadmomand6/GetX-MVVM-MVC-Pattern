import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/resources/colors/colors.dart';

class InternalExceptionWidget extends StatefulWidget {
  final VoidCallback onpresed;
  const InternalExceptionWidget({required this.onpresed, super.key});

  @override
  State<InternalExceptionWidget> createState() =>
      _InternalExceptionWidgetState();
}

class _InternalExceptionWidgetState extends State<InternalExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final heught = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Icon(
            Icons.cloud_off,
            color: AppColors.white,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
                child: Text(
              'Internet Exception'.tr,
              textAlign: TextAlign.center,
            )),
          ),
          SizedBox(
            height: heught * 1.5,
          ),
          InkWell(
            onTap: widget.onpresed,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                'Retry',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
