class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}

class Quiz {
  final String title;
  final String description;
  final String deadline;
  final int durationMinutes;
  final List<Question> questions;

  Quiz({
    required this.title,
    required this.description,
    required this.deadline,
    required this.durationMinutes,
    required this.questions,
  });

  static Quiz get dummyQuiz => Quiz(
        title: 'Quiz Review 1',
        description:
            'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\nJangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.\n\nKerjakan sebelum hari Jum\'at, 26 Februari 2021 jam 23:59 WIB.',
        deadline: 'Jumat, 26 February 2021, 11:59 PM',
        durationMinutes: 15,
        questions: [
          Question(
            questionText: 'Apa fungsi utama dari Flutter?',
            options: [
              'Membuat aplikasi web saja',
              'Membuat aplikasi cross-platform (iOS, Android, Web, Desktop)',
              'Membuat sistem operasi',
              'Mengelola database'
            ],
            correctOptionIndex: 1,
          ),
          Question(
            questionText: 'Bahasa pemrograman yang digunakan oleh Flutter adalah?',
            options: ['Java', 'Kotlin', 'Dart', 'Swift'],
            correctOptionIndex: 2,
          ),
          Question(
            questionText: 'Widget apa yang digunakan untuk membuat layout baris?',
            options: ['Column', 'Row', 'Stack', 'Container'],
            correctOptionIndex: 1,
          ),
        ],
      );
}
