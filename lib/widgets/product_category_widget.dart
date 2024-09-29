// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import '../header/product_categories_container.dart';

class ProductCategoryWidget extends StatefulWidget {
  const ProductCategoryWidget({super.key});

  @override
  _ProductCategoryWidgetState createState() => _ProductCategoryWidgetState();
}

List<Map<String, String>> categories = [
  {"title": "Jewellery", "image": "assets/categories/jewellery.png"},
  {"title": "Cosmetics", "image": "assets/categories/cosmetics.png"},
  {"title": "Shoes", "image": "assets/categories/shoes.png"},
  {"title": "Men's Clothing", "image": "assets/categories/mens_clothing.png"},
  {"title": "Furniture", "image": "assets/categories/furniture.png"},
];

class _ProductCategoryWidgetState extends State<ProductCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Categories",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: bgColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("View all", style: TextStyle(color: blackColor)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
              height: 80,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: categories.map((category) {
                    return ProductCategoryContainer(
                      title: category['title']!,
                      imagePath: category['image']!,
                    );
                  }).toList()))
        ]));
  }
}
