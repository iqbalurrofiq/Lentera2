import 'package:flutter/material.dart';

class Course {
  final String title;
  final String code;
  final String semester;
  final double progress; // 0.0 to 1.0
  final Color color;

  Course({
    required this.title,
    required this.code,
    required this.semester,
    required this.progress,
    required this.color,
  });

  static List<Course> get dummyCourses => [
        Course(
          title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
          code: 'D4SM-42-03 [ADY]',
          semester: '2021/2',
          progress: 0.89,
          color: const Color(0xFFFDD835), // Yellow-ish
        ),
        Course(
          title: 'KEWARGANEGARAAN',
          code: 'D4SM-41-GAB1 [BBO]. JUMAT 2',
          semester: '2021/2',
          progress: 0.86,
          color: const Color(0xFFD50000), // Red
        ),
        Course(
          title: 'SISTEM OPERASI',
          code: 'D4SM-44-02 [DDS]',
          semester: '2021/2',
          progress: 0.90,
          color: const Color(0xFFEEEEEE), // Grey/White pattern
        ),
        Course(
          title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
          code: 'D4SM-41-GAB1 [APJ]',
          semester: '2021/2',
          progress: 0.90,
          color: const Color(0xFF80DEEA), // Cyan
        ),
        Course(
           title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
           code: 'D4SM-41-GAB1 [ARS]',
           semester: '2021/2',
           progress: 0.80,
           color: const Color(0xFFE0E0E0), // Grey
        ),
         Course(
           title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
           code: 'D4SM-43-04 [TPR]',
           semester: '2021/2',
           progress: 0.90,
           color: const Color(0xFF1976D2), // Blue
        ),
         Course(
           title: 'OLAH RAGA',
           code: 'D3TT-44-02 [EYR]',
           semester: '2021/2',
           progress: 0.90,
           color: const Color(0xFFB39DDB), // Purple
        ),
      ];
}
