import 'package:flutter/material.dart';
import '../models/course_model.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 0,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Large Square Thumbnail
          SizedBox(
            width: 100,
            height: 100,
            child: _buildCover(),
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

  Widget _buildCover() {
    switch (course.coverType) {
      case 'ui_ux':
        return Container(
          color: const Color(0xFFFDD835),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('ui', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('UX', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        );
      case 'pkn':
        return Container(
          color: const Color(0xFFD32F2F),
          child: Stack(
            children: [
              const Center(
                child: Icon(Icons.security, size: 60, color: Colors.amber), 
              ),
              Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white.withOpacity(0.9),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: const Text(
                    'PENDIDIKAN\nKEWARGANEGARAAN',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      case 'os':
        return Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1,
                  child: const Icon(Icons.computer, size: 80, color: Colors.grey),
                ),
              ),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Operating', style: TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Courier')),
                    Text('System', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red, fontFamily: 'Courier')),
                  ],
                ),
              ),
            ],
          ),
        );
       case 'english':
        return Container(
          decoration: BoxDecoration(
            color: course.color,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey[300]!, Colors.grey[400]!],
            ),
          ),
          child: const Center(
            child: Text(
              'English',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          )
        );
      default:
        // Geometric patterns for others
        return Container(
          decoration: BoxDecoration(
            color: course.color,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                course.color,
                course.color.withOpacity(0.7),
              ],
            ),
          ),
          child: CustomPaint(
            painter: _GeometricPainter(),
          ),
        );
    }
  }
}

class _GeometricPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
    
    // Extra triangle
    final path2 = Path();
    path2.moveTo(0, 0);
    path2.lineTo(size.width * 0.5, 0);
    path2.lineTo(0, size.height * 0.5);
    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
