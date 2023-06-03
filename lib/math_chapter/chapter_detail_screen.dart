import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/mathchapter_bloc.dart';

class ChapterDetailScreen extends StatelessWidget {
  final int chapterIndex;

  const ChapterDetailScreen({required this.chapterIndex});

  @override
  Widget build(BuildContext context) {
    final chapterBloc = BlocProvider.of<MathChapterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Video player for ${chapterBloc.mathChapters[chapterIndex].name}'),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Start Quiz'),
              onPressed: () {
                chapterBloc.add(StartQuizEvent(chapterIndex));
              },
            ),
          ],
        ),
      ),
    );
  }
}
