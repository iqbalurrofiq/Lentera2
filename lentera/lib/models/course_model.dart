import 'package:flutter/material.dart';

class Course {
  final String title;
  final String code;
  final double progress; // 0.0 to 1.0
  final Color color;

  Course({
    required this.title,
    required this.code,
    required this.progress,
    required this.color,
  });
}
