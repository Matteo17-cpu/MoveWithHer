import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workout_app/view/fitur/workout_details.dart';
import 'package:workout_app/view/home/profile_page.dart';

class WorkoutRecommendations extends StatefulWidget {
  const WorkoutRecommendations({super.key});

  @override
  State<WorkoutRecommendations> createState() => _WorkoutRecommendationsState();
}

class _WorkoutRecommendationsState extends State<WorkoutRecommendations> {
  List<dynamic> recommendations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecommendations();
  }

  Future<void> fetchRecommendations() async {
    try {
      final response = await http.post(
        Uri.parse("https://fitness-backend-api-silk.vercel.app/api/recommendation"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "user": "Rina",
          "disability": "Diplegia",
          "BPM": 130,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          recommendations = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        print("Failed: ${response.body}");
        setState(() => isLoading = false);
      }
    } catch (e) {
      print("Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/img/recommendationbackground.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
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
                              MaterialPageRoute(builder: (context) => const ProfilePage()),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage('assets/img/img_avatar_1.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Title
                    Center(
                      child: Text(
                        "WORKOUT RECOMMENDATIONS",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Content
                    if (isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (recommendations.isEmpty)
                      const Center(child: Text("No recommendations found"))
                    else
                      Column(
                        children: recommendations.map((rec) {
                          return _workoutItem(
                            image: "assets/img/Lateral_raises.png",
                            title: rec["nama"] ?? "Unknown",
                            subtitle:
                                "Intensity: ${rec["intensity"] ?? "-"} | For: ${rec["classification"].join(", ")}",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WorkoutDetails(),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _workoutItem({
    required String image,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F3FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image, width: 101, height: 68),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E9E5B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF84A2C5),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Remove clicked");
                },
                child: Image.asset(
                  "assets/img/removebutton.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
