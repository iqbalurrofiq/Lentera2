import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../theme/colors.dart';
import '../widgets/course_card.dart';
import 'course_detail_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Maroon Header Background
          Container(
            height: 280, // Height for header
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
              ),
            ),
          ),
          
          // Back Button
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Profile Image & Name
                 Center(
                   child: Column(
                     children: [
                       Container(
                         padding: const EdgeInsets.all(4),
                         decoration: const BoxDecoration(
                           color: Colors.redAccent, // Slightly lighter red ring
                           shape: BoxShape.circle,
                         ),
                         child: const CircleAvatar(
                           radius: 40,
                           backgroundImage: AssetImage('assets/images/profile.png'),
                         ),
                       ),
                       const SizedBox(height: 16),
                       const Text(
                         'IQBALUR ROFIQ',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ],
                   ),
                 ),
                 const SizedBox(height: 30),

                 // Floating Tab Section
                 Expanded(
                   child: Container(
                     margin: const EdgeInsets.symmetric(horizontal: 24),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: const BorderRadius.only(
                         topLeft: Radius.circular(16),
                         topRight: Radius.circular(16),
                       ),
                       boxShadow: [
                         BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                           blurRadius: 10,
                           offset: const Offset(0, -5),
                         ),
                       ],
                     ),
                     child: Column(
                       children: [
                         // Tab Bar
                         Container(
                           padding: const EdgeInsets.all(8),
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(16),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey.withValues(alpha: 0.2),
                                 blurRadius: 5,
                                 offset: const Offset(0, 2),
                               ),
                             ],
                           ),
                           margin: const EdgeInsets.all(16),
                           child: TabBar(
                             controller: _tabController,
                             labelColor: Colors.black,
                             unselectedLabelColor: Colors.grey,
                             indicatorSize: TabBarIndicatorSize.label,
                             indicatorColor: Colors.black,
                             labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                             tabs: const [
                               Tab(text: "About Me"),
                               Tab(text: "Kelas"),
                               Tab(text: "Edit Profile"),
                             ],
                           ),
                         ),
                         
                         // Content
                         Expanded(
                           child: TabBarView(
                             controller: _tabController,
                             children: [
                               _buildAboutMeTab(),
                               _buildKelasTab(),
                               _buildEditProfileTab(),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi User',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildInfoItem('Email address', 'iqbalurrofiq@365.telkomuniversity.ac.id'),
          const SizedBox(height: 16),
          _buildInfoItem('Program Studi', 'D4 Teknologi Rekayasa Multimedia'),
           const SizedBox(height: 16),
          _buildInfoItem('Fakultas', 'FIT'),

          const SizedBox(height: 32),
           const Text(
            'Aktivitas Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildInfoItem('First access to site', 'Tuesday, 30 December 2025, 08:00 AM (14 hours)'),
          const SizedBox(height: 16),
          _buildInfoItem('Last access to site', 'Tuesday, 30 December 2025, 10:35 PM (now)'),

          const SizedBox(height: 40),
          
          // Logout Button
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
               icon: const Icon(Icons.logout, size: 16),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  
  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildKelasTab() {
    final courses = Course.dummyCourses;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return InkWell(
          onTap: () {
             Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailPage(course: course),
                ),
              );
          },
          child: CourseCard(course: course),
        );
      },
    );
  }

  Widget _buildEditProfileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pengaturan Akun',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 24),
          
          const Text('Ubah Password', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password Lama',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
             obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password Baru',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
             obscureText: true,
            decoration: InputDecoration(
              labelText: 'Konfirmasi Password Baru',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
          
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Simpan Password'),
            ),
          ),

          const SizedBox(height: 40),
          const Text(
            'Tentang Aplikasi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
           const SizedBox(height: 16),
           const Text(
             'Lentera LMS Mobile v1.0.0\nDeveloped by Tim Iqbal',
             style: TextStyle(color: Colors.grey),
           ),
           
           const SizedBox(height: 40),
             // Logout Button also here
          Align(
            alignment: Alignment.center,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
               icon: const Icon(Icons.logout, size: 16),
              label: const Text('Log Out'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
