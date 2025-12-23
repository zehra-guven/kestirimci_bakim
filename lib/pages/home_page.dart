import 'package:flutter/material.dart';
import 'package:kestirimci_bakim/layout/main_layout.dart';
import 'package:kestirimci_bakim/pages/machine_detail_page.dart';
import 'package:kestirimci_bakim/shapes/oval_bottom_clipper.dart';
import 'package:kestirimci_bakim/widgets/machine_card.dart';
import 'package:kestirimci_bakim/widgets/warning_card.dart';
import 'package:kestirimci_bakim/data/machine_data.dart';
import 'package:kestirimci_bakim/data/warning_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // -----------------------------------------------------------
          // HEADER
          // -----------------------------------------------------------
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
                clipper: OvalBottomClipper(),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF6E31), Color(0xFF0099FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 60),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Kestirimci Bakım Paneli\nHoşgeldiniz!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // -----------------------------------------------------------
          // ANLIK ÇALIŞAN MAKİNELER
          // -----------------------------------------------------------
         SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Anlık Çalışan Makineler",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
  onTap: () {
    MainLayout.goToTab(context, "machines");
  },
  child: Row(
    children: const [
      Text(
        "Tümünü Göster",
        style: TextStyle(
          fontSize: 10,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(width: 4),
      Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.blue,
      ),
    ],
  ),
)

      ],
    ),
  ),
),

          // -----------------------------------------------------------
          // MAKİNE KARTLARI (MAX 2)
          // -----------------------------------------------------------
      SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) {
      final machine = machines[index];

      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MachineDetailPage(machine: machine),
            ),
          );
        },
        child: MachineCard(machine: machine),
      );
    },
    childCount: machines.length,
  ),
),


          // ==============================
          // 📌 UYARILAR
          // ==============================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Uyarılar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                 
                ],
              ),
            ),
          ),//uyarılar başlığı ekledim
SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) {
      final warning = warnings[index];
      final machine = getMachineById(warning.machineId);

      if (machine == null) {
        return const SizedBox.shrink();
      }

      return WarningCard(
        warning: warning,
        machineName: machine.name,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MachineDetailPage(machine: machine),
            ),
          );
        },
      );
    },
    childCount: warnings.length,
  ),
),

//uyarılar başlığı altına uyarı kartlarını koydum
          
        ],
      ),
    );

          
  }
}

// anasayfada aşşağı doğru kaydırınca yukarıdakı oval yapı bozuluyor zeynooo
//profilde bilgileri girince bilgi kaydedilmiyor