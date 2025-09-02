import 'package:flutter/material.dart';
import 'package:workout_app/common/color_extension.dart';
import 'dashboard.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Text(
                      'Good morning, Cempaka!',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage('assets/img/img_avatar_1.png'),
                      )
                  ],
                ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF2D8659),
                        Color(0xFFFCE2B1),
                        Color(0xFFFFFFFF),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // profile image
                          ClipOval(
                            child: Image.asset(
                              'assets/img/img_avatar_1.png',
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),

                          // Name and bio
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Putu Cempaka',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: TColor.white
                                      ),
                                    ),
                                    SizedBox(width: 6,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Public',
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: TColor.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  'Disabled and #ForeverDetermined!!',
                                  style: TextStyle(color: TColor.white, fontSize: 12),
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    _buildTag('Lower limb paralysis', Colors.orange.shade400),
                                    SizedBox(width: 6,),
                                    _buildTag('badminton 🏸', Colors.redAccent),
                                  ],
                                )
                              ],
                          )
                          )
                        ],
                      ),
                      SizedBox(height: 16,),

                      // Stats Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStat('81', 'Followers'),
                          _buildStat('85', 'Following'),
                          _buildStat('3', 'Communities'),
                        ],
                      ),
                      const SizedBox(height: 16,),

                      // level progress
                      _levelProgressCard(),

                      const SizedBox(height: 16,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 47,
                          child: _tabButton("STREAK", "12 DAYS", Colors.red, Colors.green),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 137,
                          height: 47,
                          child: _tabButton("CALORIES", "11143 KAL", Colors.yellow, Colors.green),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 108,
                          height: 47,
                          child: _tabButton("TIME SPENT", "3h 45m", Colors.green.shade800, Colors.green),
                        ),
                      ],
                    ),

                      const SizedBox(height: 16,),
                      _herCommunityCard(context)
                    ],
                  ),
                ),
                const SizedBox(height: 4,),
                _buildGoalsSection(),
                const SizedBox(height: 16,),
                _buildMutualsSection(),
                const SizedBox(height: 16,),
            ],
          ),
        ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orange,
          onTap: (value){
            if(value == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()),
              );
            }
          },
          items: [
            BottomNavigationBarItem(icon: Image.asset("assets/img/ic_home.png", width: 25, height: 25,), label: ''),
            BottomNavigationBarItem(icon: Image.asset("assets/img/ic_profile.png", width: 25, height: 25,), label: ''),
            BottomNavigationBarItem(icon: Image.asset("assets/img/ic_setting.png", width: 25, height: 25,), label: ''),
          ],
        ),
    );
  }
}
Widget _buildTag(String text, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 11, color: TColor.white, fontWeight: FontWeight.w700),
    ),
  );
}
Widget _buildStat(String value, String label) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          color: TColor.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        label, // ini tadinya value, harusnya label
        style: TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
    ],
  );
}

