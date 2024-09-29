// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../widgets/colors.dart';

class ProductCategoryContainer extends StatelessWidget {
  const ProductCategoryContainer({
    super.key,
    this.onTap,
    required this.title,
    required this.imagePath,
  });

  final void Function()? onTap;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Image
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            // Text
            const SizedBox(height: 8),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: bgColor,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
