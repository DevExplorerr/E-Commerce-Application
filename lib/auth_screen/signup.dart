// ignore_for_file: use_build_context_synchronously, avoid_print, unused_element

import 'dart:math';
import '../auth_screen/firebase_auth_implementation/firebase_auth_services.dart';
import '../auth_screen/login.dart';
import '../pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/colors.dart';
import 'package:get/get.dart';
import '../../global/toast.dart';
import '../controller/user_controller.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

String generatePassword(int passwordLength) {
  String char =
      '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#%^&*()';
  String password = '';
  Random random = Random();

  for (int i = 0; i < passwordLength; i++) {
    final index = random.nextInt(char.length);
    password += char[index];
  }
  return password;
}

class _SignupState extends State<Signup> {
  bool _isObscured = true;
  bool _isSignup = false;

  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: blackColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 120,
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            CustomTextField(
                controller: nameController,
                labeltext: 'Full Name',
                keyboradtype: TextInputType.name),
            const SizedBox(height: 15),
            CustomTextField(
              controller: emailController,
              labeltext: 'Enter Email',
              keyboradtype: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: passwordController,
              labeltext: 'Enter Password',
              keyboradtype: TextInputType.visiblePassword,
              suffixicon: IconButton(
                icon: _isObscured
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
              obscuringCharacter: '•',
              obscureText: _isObscured,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                    height: 45,
                    key: UniqueKey(),
                    onPressed: _signup,
                    labeltext: 'Register',
                    child: _isSignup
                        ? const CircularProgressIndicator(color: blackColor)
                        : null),
                CustomButton(
                  height: 45,
                  key: UniqueKey(),
                  onPressed: () {
                    int length = 12;
                    final generatedPassword = generatePassword(length);
                    setState(() {
                      passwordController.text = generatedPassword;
                    });
                  },
                  labeltext: "Generate Password",
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text("Login",
                      style: TextStyle(
                          color: yellowColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signup() async {
    String username = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    setState(() {
      _isSignup = true;
    });
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      showToast(message: "User is succesfully created");

      final userController = Get.find<UserController>();
      userController.updateUserData(username, email);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    setState(() {
      _isSignup = false;
    });
  }
}
