import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../theme/colors.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 0, // Flat look as per design? Or standard card. Design looks flat-ish or very subtle.
      color: Colors.transparent, // Design has white background but it looks like a list item rather than a card
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Large Square Thumbnail
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: course.color,
              borderRadius: BorderRadius.circular(0), // Square or slight radius? design looks square
            ),
            child: course.color == const Color(0xFFEEEEEE) ? 
               // Specific hack for OS which looks like text image
               const Center(child: Text("System", style: TextStyle(fontWeight: FontWeight.bold))) 
               : null, 
          ),
          const SizedBox(width: 16),
          
          // Course Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Semester
                Text(
                  course.semester,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                
                // Title
                Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),

                // Code
                Text(
                  course.code,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Progress Bar
                LinearProgressIndicator(
                  value: course.progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB71C1C)), // Dark Red
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 4),
                Text(
                  '${(course.progress * 100).toInt()}% Selesai',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
