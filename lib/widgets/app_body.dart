import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  final Widget child;

  const AppBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
