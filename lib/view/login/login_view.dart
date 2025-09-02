import 'package:flutter/gestures.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/common_widget/round_button.dart';
import 'package:workout_app/common_widget/round_textfield.dart';
import 'package:workout_app/view/login/complete_profile_view.dart';
import 'package:workout_app/view/login/signup_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isCheck = false;
  bool isPasswordObsecured = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final Response = await http.post(
      Uri.parse("http://127.0.0.1:5000/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );
    if (Response.statusCode == 200) {
      final data = jsonDecode(Response.body);
      final userId = data["user_id"];

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login berhasil! ID: $userId")),
      );

      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => CompleteProfileView(userId: userId),),
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login gagal: ${Response.body}"))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hey there,",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: TColor.secondaryColor2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                const RoundTextField(
                  hitText: "Email",
                  icon: "assets/img/email.png",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hitText: "Password",
                  icon: "assets/img/lock.png",
                  obsecureText: isPasswordObsecured,
                  rightIcon: IconButton(
                    icon: Image.asset(
                      isPasswordObsecured
                      ? "assets/img/Hide.png"
                      : "assets/img/Unhide_Password.png",
                      width: 20,
                      height: 20,
                      color: TColor.gray,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordObsecured = !isPasswordObsecured;
                      });
                    },
                  ),
                ),
                Align(
  alignment: Alignment.center,
  child: Padding(
    padding: const EdgeInsets.only(top: 8),
    child: RichText(
      text: TextSpan(
        text: "Forgot your password?",
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontSize: 12,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            // TODO: Aksi saat forgot password diklik
            // Misalnya: buka halaman reset password atau tampilkan dialog
          },
      ),
    ),
  ),
),
                SizedBox(
                  height: media.width * 0.4,
                ),
                RoundButton(title: "Login", 
                type: isCheck ? RoundButtonType.bgGradient : RoundButtonType.textGradient,
                onPressed: isCheck ? () async {
                  await login();
                }
                :null,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: TColor.gray.withOpacity(0.5),
                    )),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: TColor.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: TColor.gray.withOpacity(0.5),
                    )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/Google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),

                     SizedBox(
                      width: media.width * 0.04,
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/Facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/WhatsApp.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 14,
                    ),
                    children: [
                      const TextSpan(
                        text: "Don’t have an account yet? ",
                      ),
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: TColor.secondaryColor2,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
                          },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: media.width * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}