import 'package:flutter/material.dart';
import '../models/machine.dart';

class MachineDetailPage extends StatelessWidget {
  final Machine machine;

  const MachineDetailPage({
    super.key,
    required this.machine,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(machine.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Durum: ${machine.status}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text("Sağlık: %${machine.health}"),
            Text("Sıcaklık: ${machine.temp} °C"),
            Text("Hız: ${machine.speed} rpm"),
            const SizedBox(height: 16),
            Text(machine.data1),
            Text(machine.data2),
          ],
        ),
      ),
    );
  }
}
