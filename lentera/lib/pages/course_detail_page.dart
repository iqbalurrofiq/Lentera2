import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../models/material_model.dart';
import '../theme/colors.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    // Dummy Materials
    final List<MaterialItem> materials = [
      MaterialItem(title: 'Pengenalan Mata Kuliah', type: CourseMaterialType.pdf, isCompleted: true),
      MaterialItem(title: 'Video Pembelajaran Pertemuan 1', type: CourseMaterialType.video, isCompleted: true),
      MaterialItem(title: 'Slide Materi Pertemuan 1', type: CourseMaterialType.pdf, isCompleted: true),
      MaterialItem(title: 'Kuis Pertemuan 1', type: CourseMaterialType.quiz, isCompleted: false),
      MaterialItem(title: 'Video Pembelajaran Pertemuan 2', type: CourseMaterialType.video, isCompleted: false),
      MaterialItem(title: 'Tugas Individu 1', type: CourseMaterialType.quiz, isCompleted: false),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(course.code),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             // Header Color
             Container(
               width: double.infinity,
               padding: const EdgeInsets.all(24),
               decoration: BoxDecoration(
                 color: AppColors.primary,
                 borderRadius: const BorderRadius.only(
                   bottomLeft: Radius.circular(24),
                   bottomRight: Radius.circular(24),
                 ),
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     course.title,
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   const SizedBox(height: 8),
                   Text(
                     'Kode: ${course.code}',
                     style: const TextStyle(color: Colors.white70),
                   ),
                    const SizedBox(height: 16),
                   LinearProgressIndicator(
                    value: course.progress,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${(course.progress * 100).toInt()}% Selesai',
                       style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                 ],
               ),
             ),
             
             const Padding(
               padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
               child: Text(
                 'Materi Pembelajaran',
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),

             ListView.separated(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemCount: materials.length,
               separatorBuilder: (context, index) => const Divider(height: 1),
               itemBuilder: (context, index) {
                 final item = materials[index];
                 IconData icon;
                 Color iconColor;
                 switch (item.type) {
                   case CourseMaterialType.pdf:
                     icon = Icons.picture_as_pdf;
                     iconColor = Colors.red;
                     break;
                   case CourseMaterialType.video:
                     icon = Icons.play_circle_fill;
                     iconColor = Colors.blue;
                     break;
                   case CourseMaterialType.quiz:
                     icon = Icons.assignment;
                     iconColor = Colors.orange;
                     break;
                 }

                 return ListTile(
                   leading: Icon(icon, color: iconColor, size: 32),
                   title: Text(item.title),
                   subtitle: Text(item.type.name.toUpperCase()),
                   trailing:  Icon(
                     item.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                     color: item.isCompleted ? Colors.green : Colors.grey,
                   ),
                   onTap: () {
                     // Open material action
                   },
                 );
               },
             ),
           ],
         ),
      ),
    );
  }
}
