import 'package:flutter/material.dart';
import 'package:kestirimci_bakim/models/machine.dart';

class MachineCard extends StatelessWidget {
  final Machine machine;
  final VoidCallback? onTap; // popup için callback

  const MachineCard({
    super.key,
    required this.machine,
    this.onTap,
  });

  Color getStatusColor() {
    return machine.status == "Kritik" ? Colors.red : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // popup çağıran yer
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(
              Icons.precision_manufacturing,
              size: 32,
              color: Colors.blue.shade600,
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Üst satır: isim + durum
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        machine.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        machine.status,
                        style: TextStyle(
                          color: getStatusColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  LinearProgressIndicator(
                    value: machine.health / 100,
                    color: getStatusColor(),
                    backgroundColor: Colors.grey[200],
                    minHeight: 4,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Sağlık: ${machine.health}% | "
                    "Sıcaklık: ${machine.temp}°C | "
                    "Hız: ${machine.speed} rpm",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
