import 'package:flutter/material.dart';
import '../theme/colors.dart';

class IntroductionUIDPage extends StatelessWidget {
  const IntroductionUIDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          '01 - Pengantar User Interface Design',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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
            // Simulating a PDF or Document View
            Container(
              width: double.infinity,
              height: 500, // Placeholder height
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.picture_as_pdf, size: 80, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    'Pengantar User Interface Design.pdf',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('(Mock Document Viewer)'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Ringkasan Materi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'User Interface (UI) Design adalah proses mendesain antarmuka untuk perangkat lunak atau perangkat komputer, dengan fokus pada tampilan dan gaya. Tujuannya adalah membuat desain antarmuka yang mudah digunakan dan menyenangkan bagi pengguna.',
              style: TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 12),
            const Text(
              'Poin-poin Penting:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildBulletPoint('Definisi UI dan UX'),
            _buildBulletPoint('Pentingnya UI yang baik'),
            _buildBulletPoint('Komponen dasar UI'),
            _buildBulletPoint('Prinsip-prinsip desain visual'),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
