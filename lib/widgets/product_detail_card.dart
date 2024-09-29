// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../models/model.dart';

class ProductDetailCard extends StatelessWidget {
  AllProduts productdetailpage;
  ProductDetailCard({super.key, required this.productdetailpage});

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Container(
                color: whiteColor,
                width: double.infinity,
                child: Image.network(
                  productdetailpage.image,
                  fit: BoxFit.contain,
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price: \$${productdetailpage.price}",
                      style: const TextStyle(
                          color: blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      productdetailpage.title,
                      style: const TextStyle(
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: productdetailpage.rating.rate,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: yellowColor,
                          ),
                          itemCount: 5,
                          itemSize: 25.0,
                          unratedColor: yellowColor.withAlpha(50),
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "(${productdetailpage.rating.rate.toString()})",
                          style: const TextStyle(
                            color: blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total Reviews: ${productdetailpage.rating.count}",
                      style: const TextStyle(
                          color: blackColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Description: ${productdetailpage.description}",
                      style: const TextStyle(
                          color: blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

// top: 20.0, right: 16, left: 16, bottom: 16