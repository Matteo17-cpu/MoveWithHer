import 'package:flutter/material.dart';
import 'package:workout_app/view/home/exercise_page.dart';
import 'package:workout_app/view/home/profile_page.dart';
import 'package:workout_app/view/home/start_exercise_page.dart';
class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({super.key});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: 
      Stack(
        children: [
          Positioned(child: 
          Image.asset("assets/img/backgroundkuning.png")
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, color: Colors.black),
                        Center(
                          child: const Text(
                            'Good morning, Cempaka!',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.black,
                            ),
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
                  SizedBox(height: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("DIVES", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),)
                    ],
                  ),
                  SizedBox(height: 12,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/img/dives.png")
                    ],
                  ),
                  SizedBox(height: 24,),
                  Container(
                    width: 378,
                    height: 109,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F3FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("SETS AND REPETITIONS",textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E9E5B)
                          ),
                          ),
                          Align(
                          alignment: Alignment.centerLeft,
                          child: Text("3 sets\n8-12 repetitions per set\nRest between sets: 30-60 seconds", style: TextStyle(
                            color: Color(0xFF004D66),
                            fontSize: 17,
                          ),
                          )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _featureIcon("Breathing", "assets/img/todayactivity1.png"),
                            _featureIcon("Flexibility", "assets/img/todayactivity2.png"),
                            _featureIcon("Strength", "assets/img/todayactivity3.png"),
                          ],
                        ),
                        ),    
              ],
            ),
          )
        ],
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
                  context, MaterialPageRoute(builder: (context) => ExercisePage()));
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
}

Widget _featureIcon(String label, String image, {bool highlight = false, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF9D7E33),
          ),
        ),
        Container(
          width: 114,
          height: 109,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 3),
        
      ],
    ),
  );
}