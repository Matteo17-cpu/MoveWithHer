import 'package:flutter/material.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:workout_app/common_widget/round_button.dart';
import 'package:workout_app/view/home/dashboard.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: TColor.white,
    body: SafeArea(child: 
    Container(
      width: media.width,
      padding: const EdgeInsets.symmetric(
        vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: media.width * 0.1),
            Image.asset(
                  "assets/img/SuccessRegis.png",
                  width: media.width * 0.75,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: media.width * 0.1),
                Text(
                  "Connect with HerStrap",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "You are all set now! Turn on your\nbluetooth to connect MoveWithHer\nwith HerStrap. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(height: media.width * 0.05),
                const Spacer(),

                RoundButton(
                        title: "Go To Home",
                        type: RoundButtonType.bgGradient,
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => 
                               const Dashboard()));
                        },
                      ),
          ],
        ),
        ),
        
        ),
    );
  }
}