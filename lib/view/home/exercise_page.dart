import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workout_app/view/fitur/workout_plan.dart';
import 'package:workout_app/view/home/start_exercise_page.dart';
import 'package:workout_app/view/home/profile_page.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  bool isLoading = true;
  List<WorkoutPlan> recommendations = [];

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
          "user": "Cempaka",
          "disability": "Diplegia",
          "BPM": 120,
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        setState(() {
          recommendations = data.map((item) {
            return WorkoutPlan(
              title: item['nama'] ?? "Untitled",
              image: "assets/img/default.png",
              setsReps: "Intensity: ${item['intensity'] ?? 'Medium'}",
              rest: "Rest: 60s",
              page: const Placeholder(),
            );
          }).toList();
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load recommendations");
      }
    } catch (e) {
      debugPrint("Error fetching recommendations: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final weekdays = [
      "MONDAY",
      "TUESDAY",
      "WEDNESDAY",
      "THURSDAY",
      "FRIDAY",
      "SATURDAY",
      "SUNDAY"
    ];
    final today = weekdays[now.weekday - 1];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF84A2C5), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== HEADER =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                          backgroundImage: AssetImage('assets/img/img_avatar_1.png'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // ===== WORKOUT LIST CONTAINER =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF84A2C5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Herstrap (statis)
                          Container(
                            width: double.infinity,
                            height: 47,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "HERSTRAP",
                                    style: TextStyle(
                                      color: Color(0xFF27384B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 128,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF89C4A0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "CONNECTED",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 7),

                          // Today Workout List
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: isLoading
                                  ? const Center(child: CircularProgressIndicator())
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "$today WORKOUT",
                                          style: const TextStyle(
                                            color: Color(0xFF27384B),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 11),

                                        // Loop rekomendasi langsung Text aja
                                        ...recommendations.map((rec) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(bottom: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  rec.title,
                                                  style: const TextStyle(
                                                    color: Color(0xFF84A2C5),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  rec.setsReps,
                                                  style: const TextStyle(
                                                    color: Color(0xFF84A2C5),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Text(
                                                  rec.rest,
                                                  style: const TextStyle(
                                                    color: Color(0xFF84A2C5),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ],
                                    ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Added Recommendations placeholder
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(14),
                              child: Text(
                                "ADDED RECOMMENDATIONS",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF27384B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ===== BOTTOM START BUTTON =====
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 83,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF84A2C5), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              if (isLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Please wait... still loading workouts")),
                );
                return;
              }
              if (recommendations.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("No workouts available today")),
                );
                return;
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StartExercisePage(workoutlist: recommendations),
                ),
              );
            },
            child: Container(
              width: 245,
              height: 47,
              decoration: BoxDecoration(
                color: const Color(0xFF84A2C5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "START EXERCISE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
