import '../widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../provider/favorite_provider.dart';

class ProductCard extends StatefulWidget {
  final AllProduts product;
   const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    void toggleFavorite() {
      favoriteProvider.toggleFavorite(widget.product);

      Fluttertoast.showToast(
        msg: favoriteProvider.isFavorite(widget.product) ? "Added to favorite" : "Deleted from favorite",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: yellowColor,
        textColor: blackColor,
        fontSize: 14.0,
        webPosition: "center",
      );
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.product.image,
                  height: 110,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                widget.product.title,
                style: const TextStyle(
                  color: blackColor,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Text(
                "Price: \$${widget.product.price}",
                style: const TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: widget.product.rating.rate,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: yellowColor,
                    ),
                    itemCount: 1,
                    itemSize: 18.0,
                    unratedColor: yellowColor.withAlpha(50),
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${widget.product.rating.rate}",
                    style: const TextStyle(
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "(${widget.product.rating.count})",
                    style: const TextStyle(
                      color: blackColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      size: 18,
                      favoriteProvider.isFavorite(widget.product) ? Icons.favorite : Icons.favorite_border,
                      color: favoriteProvider.isFavorite(widget.product) ? Colors.red : Colors.grey,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
