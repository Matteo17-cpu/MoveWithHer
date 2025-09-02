import 'package:flutter/gestures.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/common_widget/round_button.dart';
import 'package:workout_app/common_widget/round_textfield.dart';
import 'package:workout_app/view/login/complete_profile_view.dart';
import 'package:workout_app/view/login/login_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isCheck = false;
  bool isPasswordObsecured = true;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerAccount() async {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:5000/register_account"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      })
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userId = data["user_id"];

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Akun berhasil dibuat! ID: $userId")),
        );

      Navigator.push(
        context, MaterialPageRoute(builder: (context) => CompleteProfileView(userId: userId)),
        );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal register: ${response.body}")),
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
                  "Create an Account",
                  style: TextStyle(
                      color: TColor.secondaryColor2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                 RoundTextField(
                  controller: usernameController,
                  hitText: "Username",
                  icon: "assets/img/user_text.png",
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                 RoundTextField(
                  controller: emailController,
                  hitText: "Email",
                  icon: "assets/img/email.png",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  controller: passwordController,
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
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: TColor.gray,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child:  RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: TColor.gray,
                            fontSize: 10,
                          ),
                          children: [
                            const TextSpan(text: 'By continuing you accept our '),
                            TextSpan(
                              text: 'Privacy Policy ',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO: Aksi saat privacy policy diklik
                                },
                            ),
                            const TextSpan(text: 'and '),
                            TextSpan(
                              text: 'Terms of Use',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO: Aksi saat privacy policy diklik
                                },
                            )
                          ]
                        ),
                          
                        ),
                     
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.4,
                ),
                RoundButton(title: "Register", 
                type: isCheck ? RoundButtonType.bgGradient : RoundButtonType.textGradient,
                onPressed: isCheck ? () async {
                  await registerAccount();
                } : null,
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
                        text: "Already have an account? ",
                      ),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: TColor.secondaryColor2,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
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