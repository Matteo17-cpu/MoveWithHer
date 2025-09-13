import 'package:flutter/material.dart';

class WorkoutPlan {
  final String title; 
  final String image; 
  final String setsReps; 
  final String rest; 
  final Widget page; 
  final String? video;

  WorkoutPlan({
    required this.title,
    required this.image,
    required this.setsReps,
    required this.rest,
    required this.page,
    this.video,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      title: json['title'] ?? 'Untitled',
      image: json['image'] ?? 'assets/img/default.png',
      setsReps: json['setsReps'] ?? '',
      rest: json['rest'] ?? '',
      page: Placeholder(), 
    );
  }
}
