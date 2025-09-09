
import 'package:card_stack_widget/card_stack_widget.dart';
import 'package:card_stack_widget/widget/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:workout_app/view/fitur/scan_dish.dart';
import 'package:workout_app/view/fitur/workout_recommendations.dart';
import 'package:workout_app/view/home/about_herstrap.dart';
import 'package:workout_app/view/home/about_movewithher_page.dart';
import 'package:workout_app/view/home/exercise_page.dart';
import 'package:workout_app/view/home/her_data_page.dart';
import 'package:workout_app/view/home/profile_page.dart'; 



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.menu),
                          Text(
                            'Good morning, Cempaka!', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                                );
                              },
                              child: 
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage('assets/img/cempaka.png'),
                            )
                            ),
                        ],
                      ),
                      ),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFFF8BC23),
                          Colors.white,],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: const EdgeInsets.all(16),
                          child: Text("HOME PAGE", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _tabButton(
                                "ABOUT\nMoveWithHer",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AboutMovewithherPage()),
                                  );
                                },
                              ),
                              SizedBox(width: 8),
                              _tabButton(
                                "HerData",
                                active: true,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const HerDataPage()),
                                  );
                                },
                              ),
                              SizedBox(width: 8),
                              _tabButton(
                                "ABOUT\nHerStrap",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AboutHerstrap()),
                                  );
                                },
                              ),
                            ],
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
                            
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SizedBox(height: 200,
                            child: _buildCardStackWidget(context),
                            ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFFFAE7Cf), Color(0xFFF1F3FA),],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(image: AssetImage("assets/img/Lateral_raises.png")
                                )
                              ),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Lateral Raises", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),),
                                  Text("3 set 10-12 repetition (0,5-2 kg)", style: TextStyle(color: Colors.grey),),
                                ],
                              )
                              ),
                              InkWell(
                                onTap: (){},
                                child: Image.asset("assets/img/ic_heart.png", width: 35, height: 35,),
                              )
                          ],
                        ),
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _featureIcon("HerExercise Plan", "assets/img/exercise_plan.png", onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutRecommendations()));
                              },),
                            _featureIcon("HerCycle", "assets/img/menstrual_tracker.png"),
                            _featureIcon("HerDiet", "assets/img/diet.png"),
                          ],
                        ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _featureIcon("Scan HerDish", "assets/img/scan_dish.png", onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ScanDish()));
                              },),
                              _featureIcon("Her Community", "assets/img/hercommunity.png",),
                              _featureIcon("HerProgress", "assets/img/herprogress.png",)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            image: DecorationImage(fit: 
                            BoxFit.fill,
                            image: AssetImage("assets/img/img_chatbox.png"))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("HerChatBot", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                              Text("14 Unread Chats", style: TextStyle(fontSize: 16, color: Colors.brown, fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ),
                        SizedBox(height: 220,)
                  ],
                ),
              )
              ),
              ],
              )
              ),
              bottomNavigationBar: Container(
              width: 442,
              height: 83,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF84A2C5), 
                    Color(0xFFFFFFFF), 
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(   

                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => ExercisePage(),));
                  },
                  child: Container(
                    width: 245,
                    height: 47,
                    decoration: BoxDecoration(
                      color: Color(0xFF84A2C5),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text(
                        "LET’S EXERCISE", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

    );
  }
}
Widget _buildCounter() {
  return Container(
    width: 90,
    height: 36,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(colors: [Color(0xFFE3F0FF), Color(0xFFB6D9F7)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _roundIconButton(Icons.remove),
        _roundIconButton(Icons.add),
      ],
    ),
  );
}

Widget _roundIconButton(IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: CircleAvatar(
      radius: 12,
      backgroundColor: Colors.white,
      child: Icon(
        icon, 
        size: 16,
        color: Colors.blueGrey.shade400,
        ),
    ),
    );
}




Widget _tabButton(String text, {bool active = false, VoidCallback? onTap}) {
  List<String> lines = text.split('\n');

  return GestureDetector(
    onTap: onTap, // dipanggil saat tombol ditekan
    child: Container(
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF2E9E5B),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: lines.length == 1
              ? [
                  TextSpan(
                    text: lines[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ]
              : [
                  TextSpan(
                    text: lines[0] + "\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: lines[1],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
        ),
      ),
    ),
  );
}


List<CardModel> _buildMockList(BuildContext context, {int size = 0}) {
  final double containerWidth = MediaQuery.of(context).size.width - 32;

  var list = <CardModel>[];
  var listColor = [Color(0xFFF8BC23), Color(0xFFEF3423), Color(0xFF2E9E5B)];
  var textColor = [Color(0xFF806B34), Color(0xFFFFB8B1), Color(0xFF062412)];
  var communityColor = [Color(0xFF2E9E5B), Color(0xFFF8BC23), Color(0xFFFFFFFF)];

  for (int i = 0; i < size; i++) {
    var color = listColor[i % listColor.length];
    var fontColor = textColor[i % textColor.length];
    var headercolor = textColor[i % communityColor.length];
    list.add(
      CardModel(
        gradient: LinearGradient(
          colors: [color, color],
          // center: Alignment.center,
          // radius: 1.4,
        ),
        radius: Radius.circular(12),
        shadowColor: Colors.black.withOpacity(0.2),
        child: SizedBox(
          height: 150,
          width: containerWidth,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // KIRI: INFO
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HerCommunity",
                        style: TextStyle(
                          fontSize: 14,
                          color: headercolor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Exercise at\nBenings',
                        style: TextStyle(
                          height: 1,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: fontColor
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "8:00 AM - 1:30 PM",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 0),
                      // Avatar Row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final path in [
                              "assets/img/bening.png",
                              "assets/img/Avatar.png",
                              "assets/img/afif.png",
                              "assets/img/cempaka.png",
                            ])
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey.shade300,
                                  backgroundImage: AssetImage(path),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 8),

                // TENGAH: GAMBAR
                Container(
                  width: 80,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/img/lapsat.png"),
                    ),
                  ),
                ),

                SizedBox(width: 8),

                // KANAN: NOTES
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 80,
                  height: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NOTES",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  return list;
}

Widget _featureIcon(String label, String image, {bool highlight = false, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11,
            color: highlight ? Colors.orange : Colors.black,
          ),
        ),
      ],
    ),
  );
}


CardStackWidget _buildCardStackWidget(BuildContext context) {
  final mockList = _buildMockList(context, size: 3);

  return CardStackWidget(
    // opacityChangeOnDrag: true,
    swipeOrientation: CardOrientation.both,
    cardDismissOrientation: CardOrientation.both,
    positionFactor: 0.6,
    scaleFactor: 0.5,
    alignment: Alignment.center,
    reverseOrder: false,
    animateCardScale: true,
    dismissedCardDuration: const Duration(milliseconds: 150),
    cardList: mockList,


  );
}


