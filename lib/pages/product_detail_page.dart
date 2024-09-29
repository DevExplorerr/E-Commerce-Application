// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../models/model.dart';
import '../pages/cart_page.dart';
import '../pages/checkout_page.dart';
import '../widgets/colors.dart';
import '../controller/cart_controller.dart';
import '../widgets/cart_icon_badge.dart';
import '../widgets/product_detail_card.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  AllProduts productdetailpage;

  ProductDetailScreen({super.key, required this.productdetailpage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: const CartIconWithBadge(
                  width: 20,
                  height: 20,
                  iconColor: blackColor,
                  badgeColor: yellowColor,
                  textColor: blackColor,
                )),
          ),
        ],
        backgroundColor: bgColor,
        centerTitle: true,
        title: const Text(
          "Product Detail",
          style: TextStyle(color: blackColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: ProductDetailCard(
        productdetailpage: productdetailpage,
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: whiteColor,
        color: whiteColor,
        elevation: 50,
        shadowColor: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              color: yellowColor,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: yellowColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckOutPage(cartItems: [
                        CartItem(product: productdetailpage, quantity: 1)
                      ]),
                    ),
                  );
                },
                child: const Text(
                  'Buy Now',
                  style:
                      TextStyle(color: blackColor, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              color: blackColor,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blackColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                onPressed: () {
                  cartController.addToCart(productdetailpage);
                  Get.snackbar('Product Added', productdetailpage.title,
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: const Text(
                  'Add to Cart',
                  style:
                      TextStyle(color: whiteColor, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
