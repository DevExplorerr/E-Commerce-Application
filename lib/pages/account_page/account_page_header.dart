import '/widgets/colors.dart';
import '../account_page/custom_tile/user_profile_tile.dart';
import 'package:flutter/material.dart';
import '../../Header/custom_header_container.dart';
import '../../app_bar/custom_appbar.dart';

class AccountPageHeader extends StatelessWidget {
  const AccountPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeaderContainer(
      child: Column(children: [
        CustomAppBar(
          title: Text(
            "Account",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: bgColor, fontWeightDelta: 2),
          ),
        ),
        const UserProfileTile(),
        const SizedBox(height: 32),
      ]),
    );
  }
}
