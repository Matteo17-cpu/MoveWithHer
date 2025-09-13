import 'package:flutter/material.dart';
import 'package:workout_app/common_widget/round_textfield.dart';
import 'package:workout_app/view/home/profile_page.dart';
class CreateCommunity extends StatefulWidget {
  const CreateCommunity({super.key});

  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/img/backgroundpink.png",
                fit: BoxFit.cover,
              ),
            ),
        
            SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    children: [
                      // Header
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
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
                                backgroundImage:
                                    AssetImage('assets/img/img_avatar_1.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
        
                      const SizedBox(height: 8),
                      const Text(
                        "CREATE COMMUNITY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RoundTextField(
                  hitText: "Insert Community Name",
                  icon: "assets/img/email.png",
                  keyboardType: TextInputType.emailAddress,
                ),

                      const SizedBox(height: 100), 
                      
                    ],
                  ),
                ),
              ),
            ),
        

            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CreateCommunity()),
                                );
                              },
                child: Container(
                  width: 363,
                  height: 51,
                  decoration: BoxDecoration(
                    color: Color(0xFFBC4B42),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "CREATE COMMUNITY",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}