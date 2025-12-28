import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/colors.dart';

class ConceptUIDPage extends StatefulWidget {
  const ConceptUIDPage({super.key});

  @override
  State<ConceptUIDPage> createState() => _ConceptUIDPageState();
}

class _ConceptUIDPageState extends State<ConceptUIDPage> with SingleTickerProviderStateMixin {
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
      backgroundColor: AppColors.primary,
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
                        'Konsep User Interface Design',
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
                      'Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari interaction.',
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
      {'icon': Icons.description_outlined, 'title': 'Elemen-elemen Antarmuka Pengguna', 'checked': true},
      {'icon': Icons.description_outlined, 'title': 'UID Guidelines and Principles', 'checked': true},
      {'icon': Icons.description_outlined, 'title': 'User Profile', 'checked': true},
      {'icon': Icons.link, 'title': 'Principles of User Interface DesignURL', 'checked': true},
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
