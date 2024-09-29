import '../../../controller/user_controller.dart';
import '../../../widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Obx(
      () => ListTile(
          leading: const CircleAvatar(
            backgroundColor: bgColor,
            child: Icon(
              Icons.person,
              color: blackColor,
            ),
          ),
          title: Text(
            userController.userName.value,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: bgColor,
                ),
          ),
          subtitle: Text(
            userController.email.value,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: bgColor,
                ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            color: bgColor,
          )),
    );
  }
}
