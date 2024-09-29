import 'package:flutter/material.dart';
import 'custom_curved_edges.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedEdges(), child: child);
  }
}
