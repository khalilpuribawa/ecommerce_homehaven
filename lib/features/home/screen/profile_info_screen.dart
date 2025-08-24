import 'package:ecommerce_homehaven/features/home/model/user_model.dart';
import 'package:flutter/material.dart';

// Kelas AppColors, untuk warna custom
class AppColors {
  AppColors._();
  static const Color primary = Color(0xFF156651);
  static const Color primaryVariant = Color(0xFF115543);
}

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy jika user tidak ada, untuk testing
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    final String userName = user?.name ?? "Claire Cooper";
    final String userEmail = user?.email ?? "claire.cooper@mail.com";

    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Header dengan Latar Belakang Gradient
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryVariant],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 60, left: 20),
                      child: Text(
                        "My Account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50, right: 10),
                      child: IconButton(
                        icon: const Icon(Icons.notifications_none, color: Colors.white, size: 30),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Kartu Profil
            Transform.translate(
              offset: const Offset(0, -70),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/profile_image.jpg"), // Pastikan gambar ini ada
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userEmail,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.edit_outlined, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Bagian Menu "General"
            Transform.translate(
              offset: const Offset(0, -70),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "General",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Tombol Transaksi
                    _buildMenuItem(
                      icon: Icons.receipt_long_outlined,
                      title: "Transaction",
                      onTap: () {
                        // Aksi saat tombol ditekan
                      },
                    ),

                    // Contoh tombol lain (bisa dihilangkan jika tidak perlu)
                    _buildMenuItem(
                      icon: Icons.favorite_border,
                      title: "Wishlist",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.bookmark_border,
                      title: "Saved Address",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.credit_card_outlined,
                      title: "Payment Methods",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.notifications_none,
                      title: "Notification",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.lock_outlined,
                      title: "Security",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk membuat item menu
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}