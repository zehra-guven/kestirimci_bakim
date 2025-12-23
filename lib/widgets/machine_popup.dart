import 'package:flutter/material.dart';
import '../models/machine.dart';

void showMachinePopup(BuildContext context, Machine machine) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    machine.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("Durum: ${machine.status}"),
                  Text("Sağlık: ${machine.health}%"),
                  Text("Sıcaklık: ${machine.temp}°C"),
                  Text("Hız: ${machine.speed} rpm"),
                ],
              ),
            ),

            // ❌ KAPATMA TUŞU
            Positioned(
              right: 6,
              top: 6,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      );
    },
  );
}
