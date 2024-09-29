// ignore_for_file: unused_local_variable

import '../widgets/colors.dart';
import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class BillingAmountSection extends StatelessWidget {
  final List<CartItem> cartItems;
  final double subTotal;
  const BillingAmountSection(
      {super.key, required this.cartItems, required this.subTotal});

  @override
  Widget build(BuildContext context) {
    double shippingFee = 7.0;
    double taxFee = 3.5;

    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Subtotal",
              style: TextStyle(color: blackColor),
            ),
            Text(
              "\$${subTotal.toStringAsFixed(2)}",
              style: const TextStyle(
                  color: blackColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 2),

        // Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Shipping fee",
              style: TextStyle(color: blackColor),
            ),
            Text(
              "\$$shippingFee",
              style: const TextStyle(
                  color: blackColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 2),

        // Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tax fee",
              style: TextStyle(color: blackColor),
            ),
            Text(
              "\$$taxFee",
              style: const TextStyle(
                  color: blackColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 2),

        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Order total",
              style: TextStyle(color: blackColor),
            ),
            Text(
              "\$${(subTotal + shippingFee + taxFee).toStringAsFixed(2)}",
              style: const TextStyle(
                  color: blackColor, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}
