import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kestirimci_bakim/widgets/app_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool editMode = false;

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController companyCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    nameCtrl.text = prefs.getString("name") ?? "Zehra Güven";
    emailCtrl.text = prefs.getString("email") ?? "zehra@example.com";
    companyCtrl.text = prefs.getString("company") ?? "XYZ Asansör Teknolojileri";
  }

  Future<void> saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", nameCtrl.text);
    await prefs.setString("email", emailCtrl.text);
    await prefs.setString("company", companyCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 50;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ------------------ ORTAK HEADER --------------------
          AppHeader(
            title: "Profil",
            actionButton: IconButton(
              icon: Icon(
                editMode ? Icons.check : Icons.edit,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () async {
                if (editMode) {
                  await saveProfileData();
                }
                setState(() => editMode = !editMode);
              },
            ),
          ),

          // ------------------ PROFIL FOTO ---------------------
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: avatarRadius - 3,
                      backgroundImage:
                          const AssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),

          // ------------------ FORM ------------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("Ad Soyad"),
                  _input(nameCtrl),

                  const SizedBox(height: 20),

                  _label("E-posta"),
                  _input(emailCtrl),

                  const SizedBox(height: 20),

                  _label("Firma"),
                  _input(companyCtrl),

                  const SizedBox(height: 40),
  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 20, 37, 160),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "İşlemlerim",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Şifremi Unuttum",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Çıkış Yap",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- LABEL -----------------
  Widget _label(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      );

  // ---------------- INPUT -----------------
  Widget _input(TextEditingController controller) {
    return TextField(
      controller: controller,
      enabled: editMode,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: editMode ? Colors.white : Colors.grey.shade100,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),

        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}
