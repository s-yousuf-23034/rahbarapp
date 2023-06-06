import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/english_course/bloc/english_bloc.dart';
import 'package:rahbarapp/english_course/bloc/english_event.dart';
import 'package:rahbarapp/english_course/bloc/english_state.dart';
import 'package:rahbarapp/english_course/english_chapterlist.dart';
import 'package:rahbarapp/model/english_chapter.dart';
import 'package:rahbarapp/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

class ChapterDetailScreen extends StatelessWidget {
  final EnglishChapter chapter;

  ChapterDetailScreen({required this.chapter});

  @override
  Widget build(BuildContext context) {
    final englishChapterBloc = BlocProvider.of<EnglishChapterBloc>(context);
    englishChapterBloc
        .add(LoadEnglishChapterDetailsEvent(chapterName: chapter.name));
    print(chapter);

    return Scaffold(
      appBar: AppBar(
          title: Text(chapter.name),
          leading: IconButton(
            onPressed: () {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => EnglishChapterListScreen()));
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )),
      body: BlocBuilder<EnglishChapterBloc, EnglishChapterState>(
        bloc: englishChapterBloc,
        builder: (context, state) {
          if (state is EnglishChapterLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is EnglishChapterLoadedState) {
            final chapter = state.chapter;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(chapter.name),
                  GestureDetector(
                    onTap: () {
                      launch(chapter.videoUrl);
                    },
                    child: Text(
                      chapter.videoUrl,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  MyButton(
                    buttonName: "Start Quiz",
                    color: Color.fromRGBO(85, 24, 93, 9),
                    textcolor: Colors.white,
                    onPressed: () {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => Quiz()));
                    },
                  ),
                  // Add more widgets to display chapter details
                ],
              ),
            );
          } else if (state is EnglishChapterErrorState) {
            return Text(state.error);
          } else {
            return Text('Failed to load chapter');
          }
        },
      ),
    );
  }
}
