import 'package:flutter/material.dart';
import 'package:workout_app/view/fitur/food_detail.dart';
import 'package:workout_app/view/home/profile_page.dart';

class HerDiet extends StatefulWidget {
  const HerDiet({super.key});

  @override
  State<HerDiet> createState() => _HerDietState();
}

class _HerDietState extends State<HerDiet> {
  String username = "User";

  Widget _foodRecommendation({
  required String title,
  required String kcal,
  required String imagePath,
   VoidCallback? onTap, // tambah parameter onTap
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFAE7Cf), Color(0xFFF1F3FA)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 101,
            height: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  kcal,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/img/ic_heart.png",
              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/backgrounddiet.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, color: Colors.white),
                      Text(
                        'Good morning, $username!',
                        style: const TextStyle(
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
                          radius: 16,
                          backgroundImage:
                              AssetImage('assets/img/cempaka.png'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 4),

                Center(
                  child: Text(
                    'Monday',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 389,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6563C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "BREAKFAST",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _foodRecommendation(
                          title: "Oatmeal Banana",
                          kcal: "300 kcal",
                          imagePath: "assets/img/food1.png",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetail()));
                          },
                        ),
                        const Text(
                          "LUNCH",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _foodRecommendation(
                          title: "Brown Rice",
                          kcal: "600 kcal",
                          imagePath: "assets/img/food2.png",
                        ),
                        const Text(
                          "SNACK",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _foodRecommendation(
                          title: "Plain Yogurt",
                          kcal: "150 kcal",
                          imagePath: "assets/img/food3.png",
                        ),
                        const Text(
                          "DINNER",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _foodRecommendation(
                          title: "Grilled Salmon",
                          kcal: "550-600 kcal",
                          imagePath: "assets/img/food4.png",
                        ),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    'Tuesday',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 389,
                    decoration: BoxDecoration(
                      color: const Color(0xFF58896B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "BREAKFAST",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _foodRecommendation(
                          title: "Oatmeal Banana",
                          kcal: "300 kcal",
                          imagePath: "assets/img/food1.png",
                        ),
                        const Text(
                          "LUNCH",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _foodRecommendation(
                          title: "Brown Rice",
                          kcal: "600 kcal",
                          imagePath: "assets/img/food2.png",
                        ),
                        const Text(
                          "SNACK",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _foodRecommendation(
                          title: "Plain Yogurt",
                          kcal: "150 kcal",
                          imagePath: "assets/img/food3.png",
                        ),
                        const Text(
                          "DINNER",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _foodRecommendation(
                          title: "Grilled Salmon",
                          kcal: "550-600 kcal",
                          imagePath: "assets/img/food4.png",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
