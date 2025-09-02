import 'package:flutter/material.dart';
import 'package:workout_app/view/home/profile_page.dart';

class AboutMovewithherPage extends StatelessWidget {
  const AboutMovewithherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // 👉 Background hijau full screen
            Positioned(
              child: Image.asset(
                'assets/img/linearbackground.png',
                fit: BoxFit.fill,
              ),
            ),

            // 👉 Konten utama
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, color: Colors.white),
                        const Text(
                          'Good morning, Cempaka!',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage('assets/img/img_avatar_1.png'),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // AVATAR BESAR
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/img/img_avatar_1.png'),
                  ),

                  const SizedBox(height: 16),

                  // TITLE & SUBTITLE
                  const Text(
                "MoveWithHer",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 6,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),


                  const SizedBox(height: 8),

                  const Text(
                    "Move your Body with MoveWithHer!",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(0,2),
                          blurRadius: 6,
                          color: Colors.black
                        )
                      ]
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 130),

                  // PUTIH BAWAH
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(

                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "ABOUT MoveWithHer",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Move your body with MoveWithHer! The MoveWithHer app provides a central and secure place for your health and fitness information, so it’s easily accessible and under your control.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}