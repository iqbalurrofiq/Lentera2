import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/colors.dart';
import 'introduction_uid_page.dart'; // Add this import

class MaterialDetailPage extends StatefulWidget {
  const MaterialDetailPage({super.key});

  @override
  State<MaterialDetailPage> createState() => _MaterialDetailPageState();
}

class _MaterialDetailPageState extends State<MaterialDetailPage> with SingleTickerProviderStateMixin {
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
      backgroundColor: AppColors.primary, // Maroon background for header feel
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Column(
          children: [
            Text(
              'DESAIN ANTARMUKA & PENGALAMAN',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
             Text(
              'PENGGUNA D4SM-42-03 [ADY]',
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            // Handle bar
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Pengantar User Interface Design',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetapi pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience',
                      style: TextStyle(fontSize: 12, height: 1.5, color: Colors.black87),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 24),

                    // Inner Tabs
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        tabs: const [
                          Tab(text: "Lampiran Materi"),
                          Tab(text: "Tugas dan Kuis"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tab View
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildLampiranList(),
                          const Center(child: Text("Tugas dan Kuis Content")),
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
    );
  }

  Widget _buildLampiranList() {
    final items = [
      {
        'icon': Icons.link,
        'title': 'Zoom Meeting Syncronous',
        'checked': true,
        'url': 'https://us05web.zoom.us/myhome',
      },
      {'icon': Icons.description_outlined, 'title': 'Pengantar User Interface Design', 'checked': true},
      {'icon': Icons.description_outlined, 'title': 'Empat Teori Dasar Antarmuka Pengguna', 'checked': true},
      {'icon': Icons.description_outlined, 'title': 'Empat Teori Dasar Antarmuka Pengguna', 'checked': true},
      {'icon': Icons.menu_book_outlined, 'title': 'User Interface Design for Beginner', 'checked': true},
      {'icon': Icons.link, 'title': '20 Prinsip Desain', 'checked': true},
       {'icon': Icons.link, 'title': 'Best Practice UI Design', 'checked': true},
    ];

    return ListView.builder(
      itemCount: items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () async {
            if (item.containsKey('url')) {
              final url = Uri.parse(item['url'] as String);
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch $url')),
                  );
                }
              }
            } else if (item['title'] == 'Pengantar User Interface Design') {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IntroductionUIDPage()),
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(item['icon'] as IconData, size: 20, color: Colors.black54),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item['title'] as String,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                if (item['checked'] as bool)
                  const Icon(Icons.check_circle, color: Colors.green, size: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
