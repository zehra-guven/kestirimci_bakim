import 'package:flutter/material.dart';
import 'package:kestirimci_bakim/shapes/oval_bottom_clipper.dart';


class AppHeader extends StatelessWidget {
  final String title;
  final Widget? actionButton;

  const AppHeader({
    super.key,
    required this.title,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 260,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // OVAL ARKA PLAN
            ClipPath(
              clipper: OvalBottomClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF6E31), Color(0xFF0099FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),

            // BAŞLIK
            Positioned(
              left: 20,
              bottom: 60,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // SAĞ ÜST BUTON
            if (actionButton != null)
              Positioned(
                right: 16,
                top: 40,
                child: actionButton!,
              ),
          ],
        ),
      ),
    );
  }
}
