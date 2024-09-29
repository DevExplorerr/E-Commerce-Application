 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';

class CartIconWithBadge extends StatelessWidget {
  final Color? badgeColor;
  final Color? textColor;
  final Color? iconColor;
  final double? width;
  final double? height; 
  const CartIconWithBadge({
    super.key,
    required this.badgeColor,
    required this.textColor,
    required this.width,
    required this.height,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(Icons.shopping_cart, color: iconColor, size: 25),
        Obx(() {
          if (cartController.totalQuantity > 0) {
            return Positioned(
              left: 15,
              bottom: 15,
              child: Container(
                width: width,
                height: height,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    cartController.totalQuantity.toString(),
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ],
    );
  }
}
