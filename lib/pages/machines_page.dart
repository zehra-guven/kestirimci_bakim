import 'package:flutter/material.dart';
import 'package:kestirimci_bakim/shapes/oval_bottom_clipper.dart';

class MachinesPage extends StatelessWidget {
  const MachinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 200;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ------------------ HEADER ------------------
            SizedBox(
              height: headerHeight,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: OvalBottomClipper(),
                    child: Container(
                      height: headerHeight,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF6E31), Color(0xFF0099FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),

                  // Başlık
                  const Positioned(
                    left: 20,
                    top: 40,
                    child: Text(
                      "Makineler",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Yeni Makine Ekle Butonu
                  Positioned(
                    top: 36,
                    right: 16,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Yeni Makine Ekle",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // --------------------------------------------------------
            // ---------------- ANLIK ÇALIŞAN MAKİNELER --------------
            // --------------------------------------------------------
            _sectionTitle("Anlık Çalışan Makineler"),

            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _liveMachineCard("Makine 1", "Çalışıyor", Colors.green),
                  _liveMachineCard("Makine 2", "Çalışıyor", Colors.green),
                  _liveMachineCard("Makine 5", "Yüksek Yük", Colors.orange),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --------------------------------------------------------
            // --------------------- TÜM MAKİNELER --------------------
            // --------------------------------------------------------
            _sectionTitle("Tüm Makineler"),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _machineCard("Asansör 1", "Son bakım: 12.11.2024"),
                  _machineCard("Asansör 2", "Son bakım: 02.11.2024"),
                  _machineCard("Asansör 3", "Son bakım: 22.10.2024"),
                  _machineCard("Asansör 4", "Son bakım: 05.10.2024"),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // -------------------- BAŞLIK TASARIMI -------------------
  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // ----------- ANLIK ÇALIŞAN MAKİNE KARTI -----------------
  Widget _liveMachineCard(String name, String status, Color color) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 40, color: color),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            status,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // --------------------- TÜM MAKİNELER --------------------
  Widget _machineCard(String name, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const Icon(Icons.build, size: 36, color: Colors.blue),
        title: Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}
