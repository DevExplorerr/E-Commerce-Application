import '../../widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../auth_screen/login.dart';
import '../../global/toast.dart';
import '../account_page/custom_tile/setting_menu_tile.dart';
import 'package:flutter/material.dart';

class AccountPageBody extends StatelessWidget {
  const AccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Setting",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: blackColor, fontWeightDelta: 2),
          ),
          const SizedBox(height: 16),
          const SettingMenuTile(
            title: 'My Addresses',
            subTitle: 'Set shopping delivery address',
            icon: Icons.home,
          ),
          const SettingMenuTile(
            title: 'My Cart',
            subTitle: 'Add, remove products and move to checkout',
            icon: Icons.shopping_cart,
          ),
          const SettingMenuTile(
            title: 'My Orders',
            subTitle: 'In-progress and Completed Orders',
            icon: Icons.leave_bags_at_home,
          ),
          const SettingMenuTile(
            title: 'Bank Account',
            subTitle: 'Withdraw balance to registered bank account',
            icon: Icons.food_bank,
          ),
          const SettingMenuTile(
            title: 'My Coupons',
            subTitle: 'List of all the discounted coupons',
            icon: Icons.discount,
          ),
          const SettingMenuTile(
            title: 'Notification',
            subTitle: 'Set any kind of notification message',
            icon: Icons.notifications,
          ),
          const SettingMenuTile(
              title: 'Account Privacy',
              subTitle: 'Manage data usage and connected accounts',
              icon: Icons.security),
          const SizedBox(height: 32),
          Text("App Setting",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: blackColor, fontWeightDelta: 2)),
          const SizedBox(height: 16),
          const SettingMenuTile(
            title: 'Load Data',
            subTitle: 'Upload data to your Cloud Firebase',
            icon: Icons.document_scanner,
          ),
          SettingMenuTile(
            title: 'Location',
            subTitle: 'Set recommendation based on location',
            icon: Icons.location_city,
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          SettingMenuTile(
            title: 'Safe Mode',
            subTitle: 'Search result is safe for all ages',
            icon: Icons.security_update_sharp,
            trailing: Switch(value: false, onChanged: (value) {}),
          ),
          SettingMenuTile(
            title: 'HD Image Quality',
            subTitle: 'Set image quality to be seen',
            icon: Icons.image,
            trailing: Switch(value: false, onChanged: (value) {}),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 35,
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Logout",
                          style: TextStyle(color: blackColor)),
                      content: const Text("Are you sure you want to logout?",
                          style: TextStyle(color: blackColor)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel",
                              style: TextStyle(color: blackColor)),
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                            showToast(message: "Logout successfully");
                          },
                          child: const Text("Confirm",
                              style: TextStyle(color: blueColor)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Logout",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: blackColor, fontWeightDelta: 1)),
            ),
          ),
          const SizedBox(
            height: 32 * 2,
          )
        ],
      ),
    );
  }
}
