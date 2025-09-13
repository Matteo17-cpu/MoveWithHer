import 'package:flutter/material.dart';
import 'package:workout_app/view/fitur/create_community.dart';
import 'package:workout_app/view/home/profile_page.dart';
import 'package:workout_app/view/fitur/create_community.dart';

class HerCommunity extends StatefulWidget {
  const HerCommunity({super.key});

  @override
  State<HerCommunity> createState() => _HerCommunityState();
}

class _HerCommunityState extends State<HerCommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/img/backgroundpink.png",
                fit: BoxFit.cover,
              ),
            ),
        
            SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    children: [
                      // Header
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.menu, color: Colors.black),
                            const Text(
                              'Good morning, Cempaka!',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.black,
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
        
                      const SizedBox(height: 8),
                      const Text(
                        "HERCOMMUNITIES",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
        
                      const SizedBox(height: 12),
                      _workoutItem(
                        image: "assets/img/sports.png",
                        title: "Sportunnity",
                        subtitle: "East Jakarta Sport Community ",
                      ),
                      const SizedBox(height: 8),
                      _workoutItem(
                        image: "assets/img/sports.png",
                        title: "Sportunnity",
                        subtitle: "East Jakarta Sport Community ",
                      ),
                      const SizedBox(height: 8),
                      _workoutItem(
                        image: "assets/img/sports.png",
                        title: "Sportunnity",
                        subtitle: "East Jakarta Sport Community ",
                      ),
        
                      const SizedBox(height: 100), // biar konten ga ketutupan button
                    ],
                  ),
                ),
              ),
            ),
        

            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CreateCommunity()),
                                );
                              },
                child: Container(
                  width: 363,
                  height: 51,
                  decoration: BoxDecoration(
                    color: Color(0xFFBC4B42),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "CREATE COMMUNITY",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget _workoutItem({
  required String image,
  required String title,
  required String subtitle,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 101,
                height: 68,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF765E1D),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF2F543E),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "Leave",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFFAA8932),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
