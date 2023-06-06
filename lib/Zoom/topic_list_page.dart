import 'package:flutter/material.dart';
import 'package:rahbarapp/Course/course.dart';
// import 'package:rahbarapp/Course/course.dart';
// import 'package:rahbarapp/Quiz/quiz_screen.dart';

class TopicListPage extends StatelessWidget {
  final Course course;

  TopicListPage({required this.course});

  @override
  Widget build(BuildContext context) {
//     // Implement your TopicListPage UI here
    return Scaffold(
//       appBar: AppBar(
//         title: Text(course.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Topic List Page for ${course.title}'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         QuizScreen(questions: [course.questions],),
//                   ),
//                 );
//               },
//               child: Text('Start Quiz'),
//             ),
//           ],
//         ),
//       ),
        );
  }
}
