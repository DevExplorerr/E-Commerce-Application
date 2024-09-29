// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  String? labeltext;
  String? hinttext;
  final Widget? suffixicon;
  final TextInputType? keyboradtype;
  final String? obscuringCharacter;
  final bool? obscureText;

  CustomTextField(
      {super.key,
      required this.controller,
      this.labeltext,
      this.hinttext,
      this.suffixicon,
      required this.keyboradtype,
      this.obscuringCharacter,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      obscureText: obscureText ?? false,
      obscuringCharacter: obscuringCharacter ?? '•',
      style: const TextStyle(color: blackColor),
      keyboardType: keyboradtype,
      controller: controller,
      cursorColor: blackColor,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: const TextStyle(color: blackColor),
        labelText: labeltext,
        labelStyle: const TextStyle(color: blackColor),
        suffixIcon: suffixicon,
        suffixIconColor: Colors.grey[400],
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: blackColor),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: blackColor),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
