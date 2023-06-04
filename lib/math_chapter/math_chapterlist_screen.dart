import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/math_chapter/chapter_detail_screen.dart';

import 'bloc/mathchapter_bloc.dart';
import 'bloc/mathchapter_state.dart';

class MathChapterListScreen extends StatefulWidget {
  @override
  _MathChapterListScreenState createState() => _MathChapterListScreenState();
}

class _MathChapterListScreenState extends State<MathChapterListScreen> {
  late MathChapterBloc _mathChapterBloc;

  @override
  void initState() {
    super.initState();
    _mathChapterBloc = MathChapterBloc();
    _mathChapterBloc.add(LoadMathChaptersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maths Chapter List'),
      ),
      body: BlocBuilder<MathChapterBloc, MathChapterState>(
        bloc: _mathChapterBloc,
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
                  leading: CircleAvatar(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  title: Text(
                    chapter.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  //subtitle: Text('Video URL: ${chapter.videoUrl}'),
                  trailing: chapter.quizAttempted
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  onTap: () {
                    // Handle chapter tap
                    // For simplicity, just print the chapter name
                    print('Tapped on chapter: ${chapter.name}');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChapterDetailScreen(chapter: chapter)));
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('Failed to load chapters.'),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _mathChapterBloc.close();
    super.dispose();
  }
}
