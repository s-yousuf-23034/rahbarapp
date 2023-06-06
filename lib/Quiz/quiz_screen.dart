import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'QuizData.dart';
import 'Question.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizScreen({Key? key, required this.questions}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> selectedOptions = [];
  int score = 0;

  void checkAnswers() {
    int newScore = 0;
    final quizData = Provider.of<QuizData>(context, listen: false);
    final questions = quizData.questions;
    for (int i = 0; i < questions.length; i++) {
      if (selectedOptions[i] == questions[i].correctAnswerIndex) {
        newScore++;
      }
    }
    setState(() {
      score = newScore;
    });
  }

  @override
  void initState() {
    super.initState();
    final quizData = Provider.of<QuizData>(context, listen: false);
    final questions = quizData.questions;
    selectedOptions = List<int>.filled(questions.length, -1);
  }

  @override
  Widget build(BuildContext context) {
    final quizData = Provider.of<QuizData>(context, listen: false);
    final questions = quizData.questions;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 60, 5, 69),
      ),
      body: ChangeNotifierProvider.value(
        value: quizData,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q${index + 1}: ${question.question}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            children: List.generate(
                              3,
                              (optionIndex) => ChoiceChip(
                                label: Text(question.options[optionIndex]),
                                selected: selectedOptions[index] == optionIndex,
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedOptions[index] = optionIndex;
                                    } else {
                                      selectedOptions[index] = -1;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: checkAnswers,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 60, 5, 69),
                ),
              ),
              child: Text(
                'Submit Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Score: $score/${questions.length}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
