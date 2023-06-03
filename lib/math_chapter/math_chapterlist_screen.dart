import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/math_chapter/chapter_detail_screen.dart';

import 'bloc/mathchapter_bloc.dart';

class MathChapterListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maths Chapter List'),
      ),
      body: BlocBuilder<MathChapterBloc, MathChapterState>(
        builder: (context, state) {
          if (state is MathChapterLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MathChapterLoadedState) {
            return ListView.builder(
              itemCount: state.mathChapters.length,
              
              itemBuilder: (context, index) {
                final chapter = state.mathChapters[index];
                return ListTile(
                  title: Text(chapter.name),
                  subtitle: Text('Video URL: ${chapter.videoUrl}'),
                  trailing: chapter.quizAttempted
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChapterDetailScreen(chapterIndex: index),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
