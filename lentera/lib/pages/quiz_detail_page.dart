import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../theme/colors.dart';
import 'quiz_page.dart';

class QuizDetailPage extends StatelessWidget {
  final Quiz quiz;

  const QuizDetailPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          quiz.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description
            Text(
              quiz.description,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 32),

            // Info Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'Kuis Akan di tutup pada ${quiz.deadline}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text('Batas Waktu: ${quiz.durationMinutes} menit'),
                  const SizedBox(height: 16),
                  const Text('Metode Penilaian: Nilai Tertinggi'),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // History Section
            const Text(
              'Percobaan Yang Sudah Di Lakukan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),

            // History Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFFE57373), // Lighter red
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Status', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Nilai / 100.00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Tinjau Kembali', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            
            // History Item (Dummy)
            Container(
               padding: const EdgeInsets.all(16),
               color: Colors.grey[50],
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text('Selesai', style: TextStyle(fontWeight: FontWeight.bold)),
                       const SizedBox(height: 4),
                       Text(
                         'Dikirim Pada Kamis, 25 Februari 2021, 10:40',
                         style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                       ),
                     ],
                   ),
                   const Text('85,0', style: TextStyle(fontWeight: FontWeight.bold)),
                   const Text('Lihat', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                 ],
               ),
            ),
             const SizedBox(height: 24),
            
            // Final Grade
             const Center(
               child: Text(
                 'Nilai Akhir Anda Unutuk Kuis Ini Adalah 85.0 / 100.00',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),
             ),
             
             const SizedBox(height: 60),

             // Action Buttons
             Center(
               child: Column(
                 children: [
                   SizedBox(
                     width: 200,
                     child: ElevatedButton(
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => QuizPage(quiz: quiz)),
                         );
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.grey[200],
                         foregroundColor: Colors.black,
                         elevation: 0,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                         ),
                         padding: const EdgeInsets.symmetric(vertical: 16),
                       ),
                       child: const Text('Ambil Kuis'),
                     ),
                   ),
                   const SizedBox(height: 16),
                   SizedBox(
                     width: 200,
                     child: ElevatedButton(
                       onPressed: () {
                         Navigator.pop(context);
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.grey[200],
                         foregroundColor: Colors.black,
                         elevation: 0,
                           shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                         ),
                         padding: const EdgeInsets.symmetric(vertical: 16),
                       ),
                       child: const Text('Kembali Ke Kelas'),
                     ),
                   ),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
