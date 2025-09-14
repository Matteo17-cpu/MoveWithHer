import 'package:flutter/material.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:workout_app/common_widget/round_button.dart';
import 'package:workout_app/view/on_boarding/on_boarding_view.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangecolor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: isChangecolor
              ? LinearGradient(
                  colors: TColor.primaryG,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/img/MWH.png",
              width: 347,
              height: 347,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: TColor.black,
                ),
                children: [
                  const TextSpan(text: "MoveWith"),
                  TextSpan(
                    text: "Her",
                    style: TextStyle(color: Color(0xFFAE3838)),
                  ),
                ],
              ),
            ),
            Text(
              "Move your body with MoveWithHer",
              style: TextStyle(color: TColor.gray, fontSize: 18),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(
                  title: "Get Started",
                  type: isChangecolor
                      ? RoundButtonType.textGradient
                      : RoundButtonType.bgGradient,
                  onPressed: () {
                    if (isChangecolor) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingView(),
                        ),
                      );
                    } else {
                      setState(() {
                        isChangecolor = true;
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
