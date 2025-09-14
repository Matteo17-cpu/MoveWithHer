import 'package:flutter/material.dart';
import 'package:workout_app/view/home/profile_page.dart';
class HerCycle extends StatefulWidget {
  const HerCycle({super.key});

  @override
  State<HerCycle> createState() => _HerCycleState();
}

class _HerCycleState extends State<HerCycle> {
  String username = "User";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset("assets/img/backgroundmenstrual.png", fit: BoxFit.cover,)
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
                          backgroundImage:
                              AssetImage('assets/img/img_avatar_1.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    width: 382,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFF15A24),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text(
                        "JULY 9", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    dayText("S", "6"),
                    dayText("M", "7"),
                    dayText("T", "8"),
                    dayText("TODAY", "9"),
                    dayText("T", "10"),
                    dayText("F", "11"),
                    dayText("S", "12"),
                  ],
                ),
                SizedBox(height: 21,),
                Center(
                  child: Text(
                    "Period in", style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Center(
                  child: Text(
                    "2 DAYS", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50
                    ),
                  ),
                ),
                Container(
                  width: 138,
                  height: 31,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF3C7553), Color(0xFFE8BA28)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("VIEW CALENDAR", style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 31,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Today's Phase", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13, top: 4),
                  child: Container(
                    width: 388,
                    height: 166,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "FOLLICULAR PHASE", style: TextStyle(
                                color: Color(0xFF5B080E),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("Energy and strength usually\nincrease, making it a good time\nfor challenging workouts.\nHormonal balance can also\nboost mood and motivation to\nexercise.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF80282F),
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Image.asset("assets/img/follicularphase.png")
                              ],
                            ),      
                            ],
                        ),
                      ),
                  ),
                ),
                SizedBox(height: 9,),
                Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                phaseItem("Head Aches", "assets/img/headaches.png"),
                                phaseItem("Mood Swings", "assets/img/moodswings1.png"),
                                phaseItem("Acne", "assets/img/acne.png")
                              ],
                            ),
                            SizedBox(height: 100,)

                  ],
                ),
              )
          ],
        )),
    );
  }
}
Widget dayText(String day, String value) {
  return Column(
    children: [
      Text(day, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
      Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
    ],
  );
}
Widget phaseItem(String title, String iconPath) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white, 
        ),
        textAlign: TextAlign.center,
      ),
      Image.asset(
        iconPath,
        width: 127,
        height: 159,
      ),
    ],
  );
}
