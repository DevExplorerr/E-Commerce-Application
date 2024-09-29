import 'package:e_commerce_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  final String selectedPaymentMethod;
  final Function(String) onPaymentMethodChanged;
  final String selectedImage;

  const BillingPaymentSection({
    super.key,
    required this.onPaymentMethodChanged,
    required this.selectedPaymentMethod,
    required this.selectedImage,
  });

  void _showPaymentOptions(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            color: whiteColor,
            height: 300,
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const Text(
                  "Select Payment Method",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: blackColor),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Image(
                    image: AssetImage("credit_debit_card.png"),
                    width: 30,
                  ),
                  title: const Text("Credit/Debit Card",
                      style: TextStyle(color: blackColor)),
                  onTap: () {
                    onPaymentMethodChanged("Credit/Debit Card");
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Image(
                    image: AssetImage("paypal_logo.png"),
                    width: 30,
                  ),
                  title:
                      const Text("Paypal", style: TextStyle(color: blackColor)),
                  onTap: () {
                    onPaymentMethodChanged("Paypal");
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Image(
                    image: AssetImage("cash_on_delivery.png"),
                    width: 30,
                  ),
                  title: const Text("Cash on Delivery",
                      style: TextStyle(color: blackColor)),
                  onTap: () {
                    onPaymentMethodChanged("Cash on Delivery");
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Image(
                    image: AssetImage("payoneer_logo.png"),
                    width: 70,
                  ),
                  title: const Text("Payoneer",
                      style: TextStyle(color: blackColor)),
                  onTap: () {
                    onPaymentMethodChanged("Payoneer");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Payment Method",
              style: TextStyle(color: blackColor, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            TextButton(
              onPressed: () => _showPaymentOptions(context),
              child: const Text(
                "Change",
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              color: whiteColor,
              padding: const EdgeInsets.all(8),
              child: Image(
                image: AssetImage(selectedImage),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              selectedPaymentMethod,
              style: const TextStyle(
                  color: blackColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
