import '../auth_screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Signup()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                "assets/cart.gif",
                height:
                    screenHeight * 0.40, // height based on screen size (35%)
                width: screenWidth * 0.8, // width based on screen size (80%)
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Glitz Mart",
              style: TextStyle(
                color: greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
