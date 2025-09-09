import 'package:flutter/material.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:workout_app/view/home/exercise_page.dart';
import 'package:workout_app/view/home/profile_page.dart';
class StartExercisePage extends StatefulWidget {
  const StartExercisePage({super.key});

  @override
  State<StartExercisePage> createState() => _StartExercisePageState();
}

class _StartExercisePageState extends State<StartExercisePage> {
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 379,
                              height: 73,
                              decoration: BoxDecoration(
                                color: Color(0xFFF6C0BA),
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Center(
                                child: Text("100 BPM", style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF7F3838)
                                ),),
                              ),
                            ),
                          ],
                        ),
              ],
            ),
          )
        ],
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