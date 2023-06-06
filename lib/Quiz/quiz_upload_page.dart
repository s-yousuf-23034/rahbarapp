import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'QuizData.dart';
import 'Question.dart';

class QuizUploadPage extends StatefulWidget {
  final String userName;
  final ValueSetter<List<Question>> onUploadQuiz;

  const QuizUploadPage({
    Key? key,
    required this.userName,
    required this.onUploadQuiz,
  }) : super(key: key);

  @override
  _QuizUploadPageState createState() => _QuizUploadPageState();
}

class _QuizUploadPageState extends State<QuizUploadPage> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  int selectedOptionIndex = 0;

  void addQuestion() {
    final String question = questionController.text;
    final String option1 = option1Controller.text;
    final String option2 = option2Controller.text;
    final String option3 = option3Controller.text;
    final int correctAnswerIndex = selectedOptionIndex;

    if (question.isNotEmpty &&
        option1.isNotEmpty &&
        option2.isNotEmpty &&
        option3.isNotEmpty) {
      Provider.of<QuizData>(context, listen: false).addQuestion(
        question: question,
        options: [option1, option2, option3],
        correctAnswerIndex: correctAnswerIndex,
      );

      questionController.clear();
      option1Controller.clear();
      option2Controller.clear();
      option3Controller.clear();
      selectedOptionIndex = 0;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Question added successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields!'),
        ),
      );
    }
  }

  void uploadQuiz() {
    final quizData = Provider.of<QuizData>(context, listen: false);
    if (quizData.questions.isNotEmpty) {
      widget.onUploadQuiz(quizData.questions);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Quiz uploaded successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please add at least one question!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Upload',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 60, 5, 69),
      ),
      body: ChangeNotifierProvider(
        create: (_) => QuizData(),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              'Add Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: questionController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Question',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: option1Controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Option 1',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: option2Controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Option 2',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: option3Controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Option 3',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Text('Correct Answer:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<int>(
                  value: 0,
                  groupValue: selectedOptionIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedOptionIndex = value!;
                    });
                  },
                ),
                Text('Option 1'),
                SizedBox(width: 20),
                Radio<int>(
                  value: 1,
                  groupValue: selectedOptionIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedOptionIndex = value!;
                    });
                  },
                ),
                Text('Option 2'),
                SizedBox(width: 20),
                Radio<int>(
                  value: 2,
                  groupValue: selectedOptionIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedOptionIndex = value!;
                    });
                  },
                ),
                Text('Option 3'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addQuestion,
              child: Text('Add Question'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: uploadQuiz,
              child: Text('Upload Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
