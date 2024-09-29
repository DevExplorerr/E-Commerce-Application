// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import '../models/cart_model.dart';
import '../pages/order_success_page.dart';
import '../widgets/billing_payment_section.dart';
import '../widgets/billing_amount_section.dart';
import '../widgets/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/billing_address_section.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class CheckOutPage extends StatefulWidget {
  final List<CartItem> cartItems;
  const CheckOutPage({super.key, required this.cartItems});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String recipientName = "Default Recipient";
  String phoneNumber = "+92 3481396409";
  String region = "Sindh";
  String city = "Karachi";
  String fullAddress = "Street 123, City Center";

  final promoCodeController = TextEditingController();
  String selectedPaymentMethod = "Paypal";
  String selectedImage = "assets/paypal_logo.png";

  final Map<String, String> paymentImages = {
    "Credit/Debit Card": "assets/credit_debit_card.png",
    "Paypal": "assets/paypal_logo.png",
    "Cash on Delivery": "assets/cash_on_delivery.png",
    "Payoneer": "assets/payoneer_logo.png",
  };

  void updatePaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
      selectedImage = paymentImages[method] ?? "";
    });
  }

  void saveAddress(
      String name, String phone, String region, String city, String address) {
    setState(() {
      recipientName = name;
      phoneNumber = phone;
      this.region = region;
      this.city = city;
      fullAddress = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double subtotal = widget.cartItems.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColor,
        centerTitle: true,
        title: const Text(
          "Order Review",
          style: TextStyle(color: blackColor, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              // Cart Items Container
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0, color: blackColor),
                    color: whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      var items = widget.cartItems[index];
                      return Container(
                        child: ListTile(
                            title: Text(items.product.title,
                                style: const TextStyle(color: blackColor)),
                            leading: Image.network(
                              items.product.image,
                              height: 50,
                              width: 50,
                            ),
                            subtitle: Text(
                                "\$${(items.product.price * items.quantity).toStringAsFixed(2)}",
                                style: const TextStyle(color: blackColor)),
                            trailing: Text("Quantity: ${items.quantity}",
                                style: const TextStyle(color: blackColor))),
                      );
                    }),
              ),
              const SizedBox(height: 20),

              // Coupon Container
              Container(
                child: Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        controller: promoCodeController,
                        keyboradtype: TextInputType.text,
                        hinttext: "Have a promo code? Enter here",
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 100,
                      child: CustomButton(
                        height: 40,
                        onPressed: () {},
                        labeltext: 'Apply',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Billing Section
              Container(
                color: whiteColor,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // Pricing
                    BillingAmountSection(
                      cartItems: widget.cartItems,
                      subTotal: subtotal,
                    ),
                    const SizedBox(height: 10),

                    // Divider
                    const Divider(),
                    const SizedBox(height: 10),

                    // Payment Method
                    BillingPaymentSection(
                      onPaymentMethodChanged: updatePaymentMethod,
                      selectedPaymentMethod: selectedPaymentMethod,
                      selectedImage: selectedImage,
                    ),

                    const SizedBox(height: 20),

                    // Address
                    const BillingAddressSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(13.0),
        child: CustomButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const OrderSuccessPage()));
          },
          height: 40,
          labeltext: 'Place Order',
        ),
      ),
    );
  }
}
