import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:workout_app/common/color_extension.dart';
import 'package:workout_app/common_widget/round_button.dart';
import 'package:workout_app/common_widget/round_textfield.dart';
import 'package:workout_app/view/login/complete_profile_view.dart';
import 'package:workout_app/view/login/login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isCheck = false;
  bool isPasswordObsecured = true;
  bool isRegistering = false; // tombol disable saat async berjalan

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerAccount() async {
    if (!isCheck) return;

    setState(() => isRegistering = true);

    try {
      final response = await http.post(
        Uri.parse("https://fitness-backend-api-silk.vercel.app/api/auth/register_account"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": usernameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userId = data["user_id"];

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CompleteProfileView(userId: userId.toString()),
          ),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal register: ${response.body}")),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      if (!mounted) return;
      setState(() => isRegistering = false);
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
                Text("Hey there,", style: TextStyle(color: TColor.gray, fontSize: 16)),
                Text(
                  "Create an Account",
                  style: TextStyle(
                      color: TColor.secondaryColor2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: media.width * 0.05),

                RoundTextField(controller: usernameController, hitText: "Username", icon: "assets/img/user_text.png"),
                SizedBox(height: media.width * 0.04),
                RoundTextField(controller: emailController, hitText: "Email", icon: "assets/img/email.png", keyboardType: TextInputType.emailAddress),
                SizedBox(height: media.width * 0.04),
                RoundTextField(
                  controller: passwordController,
                  hitText: "Password",
                  icon: "assets/img/lock.png",
                  obsecureText: isPasswordObsecured,
                  rightIcon: IconButton(
                    icon: Image.asset(
                      isPasswordObsecured ? "assets/img/Hide.png" : "assets/img/Unhide_Password.png",
                      width: 20,
                      height: 20,
                      color: TColor.gray,
                    ),
                    onPressed: () {
                      setState(() => isPasswordObsecured = !isPasswordObsecured);
                    },
                  ),
                ),

                SizedBox(height: media.width * 0.04),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() => isCheck = !isCheck);
                      },
                      icon: Icon(
                        isCheck ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                        color: TColor.gray,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: TColor.gray, fontSize: 10),
                          children: [
                            const TextSpan(text: 'By continuing you accept our '),
                            TextSpan(
                              text: 'Privacy Policy ',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const TextSpan(text: 'and '),
                            TextSpan(
                              text: 'Terms of Use',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: media.width * 0.1),

                RoundButton(
                  title: isRegistering ? "Registering..." : "Register",
                  type: isCheck ? RoundButtonType.bgGradient : RoundButtonType.textGradient,
                  onPressed: isCheck && !isRegistering ? () async { await registerAccount(); } : null,
                ),

                SizedBox(height: media.width * 0.04),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: TColor.black, fontSize: 14),
                    children: [
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: TColor.secondaryColor2,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (!mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginView()),
                            );
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
