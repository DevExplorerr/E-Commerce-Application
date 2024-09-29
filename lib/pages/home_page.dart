// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import '../carousel_slider/promo_slider.dart';
import '../header/custom_header_container.dart';
import '../pages/account_page/account_page.dart';
import '../pages/cart_page.dart';
import '../pages/favorite_page.dart';
import '../pages/product_detail_page.dart';
import '../widgets/colors.dart';
import '../models/model.dart';
import '../widgets/product_card.dart';
import '../widgets/shimmer_effect.dart';
import '../controller/product_controller.dart';
import '../controller/cart_controller.dart';
import '../widgets/cart_icon_badge.dart';
import '../app_bar/homePage_appbar.dart';
import '../header/search_container.dart';
import '../widgets/product_category_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;

  void _itemTapped(int index) {
    if (_selectedindex == index) return;
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      backgroundColor: bgColor,
      body: IndexedStack(
        index: _selectedindex,
        children: [
          Scaffold(
            body: Obx(() {
              if (productController.isLoading.value) {
                return const ShimmerEffect();
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomHeaderContainer(
                      child: Column(
                        children: [
                          SizedBox(height: 16),

                          // AppBar
                          HomeAppBar(),
                          SizedBox(height: 16),

                          // Search Bar
                          SearchContainer(text: 'Search in Store'),
                          SizedBox(height: 16),

                          // Categories
                          ProductCategoryWidget(),
                          SizedBox(height: 32),
                        ],
                      ),
                    ),

                    // Body
                    Padding(
                        padding: const EdgeInsets.all(24),
                        child: PromoSlider()),
                    const SizedBox(height: 16),

                    // All Products Gridview
                    GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: productController.allProducts.length,
                      itemBuilder: (context, index) {
                        AllProduts displayProducts =
                            productController.allProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetailScreen(
                                  productdetailpage: displayProducts,
                                ));
                          },
                          child: ProductCard(
                            product: displayProducts,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
          // Other pages without AppBar
          const FavoritePage(),
          CartPage(),
          const AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
        elevation: 14,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: CartIconWithBadge(
              height: 17,
              width: 17,
              badgeColor: yellowColor,
              textColor: blackColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedindex,
        selectedItemColor: yellowColor,
        unselectedItemColor: blackColor,
        onTap: _itemTapped,
      ),
    );
  }
}
