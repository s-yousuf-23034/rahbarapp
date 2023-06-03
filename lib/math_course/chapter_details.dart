import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/math_course/bloc/math_bloc.dart';

class ChapterDetailsPage extends StatelessWidget {
  final Chapter chapter;

  const ChapterDetailsPage({Key? key, required this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
      ),
      body: BlocBuilder<MathBloc, MathState>(
        builder: (context, state) {
          final currentChapter = (state as MathDataState)
              .chapters
              .firstWhere((element) => element.id == chapter.id);

          if (!currentChapter.isQuizCompleted) {
            return Center(
              child: Text('Quiz not completed for this chapter.'),
            );
          }

          return Center(
            child: Text('Chapter Details'),
          );
        },
      ),
    );
  }
}
