import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../models/quiz_model.dart';
import '../theme/colors.dart';
import 'quiz_detail_page.dart';
import 'assignment_detail_page.dart';
import 'material_detail_page.dart';
import 'concept_uid_page.dart';

class CourseDetailPage extends StatefulWidget {
  final Course course;

  const CourseDetailPage({super.key, required this.course});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: Text(
          widget.course.title,
          maxLines: 2,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header & Tab Section
          Container(
            color: AppColors.primary,
            child: Container(
              margin: const EdgeInsets.only(top: 10), // Spacing
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: "Materi"),
                  Tab(text: "Tugas Dan Kuis"),
                ],
              ),
            ),
          ),
          
          // Tab View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMateriTab(),
                _buildTugasTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMateriTab() {
    // Dummy Data for Materi
    final List<Map<String, dynamic>> materiList = [
      {
        'label': 'Pertemuan 1',
        'title': '01 - Pengantar User Interface Design',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'done': false, // Grey check
      },
      {
        'label': 'Pertemuan 2',
        'title': '02 - Konsep User Interface Design',
        'info': '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
        'done': true,
      },
      {
        'label': 'Pertemuan 3',
        'title': '03 - Interaksi pada User Interface Design',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'done': true,
      },
       {
        'label': 'Pertemuan 4',
        'title': '04 - Ethnographic Observation',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'done': true,
      },
       {
        'label': 'Pertemuan 5',
        'title': '05 - UID Testing',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'done': true,
      },
      {
        'label': 'Pertemuan 6',
        'title': '06 - Assessment 1',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'done': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: materiList.length,
      itemBuilder: (context, index) {
        final item = materiList[index];
        return InkWell(
          onTap: () {
            // For demo, only the first item navigates to the detail page
            if (index == 0) {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MaterialDetailPage()),
              );
            } else if (index == 1) {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConceptUIDPage()),
              );
            }
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF64B5F6), // Light Blue
                          borderRadius: BorderRadius.circular(4), // Rounded corners for label
                        ),
                        child: Text(
                          item['label'],
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: item['done'] ? Colors.green : Colors.grey[300],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['info'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTugasTab() {
    // Dummy Data for Tugas/Quiz
    final List<Map<String, dynamic>> tugasList = [
      {
        'type': 'quiz',
        'label': 'QUIZ',
        'title': 'Quiz Review 01',
        'deadline': 'Tenggat Waktu : 30 Desember 2025 23:59 WIB',
        'done': true,
      },
      {
        'type': 'tugas',
        'label': 'Tugas',
        'title': 'Tugas 01 - UID Android Mobile Game',
        'deadline': 'Tenggat Waktu : 30 Desember 2025 23:59 WIB',
        'done': false, // Grey check
      },
      {
        'type': 'quiz',
        'label': 'Pertemuan 3',
        'title': 'Kuis - Assessment 2',
        'deadline': 'Tenggat Waktu : 30 Desember 2025 23:59 WIB',
        'done': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tugasList.length,
      itemBuilder: (context, index) {
        final item = tugasList[index];
        return InkWell(
          onTap: () {
            if (item['type'] == 'quiz') {
               Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => QuizDetailPage(quiz: Quiz.dummyQuiz),
               ),
             );
            } else if (item['type'] == 'tugas') {
               Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => const AssignmentDetailPage()),
               );
            }
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF64B5F6), // Light Blue
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          item['label'],
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: item['done'] ? Colors.green : Colors.grey[300],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Content Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon
                      Icon(
                        item['type'] == 'quiz' ? Icons.quiz_outlined : Icons.assignment_outlined,
                        size: 40,
                        color: Colors.black87,
                      ),
                      const SizedBox(width: 16),
                      // Text
                      Expanded(
                        child: Text(
                          item['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  Text(
                    item['deadline'],
                    style: TextStyle(color: Colors.grey[500], fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
