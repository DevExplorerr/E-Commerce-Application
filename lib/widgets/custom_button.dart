// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String labeltext;
  final Widget? child;
  final double? height;
  const CustomButton(
      {super.key,
      required this.height,
      required this.onPressed,
      required this.labeltext,
      this.child});
//height:45

  @override
  Widget build(BuildContext context) {
    return Container(
      color: yellowColor,
      height: height,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: yellowColor,
            side: const BorderSide(color: yellowColor),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)))),
        onPressed: onPressed,
        child: child != null
            ? const CircularProgressIndicator(color: blackColor)
            : Text(
                labeltext,
                style: const TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
