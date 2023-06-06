import 'package:flutter/material.dart';

import 'Question.dart';

class QuizData with ChangeNotifier {
  List<Question> _questions = [];

  List<Question> get questions => _questions;

  void addQuestion({
    required String question,
    required List<String> options,
    required int correctAnswerIndex,
  }) {
    final newQuestion = Question(
      question: question,
      options: options,
      correctAnswerIndex: correctAnswerIndex,
    );
    _questions.add(newQuestion);
    notifyListeners();
  }
}
