import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../theme/colors.dart';
import 'quiz_page.dart';

class AnswerReviewPage extends StatelessWidget {
  final Quiz quiz;
  final Map<int, int> answers;
  final double score;

  const AnswerReviewPage({
    super.key, 
    required this.quiz, 
    required this.answers,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    // Helper to get letter based on index
    String getOptionLetter(int index) {
      return String.fromCharCode(65 + index); // 65 is 'A'
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Review Jawaban',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFC62828), // Red Color
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // No back button on review screen usually
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Summary Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5), // Light Grey
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildSummaryRow('Di Mulai Pada', 'Selasa 30 Desember 2025 10:25'),
                  const SizedBox(height: 12),
                  _buildSummaryRow('Status', 'Selesai'),
                  const SizedBox(height: 12),
                  _buildSummaryRow('Selesai Pada', 'Selasa 30 Desember 2025 10:40'),
                  const SizedBox(height: 12),
                  _buildSummaryRow('Waktu Penyelesaian', '13 Menit 22 Detik'),
                  const SizedBox(height: 12),
                  _buildSummaryRow('Nilai', '${score.toStringAsFixed(2)} / 100'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Question List
            ...List.generate(quiz.questions.length, (index) {
              final question = quiz.questions[index];
              final savedAnswerIndex = answers[index];
              String savedAnswerText = '-';
              if (savedAnswerIndex != null) {
                 savedAnswerText = '${getOptionLetter(savedAnswerIndex)}. ${question.options[savedAnswerIndex]}';
              } else {
                 savedAnswerText = 'Belum dijawab';
              }

              final isCorrect = savedAnswerIndex == question.correctOptionIndex;
              final statusText = isCorrect ? 'Benar' : (savedAnswerIndex == null ? 'Tidak Dijawab' : 'Salah');
              final statusColor = isCorrect ? Colors.green : Colors.red;

              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label
                    SizedBox(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pertanyaan ${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              statusText,
                              style: TextStyle(
                                color: statusColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Question Text Box
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            color: const Color(0xFFE0E0E0), // Grey Box
                            child: Text(
                              question.questionText,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          const SizedBox(height: 12),
                          
                          // Answer & Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Jawaban Tersimpan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                    const SizedBox(height: 4),
                                    Text(savedAnswerText, style: const TextStyle(fontSize: 13)),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuizPage(
                                        quiz: quiz,
                                        isReviewMode: true,
                                        initialIndex: index, // Jump to this question
                                        existingAnswers: answers, // Pass saved answers
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Lihat Soal', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Final Submit
                   showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Sukses'),
                      content: const Text('Jawaban berhasil dikirim!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                             Navigator.pop(context); // Close dialog
                             Navigator.pop(context); // Close ReviewPage
                             Navigator.pop(context); // Close QuizPage -> Back to Detail
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF64DD17), // Bright Green
                  foregroundColor: Colors.black, // Or White? Screenshot looks Black text on Green button in previous screens, but this button text might be white. Let's assume Black for consistency or check screenshot.
                  // Screenshot 144: "Kirim Jawaban" text looks Black.
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Kirim Jawaban', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Or fixed width for label? Screenshot looks like columns.
      children: [
        SizedBox(
          width: 140,
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ),
        Expanded(
          child: Text(value, style: const TextStyle(fontSize: 13)),
        ),
      ],
    );
  }
}