Widget _buildStatsSection() {
  return Padding(padding: 
  const EdgeInsets.symmetric(horizontal: 16),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _statCard("STREAK", "12 Days", Colors.black87),
      _statCard("CALORIES BURNED", "1,230 kcal", Colors.green),
      _statCard("TIME SPENT", "3h 45m", Colors.blue),
    ],
  ),
  );
}
Widget _statCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
Widget _levelProgressCard(){
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFAE7CF),
            Color(0xFFF1F3FA),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Lotus image & label
          Image.asset(
            'assets/img/focus2.png',
            width: 70,
            height: 70,
          ),
          SizedBox(width: 12),

          // Texts and progress bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LEVEL 4',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Beginner',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),

              // Progress bar with gradient

            ],
          ),
          SizedBox(width: 25),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 40,
                  width: 140 * 0.7, // 70% dari lebar progress
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.yellow],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    '70%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
Widget _tabButton(String text1, String text2, Color color1, Color color2, {bool active = false}) {
    return Container(
      height: 65,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1, // Hijau terang
            color2, // Hijau tua
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text1,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 12),
          ),
          Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          )
        ],
      ),
    );
  }
  Widget _herCommunityCard(BuildContext context) {
  return Container(
    width: 375,   // set ukuran di parent
    height: 141,  // set ukuran di parent
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [
          Colors.yellow, // Warna emas di tengah
          Colors.white,  // Warna putih di luar
        ],
        center: Alignment.center,
        radius: 1.4,
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'HerCommunity',
          style: TextStyle(
            color: Colors.green.shade800,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),

        // Community Names + Avatars langsung disini
        itemCommunity(context, "HerStrong Circles"),
        SizedBox(height: 4),
        itemCommunity(context, "Jakarta Sister"),
        SizedBox(height: 4),
        itemCommunity(context, "Gen Z Moves"),
        SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [ _buildInfoBox('ACHIEVEMENTS', '11', [Colors.green, Colors.yellow]), 
          SizedBox(width: 8),
          _buildInfoBox('COMMUNITY BADGE', 'Contributor', [Colors.orangeAccent, Colors.amber]), 
          SizedBox(width: 8), _buildInfoBox('CHALLENGE', '21FitDayz', [Colors.green.shade800, Colors.yellow]), 
          ], 
          ),
      ],
    ),
  );
}

Widget _buildInfoBox(String title, String value, List<Color> gradientColors) {
    return SizedBox(
      width: 100,
      height: 0,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 10, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          _tabButtonSimple("${value}")
        ],
      ),
    );
  }
Widget itemCommunity(BuildContext context, String text){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${text}',
            style: TextStyle(
              height: 1,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = LinearGradient(
                  colors: <Color>[
                    Color(0xFFF8BC23), // Gold
                    Color(0xFF6E580B), // Light yellow
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
            ),
          ),
          Row(
            children: [
              CircleAvatar(radius: 10, backgroundColor: Colors.grey.shade300, child: Image.asset("assets/img/img_avatar_2.png"),),
              SizedBox(width: 4),
              CircleAvatar(radius: 10, backgroundColor: Colors.grey.shade300, child: Image.asset("assets/img/img_avatar_3.png")),
              SizedBox(width: 4),
              CircleAvatar(radius: 10, backgroundColor: Colors.grey.shade300, child: Image.asset("assets/img/img_avatar_4.png")),
            ],
          )
        ],
      ),
    );
  }
Widget _tabButtonSimple(String text, {bool active = false}) {
    return Container(
      height: 38,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF38A169), // Hijau terang
            Color(0xFFCB9351), // Hijau tua
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
Widget _buildGoalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Goals", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("+ Add Goal", style: TextStyle(color: Colors.green))
            ],
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _goalCard("52 kg", "Weight", Colors.redAccent),
              _goalCard("1,800 kcal", "Burned", Colors.orange),
              _goalCard("Shoulder", "Endurance", Colors.deepOrange),
              _goalCard("5h", "Time", Colors.amber),
            ],
          ),
        ),
      ],
    );
  }
Widget _goalCard(String value, String label, Color color) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFD74949),
            Color(0xFFE1A751),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
          Text(label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
Widget _buildMutualsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Mutuals", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("See More", style: TextStyle(color: Colors.green))
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(radius: 30, backgroundColor: Colors.grey.shade300, child: Image.asset("assets/img/img_avatar_2.png"),),
              SizedBox(width: 12),
              CircleAvatar(radius: 30, backgroundColor: Colors.grey.shade300, child: Image.asset("assets/img/img_avatar_3.png")),
              SizedBox(width: 12),
              CircleAvatar(radius: 30, backgroundColor: Colors.grey.shade300, child: Image.asset("assets/img/img_avatar_4.png")),
              SizedBox(width: 12),
              CircleAvatar(radius: 30, backgroundColor: Colors.grey.shade300, child: Image.asset("assets/img/img_avatar_5.png")),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(right: 6, ),
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/img/img_chatbox.png"))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("HerCommunity", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                Text("14 Unread Chats", style: TextStyle(fontSize: 16, color: Colors.brown, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
