import '../pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../provider/favorite_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteProducts = favoriteProvider.favoriteProducts;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(color: blackColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: favoriteProducts.isEmpty
          ? const Center(
              child: Text(
                'No favorite products',
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return Card(
                  elevation: 7.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 15, right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(productdetailpage: product),
                        ),
                      );
                    },
                    child: ListTile(
                      tileColor: bgColor,
                      contentPadding: const EdgeInsets.all(10.0),
                      leading: IntrinsicHeight(
                        child: IntrinsicWidth(
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        product.title,
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        'Price: \$${product.price}',
                        style: const TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: blackColor),
                        onPressed: () {
                          favoriteProvider.toggleFavorite(product);
                          Fluttertoast.showToast(
                            msg: "Deleted from favorite",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: yellowColor,
                            textColor: whiteColor,
                            fontSize: 14.0,
                            webPosition: "center",
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
