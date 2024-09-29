import 'package:e_commerce_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: greyColor),
        ),
        child: Row(children: [
          const Icon(Icons.search_outlined, color: greyColor),
          const SizedBox(width: 16),
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: blackColor))
        ]),
      ),
    );
  }
}
