import 'dart:math';
import 'package:flutter/material.dart';
import 'package:workout_app/view/fitur/workout_plan.dart';
import 'package:workout_app/view/home/start_exercise_page.dart';
import 'package:workout_app/view/home/profile_page.dart';

// Dummy User
class User {
  final String name;
  final String disability;
  final int? BPM;

  User({required this.name, required this.disability, this.BPM});
}

// Exercise Data (mirip rule_engine.js)
class Latihan {
  final String id;
  final String nama;
  final List<String> intensity;
  final List<String> classification;

  Latihan({
    required this.id,
    required this.nama,
    required this.intensity,
    required this.classification,
  });
}

final List<Latihan> latihanList = [
  Latihan(id: "SeatedToeRaises", nama: "Seated Toe Raises", intensity: ["Low"], classification: ["Diplegia"]),
  Latihan(id: "LyingLegRaises", nama: "Lying Leg Raises", intensity: ["Medium", "High"], classification: ["Diplegia"]),
  Latihan(id: "SeatedAirBoxing", nama: "Seated Air Boxing", intensity: ["Low"], classification: ["Paraplegia"]),
  Latihan(id: "SitUps", nama: "Sit-Ups", intensity: ["High"], classification: ["Paraplegia"]),
  Latihan(id: "BicycleKicks", nama: "Bicycle Kicks", intensity: ["Medium"], classification: ["Diplegia"]),
];

// Rule Engine converted to Dart
List<Latihan> rekomendasiLatihan(User user, List<Latihan> listLatihan) {
  List<String> intensitasBoleh;
  int bpm = user.BPM ?? 100;

  if (bpm > 120) {
    intensitasBoleh = ["Low"];
  } else if (bpm >= 80 && bpm <= 120) {
    intensitasBoleh = ["Low", "Medium"];
  } else {
    intensitasBoleh = ["Low", "Medium", "High"];
  }

  List<Latihan> hasil = [];
  for (var l in listLatihan) {
    if (!l.classification.contains(user.disability)) continue;
    if (!l.intensity.any((i) => intensitasBoleh.contains(i))) continue;
    hasil.add(l);
  }

  hasil.shuffle(Random());
  return hasil.take(4).toList();
}

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  bool isLoading = true;
  List<WorkoutPlan> recommendations = [];
  final User dummyUser = User(name: "Cempaka", disability: "Diplegia", BPM: 110);

  @override
  void initState() {
    super.initState();
    fetchRecommendations();
  }

  void fetchRecommendations() async {
    setState(() {
      isLoading = true;
    });

    // Pakai rule engine Dart
    final hasilLatihan = rekomendasiLatihan(dummyUser, latihanList);

    setState(() {
      recommendations = hasilLatihan.map((item) {
        return WorkoutPlan(
          title: item.nama,
          image: "assets/img/default.png",
          setsReps: "Intensity: ${item.intensity.join(', ')}",
          rest: "Rest: 60s",
          page: const Placeholder(),
        );
      }).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final weekdays = ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"];
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
                // HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, color: Colors.black),
                      Text(
                        'Good morning, ${dummyUser.name}!',
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
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

                // WORKOUT LIST
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF84A2C5)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 47,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "HERSTRAP",
                                    style: TextStyle(color: Color(0xFF27384B), fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: 27,
                                    decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 2, right: 2),
                                        child: Text(
                                          "NOT CONNECTED",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: isLoading
                                  ? const Center(child: CircularProgressIndicator())
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "$today WORKOUT",
                                          style: const TextStyle(color: Color(0xFF27384B), fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                        const SizedBox(height: 11),
                                        ...recommendations.map((rec) {
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  rec.title,
                                                  style: const TextStyle(color: Color(0xFF84A2C5), fontSize: 16, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  rec.setsReps,
                                                  style: const TextStyle(color: Color(0xFF84A2C5), fontSize: 13),
                                                ),
                                                Text(
                                                  rec.rest,
                                                  style: const TextStyle(color: Color(0xFF84A2C5), fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ],
                                    ),
                            ),
                          ),
                          SizedBox(height: 7,),
                          Container(
                            width: 368,
                            height: 146,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ADDED RECOMMENDATIONS",
                                style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold 
                                ),
                              ),
                            ),
                          )
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
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 83,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF84A2C5), Color(0xFFFFFFFF)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              if (isLoading || recommendations.isEmpty) return;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartExercisePage(workoutlist: recommendations)),
              );
            },
            child: Container(
              width: 245,
              height: 47,
              decoration: BoxDecoration(color: const Color(0xFF84A2C5), borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text("START EXERCISE", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
