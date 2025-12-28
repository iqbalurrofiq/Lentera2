import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../theme/colors.dart';
import '../widgets/course_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Dummy Data
  final List<Course> _courses = [
    Course(
      title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      code: 'UIUX-01',
      progress: 0.75,
      color: Colors.orange,
    ),
    Course(
      title: 'PEMROGRAMAN MOBILE LANJUT',
      code: 'MOB-02',
      progress: 0.45,
      color: Colors.blue,
    ),
    Course(
      title: 'SISTEM OPERASI',
      code: 'OS-03',
      progress: 0.90,
      color: Colors.red,
    ),
    Course(
      title: 'BASIS DATA II',
      code: 'BD-04',
      progress: 0.20,
      color: Colors.purple,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Only showing Dashboard for Home tab for now
    final List<Widget> pages = [
      _buildDashboard(context),
      const Center(child: Text('Course Page Placeholder')),
      const Center(child: Text('Profile Page Placeholder')),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: AppColors.primary,
              elevation: 0,
              toolbarHeight: 80,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Halo,',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                        Text(
                          'DANDY CANDRA PRATAMA', // Dummy Name
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                ),
              ],
            )
          : null, // No AppBar for other tabs or custom one
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildDashboard(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section: Tugas Yang Akan Datang
          const Text(
            'Tugas Yang Akan Datang',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Tugas 01 - UX Analysis Mobile Game',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Waktu Pengumpulan\nJumat 20 Februari 23:59 WIB',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Section: Pengumuman Terakhir
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pengumuman Terakhir',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat Semua', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[100]!),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.campaign, size: 40, color: Colors.blue),
                  SizedBox(height: 8),
                  Text('Info Maintenance Server'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Section: Progres Kelas
          const Text(
            'Progres Kelas',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _courses.length,
            itemBuilder: (context, index) {
              return CourseCard(course: _courses[index]);
            },
          ),
        ],
      ),
    );
  }
}
