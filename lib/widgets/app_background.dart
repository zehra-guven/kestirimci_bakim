import 'package:flutter/material.dart';
import 'package:kestirimci_bakim/shapes/oval_bottom_clipper.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: OvalBottomClipper(),
          child: Container(
            height: 260, // yüksekliği buradan ayarlayabilirsin
            color: const Color(0xff5A69FE),
          ),
        ),

        // Sayfa içeriği
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ],
    );
  }
}
