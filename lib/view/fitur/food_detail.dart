import 'package:flutter/material.dart';
import 'package:workout_app/view/home/profile_page.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  String username = "User";
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
                    'Oatmeal With Banana Slices',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 24),
                  child: Image.asset("assets/img/bigfood1.png",),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 20),
                    child: Container(
                      width: 378,
                      height: 66,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5C034),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, top: 16, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Calories", style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10, top: 3),
                              child: Text("300 kcal", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF004D66)
                              ),),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 378,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F3FA),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         RichText(
  text: TextSpan(
    style: const TextStyle(
      color: Color(0xFF004D66),
      fontSize: 17,
    ),
    children: [
      const TextSpan(
        text: "Ingredients (1 serving:)\n",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const TextSpan(text: "• 50 g (about ½ cup) rolled oats\n"),
      const TextSpan(text: "• 200 ml low-fat milk or water (you can mix both)\n"),
      const TextSpan(text: "• 1 medium ripe banana, sliced\n"),
      const TextSpan(text: "• 1 tsp honey or cinnamon (optional, for sweetness/flavor)\n"),
      const TextSpan(text: "• A pinch of salt (optional)"),
    ],
  ),
),
RichText(
  text: TextSpan(
    style: const TextStyle(
      color: Color(0xFF004D66),
      fontSize: 17,
    ),
    children: [
      const TextSpan(
        text: "How to Make:\n",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const TextSpan(text: "1. In a small pot, bring the milk or water to a gentle boil.\n"),
      const TextSpan(text: "2. Add the oats and stir occasionally. Cook for 3–5 minutes until it thickens.\n"),
      const TextSpan(text: "3. Slice the banana and place it on top (you can mash half the banana into the oats for natural sweetness).\n"),
      const TextSpan(text: "4. Add honey or a sprinkle of cinnamon if you like extra flavor.\n"),
      const TextSpan(text: "5. Serve Warm"),
    ],
  ),
)
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