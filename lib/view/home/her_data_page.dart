import 'package:flutter/material.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:workout_app/view/home/profile_page.dart';

class HerDataPage extends StatelessWidget {
  const HerDataPage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/linearbackground3.png',
              fit: BoxFit.cover,
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
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
                              builder: (context) => const ProfilePage(),
                            ),
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
                Text("HerData", style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
                ),
                Padding(
                            padding: const EdgeInsets.all(16),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(fontSize: 14),
                                prefixIcon: Icon(Icons.search, size: 20,),
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),
                                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            
                            ),
                            Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _featureIcon("MAIN", "assets/img/maindata.png"),
                            _featureIcon("COMMUNITY", "assets/img/communitydata.png"),
                            _featureIcon("EXERCISE", "assets/img/exercisedata.png"),
                          ],
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _featureIcon("DIET", "assets/img/dietdata.png"),
                              const SizedBox(width: 37,),
                              _featureIcon("MENSTRUAL", "assets/img/menstrualdata.png")
                            ],
                          ),
                        ),
                        const SizedBox(height: 38,),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("ABOUT HerData",
                            style: TextStyle(
                              fontSize:24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white 
                            ),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("HerData will help you reach your fitness goals. Log\nin your progress today.  ",
                            style: TextStyle(
                              fontSize:12,
                              color: Colors.white 
                            ),),
                          ),
                        ),
                        SizedBox(height: 500,)
                            
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}
Widget _featureIcon(String label, String image, {bool highlight = false, VoidCallback? onTap}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      GestureDetector(
        onTap: onTap, 
        child: Container(
          width: 100,
          height: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      const SizedBox(height: 3),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    ],
  );
}

