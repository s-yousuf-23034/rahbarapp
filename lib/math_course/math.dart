import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/CourseList.dart';
import 'package:rahbarapp/math_course/bloc/math_bloc.dart';
import 'package:rahbarapp/math_course/chapter_details.dart';

class MathPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Math Chapters'),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CourseList()));
            },
            icon: Icon(Icons.arrow_back),
          )),
      body: BlocBuilder<MathBloc, MathState>(
        builder: (context, state) {
          if (state is MathDataState) {
            // Check if the state is MathDataState
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final chapter = state.chapters[index];
                return ListTile(
                  title: Text(chapter.title),
                  leading: chapter.isQuizCompleted ? Icon(Icons.check) : null,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChapterDetailsPage(chapter: chapter),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
