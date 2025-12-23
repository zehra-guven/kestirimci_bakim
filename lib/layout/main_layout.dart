import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:kestirimci_bakim/pages/home_page.dart';
import 'package:kestirimci_bakim/pages/machines_page.dart';
import 'package:kestirimci_bakim/pages/profile_page.dart';
import 'package:kestirimci_bakim/pages/maintenancePage.dart';

class MainLayout extends StatefulWidget {
  final String? pageRequest;
  const MainLayout({super.key, this.pageRequest});

  /// ---- ÖNEMLİ: goToTab METODU BURADA OLMALI ----
  static void goToTab(BuildContext context, String tab) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainLayout(pageRequest: tab)),
    );
  }

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    MachinesPage(),
    MaintenancePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();

    if (widget.pageRequest == "machines") {
      _selectedIndex = 1;
    } else if (widget.pageRequest == "maintenance") {
      _selectedIndex = 2;
    } else if (widget.pageRequest == "profile") {
      _selectedIndex = 3;
    } else {
      _selectedIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: const Color(0xFF0099FF),
        activeColor: Colors.white,
        items: const [
          TabItem(icon: Icons.dashboard, title: "Panel"),
          TabItem(icon: Icons.precision_manufacturing, title: "Makineler"),
          TabItem(icon: Icons.warning_amber_rounded, title: "Bakımlar"),
          TabItem(icon: Icons.person, title: "Profil"),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
