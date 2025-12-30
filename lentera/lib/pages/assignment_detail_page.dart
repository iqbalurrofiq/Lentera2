import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../theme/colors.dart';

class AssignmentDetailPage extends StatelessWidget {
  const AssignmentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Tugas 01 - UID Android Mobile Game',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: const Color(0xFFC62828), // Red Color
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instructions
            const Text(
              '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n\n'
              '2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.\n\n'
              '3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.\n\n'
              '4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.\n\n'
              '5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB.\n\n'
              '6. Tugas dikumpulkan paling lambat hari Jum\'at, 26 Februari 2021 jam 23.59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
              style: TextStyle(height: 1.5, fontSize: 13),
            ),
            const SizedBox(height: 32),

            // Status Section
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  // Status Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF5350), // Lighter red
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Status Tugas',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Data Rows
                  _buildStatusRow('Status', 'Sudah Mengirim untuk di Nilai'),
                  const Divider(height: 1),
                  _buildStatusRow('Status Nilai', 'Belum Di Nilai'),
                  const Divider(height: 1),
                  _buildStatusRow('Batas tanggal', 'Jumat, 26 Februari 2021, 23:59 WIB'),
                  const Divider(height: 1),
                  _buildStatusRow('Sisa Waktu', 'Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya'),
                  const Divider(height: 1),
                  
                  // File Submission Row
                   Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(
                          width: 100,
                          child: Text(
                            "File Tugas",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                             decoration: BoxDecoration(
                               color: Colors.grey[200],
                               borderRadius: BorderRadius.circular(4),
                             ),
                            child: Row(
                              children: const [
                                Icon(Icons.description, size: 20, color: Colors.grey),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Dandy Candra Pratama_7708170114.pdf',
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),

            // Edit/Submit Button
            Center(
               child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => _buildUploadBottomSheet(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Tambahkan Tugas'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadBottomSheet(BuildContext context) {
    String? selectedFileName;

    return StatefulBuilder(
      builder: (context, setState) {
        Future<void> pickFile() async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if (result != null) {
            setState(() {
              selectedFileName = result.files.single.name;
            });
          }
        }

        return Container(
          height: 600,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFFC62828), // Deep Red
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    // Handle Bar
                    Container(
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Upload File',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Maksimum File 5MB , Maksimum Jumlah File 20',
                                    style: TextStyle(fontSize: 12, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                
                                // Dashed Container Area (Clickable)
                                GestureDetector(
                                  onTap: pickFile,
                                  child: CustomPaint(
                                    painter: DashedRectPainter(color: Colors.grey, strokeWidth: 1.5, gap: 5.0),
                                    child: SizedBox(
                                      height: 250,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            selectedFileName != null ? Icons.description : Icons.cloud_upload, 
                                            size: 100, 
                                            color: const Color(0xFF29B6F6)
                                          ), // Light Blue
                                          const SizedBox(height: 16),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Text(
                                              selectedFileName ?? 'File yang akan di upload akan tampil di sini',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: selectedFileName != null ? Colors.black : Colors.grey, 
                                                fontSize: 13
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                const Spacer(),
                                 const SizedBox(height: 20),

                                // Buttons
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: pickFile,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey[100],
                                          foregroundColor: Colors.black,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                        ),
                                        child: const Text('Pilih File'),
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
                                          backgroundColor: Colors.grey[100],
                                          foregroundColor: Colors.black,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                        ),
                                        child: const Text('Simpan'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _buildStatusRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashedRectPainter({this.strokeWidth = 1.0, this.color = Colors.black, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = size.width;
    double y = size.height;

    _drawDashedLine(canvas, dashedPaint, const Offset(0, 0), Offset(x, 0));
    _drawDashedLine(canvas, dashedPaint, Offset(x, 0), Offset(x, y));
    _drawDashedLine(canvas, dashedPaint, Offset(x, y), Offset(0, y));
    _drawDashedLine(canvas, dashedPaint, Offset(0, y), const Offset(0, 0));
  }

  void _drawDashedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    bool isHorizontal = start.dy == end.dy;
    double dashWidth = 5.0;
    double dashSpace = gap;

    if (isHorizontal) {
      double startX = start.dx;
      double endX = end.dx;
      if (startX > endX) {
        double temp = startX;
        startX = endX;
        endX = temp;
      }
      double currentX = startX;
      while (currentX < endX) {
        double nextX = currentX + dashWidth;
        if (nextX > endX) nextX = endX;
        canvas.drawLine(Offset(currentX, start.dy), Offset(nextX, start.dy), paint);
        currentX += dashWidth + dashSpace;
      }
    } else {
      double startY = start.dy;
      double endY = end.dy;
      if (startY > endY) {
        double temp = startY;
        startY = endY;
        endY = temp;
      }
      double currentY = startY;
      while (currentY < endY) {
        double nextY = currentY + dashWidth;
        if (nextY > endY) nextY = endY;
        canvas.drawLine(Offset(start.dx, currentY), Offset(start.dx, nextY), paint);
        currentY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
