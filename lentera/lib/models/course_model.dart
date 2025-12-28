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

  static List<Course> get dummyCourses => [
        Course(
          title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
          code: 'UIUX-01',
          progress: 0.75,
          color: const Color(0xFFE57373), // Red-ish
        ),
        Course(
          title: 'PEMROGRAMAN MOBILE LANJUT',
          code: 'MOB-02',
          progress: 0.45,
          color: const Color(0xFF64B5F6), // Blue-ish
        ),
        Course(
          title: 'SISTEM OPERASI',
          code: 'OS-03',
          progress: 0.90,
          color: const Color(0xFFFFD54F), // Yellow-ish
        ),
        Course(
          title: 'BASIS DATA II',
          code: 'BD-04',
          progress: 0.20,
          color: const Color(0xFFBA68C8), // Purple-ish
        ),
        Course(
           title: 'KEWARGANEGARAAN',
           code: 'KWN-05',
           progress: 0.10,
           color: const Color(0xFF81C784), // Green-ish
        ),
      ];
}
