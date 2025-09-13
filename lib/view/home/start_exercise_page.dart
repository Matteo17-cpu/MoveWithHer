import 'package:flutter/material.dart';
import 'package:workout_app/view/home/profile_page.dart';
import 'package:workout_app/view/fitur/workout_plan.dart';

class StartExercisePage extends StatefulWidget {
  final List<WorkoutPlan> workoutlist;

  const StartExercisePage({super.key, required this.workoutlist});

  @override
  State<StartExercisePage> createState() => _StartExercisePageState();
}

class _StartExercisePageState extends State<StartExercisePage> {
  int currentIndex = 0;

  void goToNextExercise() {
    if (currentIndex < widget.workoutlist.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pop(context); // selesai semua latihan
    }
  }

  @override
  Widget build(BuildContext context) {
    final plan = widget.workoutlist[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ===== HEADER =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          builder: (context) => const ProfilePage(),
                        ),
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

            const SizedBox(height: 10),

            // ===== WORKOUT CONTENT =====
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Judul latihan
                    Text(
                      plan.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Dummy placeholder instead of video/image
                    Container(
                      width: 200,
                      height: 150,
                      color: const Color(0xFFE0E0E0),
                      child: const Center(
                        child: Text(
                          "Video Placeholder",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Sets & Reps + Rest
                    Text(
                      "${plan.setsReps}\n${plan.rest}",
                      style: const TextStyle(
                        color: Color(0xFF004D66),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    // Tombol Next / Finish
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E9E5B),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: goToNextExercise,
                      child: Text(
                        currentIndex < widget.workoutlist.length - 1
                            ? "Next Exercise"
                            : "Finish Workout",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
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
}
