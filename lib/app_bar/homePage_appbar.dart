// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../controller/user_controller.dart';
import '../app_bar/custom_appbar.dart';
import '../widgets/colors.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.find<UserController>();
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good day for shopping",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.grey[200]),
          ),
          Text(
            usercontroller.userName.value,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: bgColor),
          ),
        ],
      ),
    );
  }
}
