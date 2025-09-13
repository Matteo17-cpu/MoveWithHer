import 'package:card_stack_widget/widget/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/common/color_extension.dart';
import 'package:workout_app/common_widget/on_boarding_page.dart';
import 'package:workout_app/common_widget/workout_heartrate_page.dart';
import 'package:workout_app/view/fitur/her_community.dart';
import 'package:workout_app/view/home/about_herstrap.dart';
import 'package:workout_app/view/home/about_movewithher_page.dart';
import 'package:workout_app/view/home/card_stack_widget.dart';
import 'package:workout_app/view/home/dashboard.dart';
import 'package:workout_app/view/home/exercise_page.dart';
import 'package:workout_app/view/home/her_data_page.dart';
import 'package:workout_app/view/home/recommendation_page.dart';
import 'package:workout_app/view/home/start_exercise_page.dart';
import 'package:workout_app/view/login/welcome_view.dart';
import 'package:workout_app/view/on_boarding/on_boarding_view.dart';
import 'package:workout_app/view/on_boarding/started_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //d
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        primaryColor: TColor.primaryColor1,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const StartedView(),
    );
  }
}

