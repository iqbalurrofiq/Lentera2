import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../theme/colors.dart';
import 'answer_review_page.dart';

class QuizPage extends StatefulWidget {
  final Quiz quiz;
  final bool isReviewMode;
  final int initialIndex;
  final Map<int, int>? existingAnswers;

  const QuizPage({
    super.key, 
    required this.quiz, 
    this.isReviewMode = false,
    this.initialIndex = 0,
    this.existingAnswers,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  // Map to store selected answers: index -> option index
  final Map<int, int> _answers = {};

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    if (widget.existingAnswers != null) {
      _answers.addAll(widget.existingAnswers!);
    }
    // Delay scroll to ensure widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
       _scrollToCurrentBubble();
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _scrollToCurrentBubble();
    } else {
      // Calculate Score
      int correctAnswers = 0;
      for (int i = 0; i < widget.quiz.questions.length; i++) {
        if (_answers[i] == widget.quiz.questions[i].correctOptionIndex) {
          correctAnswers++;
        }
      }
      double score = (correctAnswers / widget.quiz.questions.length) * 100;

      // Navigate to Review Page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnswerReviewPage(
            quiz: widget.quiz,
            answers: _answers,
            score: score,
          ),
        ),
      ).then((returnedIndex) {
        if (returnedIndex != null && returnedIndex is int) {
           _jumpToQuestion(returnedIndex);
        }
      });
    }
  }

  void _jumpToQuestion(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _scrollToCurrentBubble() {
    // Simple auto-scroll logic if needed
    if (_scrollController.hasClients) {
      // Calculate position (rough estimate: width of bubble + padding)
      double position = (_currentIndex * 50.0) - (MediaQuery.of(context).size.width / 2) + 25;
      if (position < 0) position = 0;
       // _scrollController.animateTo(position, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  void _prevQuestion() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _scrollToCurrentBubble();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.quiz.questions.isEmpty) {
        return const Scaffold(body: Center(child: Text('Tidak ada soal :(')));
    }

    final question = widget.quiz.questions[_currentIndex];
    // Helper to get letter based on index (0 -> A, 1 -> B, etc.)
    String getOptionLetter(int index) {
      return String.fromCharCode(65 + index); // 65 is 'A'
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false, 
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(), 
              Expanded(
                child: Text(
                  widget.quiz.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.timer_outlined, size: 28),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.quiz.durationMinutes} : 00', 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              )
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFC62828), // Red Color
          foregroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 80,
        ),
      ),
      body: Column(
        children: [
          // Number Bubbles
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(widget.quiz.questions.length, (index) {
                  final isCurrent = index == _currentIndex;
                  final isAnswered = _answers.containsKey(index);
                  
                  return GestureDetector(
                    onTap: () => _jumpToQuestion(index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isAnswered ? const Color(0xFF64DD17) : Colors.transparent, // Bright Green if answered
                        border: Border.all(
                          color: isCurrent ? Colors.black : (isAnswered ? const Color(0xFF64DD17) : Colors.grey), 
                          width: isCurrent ? 2 : 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                          color: isAnswered ? Colors.black : Colors.black, // Keep text black for visibility
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // Question Number
                  Text(
                    'Soal Nomor ${_currentIndex + 1} / ${widget.quiz.questions.length}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  
                  // Question Text
                  Text(
                    question.questionText,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 40),

                  // Options
                  ...List.generate(question.options.length, (index) {
                     final option = question.options[index];
                     final isSelected = _answers[_currentIndex] == index;
                     
                     return GestureDetector(
                       onTap: () {
                         setState(() {
                           _answers[_currentIndex] = index;
                         });
                       },
                       child: Container(
                         margin: const EdgeInsets.only(bottom: 16),
                         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                         decoration: BoxDecoration(
                           color: isSelected ? const Color(0xFFEF5350) : const Color(0xFFF5F5F5), // Selected Red, else Light Grey
                           borderRadius: BorderRadius.circular(12),
                           boxShadow: isSelected ? [
                             BoxShadow(
                               color: Colors.black.withOpacity(0.1),
                               blurRadius: 4,
                               offset: const Offset(0, 2),
                             )
                           ] : [],
                         ),
                         child: Row(
                           children: [
                             Text(
                               '${getOptionLetter(index)}. ',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: isSelected ? Colors.white : Colors.black,
                               ),
                             ),
                             Expanded(
                               child: Text(
                                 option,
                                 style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     );
                  }),
                  
                  const SizedBox(height: 32),
                  
                  // Navigation Buttons
                  if (widget.isReviewMode)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[100],
                          foregroundColor: Colors.black,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                           shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Kembali Ke Halam Review', style: TextStyle(fontWeight: FontWeight.normal)),
                      ),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Previous Button
                        if (_currentIndex > 0)
                          ElevatedButton(
                            onPressed: _prevQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[100],
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Soal Sebelum nya.', style: TextStyle(fontWeight: FontWeight.normal)),
                          )
                        else
                          const SizedBox.shrink(), // Placeholder to keep spacing if needed, but here simple alignment works

                        // Next Button
                        ElevatedButton(
                          onPressed: _nextQuestion,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _currentIndex == widget.quiz.questions.length - 1 
                                ? const Color(0xFF64DD17) // Green if last
                                : Colors.grey[100], 
                            foregroundColor: _currentIndex == widget.quiz.questions.length - 1 
                                ? Colors.black // Black text on Green button as per screenshot? Or White? Screenshot Step 114 text looks Black.
                                : Colors.black,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                             shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            _currentIndex == widget.quiz.questions.length - 1 ? 'Selesai.' : 'Soal Selanjut nya.',
                            style: const TextStyle(fontWeight: FontWeight.normal), // Screenshot text looks normal weight
                          ),
                        ),
                      ],
                    ),
                  
                   const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
