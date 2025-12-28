import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AnnouncementDetailPage extends StatelessWidget {
  const AnnouncementDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Pengumuman',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Maintenance Pra UAS Semester Genap 2020/2021',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 16),

            // Metadata
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.person, size: 16, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[50],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background Illustration Placeholder
                  // Using a simple composition to mimic the screenshot
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                      ),
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.build_circle_outlined, size: 64, color: AppColors.primary),
                      SizedBox(height: 8),
                      Text(
                        'Maintenance LMS',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Text Body
            const Center(
              child: Text(
                'Maintenance LMS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).',
              style: TextStyle(fontSize: 14, height: 1.6),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            const Text(
              'Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.',
              style: TextStyle(fontSize: 14, height: 1.6),
               textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            const Text(
              'Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.',
              style: TextStyle(fontSize: 14, height: 1.6),
               textAlign: TextAlign.justify,
            ),
             const SizedBox(height: 24),
            const Text(
              'Hormat Kami,\nCeLOE Telkom University',
              style: TextStyle(fontSize: 14, height: 1.6, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
