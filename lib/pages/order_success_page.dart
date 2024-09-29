import '../pages/home_page.dart';
import 'package:flutter/material.dart';
import '../widgets/colors.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                        image: AssetImage(
                          "assets/orderplaced.gif",
                        ),
                        height: 80,
                        width: 80),
                    const SizedBox(height: 20),
                    const Text(
                      "Order Placed Successfully!",
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Your item will be shipped soon",
                      style: TextStyle(color: blackColor, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2))),
                              backgroundColor: blueColor),
                          child: const Text(
                            "Continue",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ])),
        ),
      ),
    );
  }
}
