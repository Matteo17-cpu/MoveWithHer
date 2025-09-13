import 'package:flutter/services.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/view/login/what_your_goal_view.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key, required this.userId});
  final String userId; // ganti ke String biar fleksibel

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  List<String> disabilityOptions = [
    "Monoplegia",
    "Quadriplegia",
    "Diplegia",
    "Paraplegia",
    "None"
  ];

  TextEditingController txtDate = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtHeight = TextEditingController();
  TextEditingController txtDisability = TextEditingController();

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        // format ISO biar konsisten ke backend
        txtDate.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> submitProfile() async {
    if (txtDate.text.isEmpty ||
        txtWeight.text.isEmpty ||
        txtHeight.text.isEmpty ||
        txtDisability.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all fields")),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse("https://fitness-backend-api-silk.vercel.app/api/auth/register_profile"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "user_id": widget.userId,
          "dob": txtDate.text,
          "weight": int.tryParse(txtWeight.text) ?? 0,
          "height": int.tryParse(txtHeight.text) ?? 0,
          "disability": txtDisability.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("✅ Profile saved: $data");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile berhasil disimpan!")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WhatYourGoalView()),
        );
      } else {
        print("❌ Failed: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: ${response.body}")),
        );
      }
    } catch (e) {
      print("⚠️ Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
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
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/img/Register.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: media.width * 0.05),
                Text(
                  "Let’s complete your profile",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(height: media.width * 0.05),

                /// Form
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      /// Date of Birth
                      RoundTextField(
                        controller: txtDate,
                        hitText: "Date of Birth",
                        icon: "assets/img/Calendar.png",
                        readOnly: true,
                        onTap: selectDate,
                      ),
                      SizedBox(height: media.width * 0.04),

                      /// Weight
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtWeight,
                              hitText: "Your Weight",
                              icon: "assets/img/WeightScale.png",
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          _unitBox("KG"),
                        ],
                      ),
                      SizedBox(height: media.width * 0.04),

                      /// Height
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtHeight,
                              hitText: "Your Height",
                              icon: "assets/img/Swap.png",
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          _unitBox("CM"),
                        ],
                      ),
                      SizedBox(height: media.width * 0.04),

                      /// Disabilities
                      RoundTextField(
                        controller: txtDisability,
                        hitText: "Disabilities",
                        icon: "assets/img/Disability.png",
                        readOnly: true,
                        rightIcon: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (BuildContext context) {
                                return ListView.builder(
                                  itemCount: disabilityOptions.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        disabilityOptions[index],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          txtDisability.text =
                                              disabilityOptions[index];
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "assets/img/dropdown.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                              color: TColor.secondaryColor2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: media.width * 0.07),

                      /// Button
                      RoundButton(
                        title: "Next",
                        type: RoundButtonType.bgGradient,
                        onPressed: submitProfile,
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

  /// Widget helper untuk box unit (KG / CM)
  Widget _unitBox(String unit) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: TColor.secondaryG),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        unit,
        style: TextStyle(color: TColor.white, fontSize: 12),
      ),
    );
  }
}
