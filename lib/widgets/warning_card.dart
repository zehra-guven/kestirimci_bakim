import 'package:flutter/material.dart';
import 'package:kestirimci_bakim/models/warning.dart';

class WarningCard extends StatelessWidget {
  final Warning warning;
  final VoidCallback? onTap;

  const WarningCard({
    super.key,
    required this.warning,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                warning.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 4),
              Text(warning.description),
            ],
          ),
        ),
      ),
    );
  }
}
