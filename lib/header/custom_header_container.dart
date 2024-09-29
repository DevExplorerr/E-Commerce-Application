import 'package:flutter/material.dart';
import 'custom_clip_path.dart';
import 'circular_container.dart';
import '../widgets/colors.dart';

class CustomHeaderContainer extends StatelessWidget {
  const CustomHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomClipPath(
      child: Container(
        color: blueColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: bgColor.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: bgColor.withOpacity(0.1),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
