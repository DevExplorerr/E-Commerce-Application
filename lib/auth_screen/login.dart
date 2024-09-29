// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:get/get.dart';
import '../auth_screen/firebase_auth_implementation/firebase_auth_services.dart';
import '../auth_screen/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../controller/user_controller.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/colors.dart';
import '../pages/home_page.dart';
import '../../global/toast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscured = true;
  bool _isSignin = false;

  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
          "Login",
          style: TextStyle(color: blackColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 120,
            left: 25,
            right: 25,
          ),
          child: Column(
            children: [
              CustomTextField(
                  controller: emailController,
                  labeltext: 'Enter Email',
                  keyboradtype: TextInputType.emailAddress),
              const SizedBox(height: 15),
              CustomTextField(
                controller: passwordController,
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
                labeltext: 'Enter Password',
              ),
              const SizedBox(height: 50),
              CustomButton(
                  height: 45,
                  onPressed: _login,
                  labeltext: "Login",
                  child: _isSignin
                      ? const CircularProgressIndicator(color: blackColor)
                      : null),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()),
                          (route) => false);
                    },
                    child: const Text("Signup",
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
      ),
    );
  }

  void _login() async {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    setState(() {
      _isSignin = true;
    });
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      showToast(message: "Login successfully");

      final userController = Get.find<UserController>();
      userController.updateUserData(username, email);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      showToast(message: "Invalid Email or Password");
    }
    setState(() {
      _isSignin = false;
    });
  }
}
