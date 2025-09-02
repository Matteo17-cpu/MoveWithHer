import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'profile_page.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  List<dynamic> rekomendasi = [];
  bool loading = true;

  final String apiUrl = "http://127.0.0.1:5000/rekomendasi";

  @override
  void initState() {
    super.initState();
    fetchRekomendasi();
  }

  Future<void> fetchRekomendasi() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "id": "user_001",
          "disabilitas": "Paraplegia",
          "BPM": 98,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          rekomendasi = jsonDecode(response.body);
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== HEADER dari Dashboard =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  const Text(
                    'Good morning, Cempaka!',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/img/cempaka.png'),
                    ),
                  ),
                ],
              ),
            ),

            // ===== REKOMENDASI LATIHAN =====
            Expanded(
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : rekomendasi.isEmpty
                      ? const Center(
                          child: Text("Anda tidak disarankan untuk latihan hari ini."),
                        )
                      : ListView.builder(
                          itemCount: rekomendasi.length,
                          itemBuilder: (context, index) {
                            final item = rekomendasi[index];
                            final intensities = item["intensity"] is List
                                ? (item["intensity"] as List).join(", ")
                                : item["intensity"];

                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFFAE7CF), Color(0xFFF1F3FA)],
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
                                    width: 80,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: AssetImage("assets/img/Lateral_raises.png"),
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
                                          item["nama"],
                                          style: const TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 4),
                                        Text("Intensitas: $intensities"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
