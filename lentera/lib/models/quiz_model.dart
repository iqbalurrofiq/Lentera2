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
            'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\nJangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.\n\nKerjakan sebelum hari Selasa, 30 Desember 2025 jam 23:59 WIB.',
        deadline: 'Selasa, 30 Desember 2025, 11:59 PM',
        durationMinutes: 15,
      questions: [
        Question(
          questionText: 'Radio button dapat digunakan untuk menentukan ?',
          options: ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
          correctOptionIndex: 0, 
        ),
        Question(
          questionText: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
          options: ['Efisiensi', 'Konsistensi', 'Daya Tarik', 'Navigasi', 'Interaktif'],
          correctOptionIndex: 1,
        ),
        Question(
          questionText: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
           options: ['Efisiensi', 'Kompatibilitas', 'Konsistensi', 'Navigasi', 'Interaktif'],
          correctOptionIndex: 2,
        ),
        Question(
          questionText: 'Radio button dapat digunakan untuk menentukan ?',
           options: ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
          correctOptionIndex: 0,
        ),
        Question(
          questionText: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
           options: ['Efisiensi', 'Daya Tarik', 'Konsistensi', 'Navigasi', 'Interaktif'],
          correctOptionIndex: 2,
        ),
        Question(
          questionText: 'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
          options: ['Efisiensi', 'Navigasi', 'Konsistensi', 'Daya Tarik', 'Interaktif'],
          correctOptionIndex: 2,
        ),
        Question(
          questionText: 'Radio button dapat digunakan untuk menentukan ?',
          options: ['Jenis Kelamin', 'Alamat', 'Hobby', 'Riwayat Pendidikan', 'Umur'],
          correctOptionIndex: 0,
        ),
      ],
    );
}
