import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_body.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppHeader(
            title: "Bakımlar",
           
          ),
          const AppBody(
            child: Text(
              "Bakım sayfası içeriği",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
