import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final List<Map<String, dynamic>> notifications = [
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'assignment',
      },
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'quiz',
      },
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'assignment',
      },
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'quiz',
      },
      {
        'text': 'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'assignment',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Icon(
                item['type'] == 'quiz' ? Icons.quiz_outlined : Icons.assignment_outlined,
                size: 28,
                color: Colors.black54,
              ),
              const SizedBox(width: 16),
              
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['text'],
                      style: const TextStyle(fontSize: 12, height: 1.5),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['time'],
                      style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
