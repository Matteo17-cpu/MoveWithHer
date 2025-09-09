import 'package:flutter/material.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:workout_app/view/home/profile_page.dart';
import 'package:workout_app/view/home/start_exercise_page.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // biar gradient keliatan
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF84A2C5), // warna atas
              Color(0xFFFFFFFF), // warna bawah
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                // Card utama
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: 389,
                    height: 461,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF84A2C5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          // Header Herstrap
                          Container(
                            width: 368,
                            height: 47,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "HERSTRAP",
                                    style: TextStyle(
                                        color: Color(0xFF27384B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: 128,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF89C4A0),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Text(
                                        "CONNECTED",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          // Workout List
                          Container(
                            width: 368,
                            height: 231,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 14, top: 8),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "MONDAY WORKOUT",
                                      style: TextStyle(
                                          color: Color(0xFF27384B),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 11),
                                    Text(
                                      "Lateral Raises",
                                      style: TextStyle(
                                          color: Color(0xFF84A2C5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "3 set 10-12 repetition (0,5-2 kg)",
                                      style: TextStyle(
                                          color: Color(0xFF84A2C5),
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 9),
                                    Text(
                                      "Lateral Raises",
                                      style: TextStyle(
                                          color: Color(0xFF84A2C5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "3 set 10-12 repetition (0,5-2 kg)",
                                      style: TextStyle(
                                          color: Color(0xFF84A2C5),
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 9),
                                    Text(
                                      "Lateral Raises",
                                      style: TextStyle(
                                          color: Color(0xFF84A2C5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "3 set 10-12 repetition (0,5-2 kg)",
                                      style: TextStyle(
                                          color: Color(0xFF84A2C5),
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 9),
                                    Text(
                                      "Lateral Raises",
                                      style: TextStyle(
                                          color: Color(0xFF84A2C5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "3 set 10-12 repetition (0,5-2 kg)",
                                      style: TextStyle(
                                          color: Color(0xFF84A2C5),
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          // Recommendations
                          Container(
                            width: 368,
                            height: 146,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 14, top: 8),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "ADDED RECOMMENDATIONS",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF27384B)),
                                    ),
                                    const SizedBox(height: 2),
                                    _buildRecommendationItem(),
                                    const SizedBox(height: 8),
                                    _buildRecommendationItem(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
      Container(
          width: double.infinity,
          height: 83,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF84A2C5), // warna atas
                Color(0xFFFFFFFF), // warna bawah
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StartExercisePage()));
              },
              child: Container(
                width: 245,
                height: 47,
                decoration: BoxDecoration(
                    color: const Color(0xFF84A2C5),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    "START EXERCISE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }

  Widget _buildRecommendationItem() {
    return Container(
      width: 353,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xFFF1F3FA),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Lateral Raises",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF84A2C5)),
                ),
                Text(
                  "3 set 10-12 repetition (0,5-2 kg)",
                  style: TextStyle(color: Color(0xFF84A2C5), fontSize: 13),
                ),
              ],
            ),
            Image.asset("assets/img/removebutton.png"),
          ],
        ),
      ),
    );
  }
}
