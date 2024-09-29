import 'package:e_commerce_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      this.trailing});

  final String title, subTitle;
  final IconData icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: blueColor),
      title: Text(
        title,
        style:
            Theme.of(context).textTheme.titleMedium!.apply(color: blackColor),
      ),
      subtitle: Text(subTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: blackColor)),
      trailing: trailing,
    );
  }
}
