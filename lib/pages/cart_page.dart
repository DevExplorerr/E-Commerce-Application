import '../pages/checkout_page.dart';
import '../widgets/colors.dart';
import 'package:flutter/material.dart';
import '../controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../pages/product_detail_page.dart';
import '../widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: const Text(
          "Cart",
          style: TextStyle(color: blackColor),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return cartController.cartItems.isEmpty
            ? const Center(
                child: Text(
                  "Your cart is empty",
                  style:
                      TextStyle(color: blackColor, fontWeight: FontWeight.w700),
                ),
              )
            : ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  var cartProduct = cartController.cartItems[index];
                  return Slidable(
                    key: ValueKey(cartProduct.product.id), // Unique key
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            cartController.removeFromCart(cartProduct.product);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: bgColor,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          ProductDetailScreen(
                            productdetailpage: cartProduct.product,
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Image.network(cartProduct.product.image,
                            width: 50, height: 50),
                        title: Text(cartProduct.product.title),
                        subtitle: Text(
                            'Price: \$${cartProduct.product.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                cartController
                                    .removeFromCart(cartProduct.product);
                              },
                            ),
                            Text('${cartProduct.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cartController.addToCart(cartProduct.product);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          color: bgColor,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Quantity: ${cartController.totalQuantity}',
                    style: const TextStyle(color: blackColor, fontSize: 16),
                  ),
                  Text(
                    'Total Price: \$${cartController.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(color: blackColor, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPressed: () {
                  if (cartController.totalQuantity == 0) {
                    Get.snackbar("Cart is empty", "Add items to proceed",
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    Get.to(CheckOutPage(
                      cartItems: cartController.cartItems,
                    ));
                  }
                },
                height: 42,
                labeltext: "Proceed to Checkout",
              ),
            ],
          ),
        );
      }),
    );
  }
}
