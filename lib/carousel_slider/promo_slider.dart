import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/carousel_slider/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../header/circular_container.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sliderController = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, _) =>
                sliderController.updatePageIndicator(index),
            viewportFraction: 1,
          ),
          items: [
            RoundedImage(imageUrl: 'assets/promo-banner/promo-banner-1.png'),
            RoundedImage(imageUrl: 'assets/promo-banner/promo-banner-2.png'),
            RoundedImage(imageUrl: 'assets/promo-banner/promo-banner-3.png'),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: Obx(
            () => Row(mainAxisSize: MainAxisSize.min, children: [
              for (int i = 0; i < 3; i++)
                CircularContainer(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColor: sliderController.carouselCurrentIndex == i
                        ? Color(0xFF4b68ff)
                        : Color(0xFFE0E0E0))
            ]),
          ),
        )
      ],
    );
  }
}
