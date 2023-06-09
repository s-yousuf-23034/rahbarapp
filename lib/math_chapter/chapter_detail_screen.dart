import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/math_chapter/bloc/mathchapter_bloc.dart';
import 'package:rahbarapp/math_chapter/bloc/mathchapter_state.dart';
import 'package:rahbarapp/math_chapter/math_chapterlist_screen.dart';
import 'package:rahbarapp/model/math_chapter.dart';
import 'package:rahbarapp/widgets/button.dart';

class ChapterDetailScreen extends StatelessWidget {
  final MathChapter chapter;

  ChapterDetailScreen({required this.chapter});

  @override
  Widget build(BuildContext context) {
    final mathChapterBloc = BlocProvider.of<MathChapterBloc>(context);
    mathChapterBloc.add(LoadMathChapterDetailsEvent(chapterName: chapter.name));
    print(chapter);

    return Scaffold(
      appBar: AppBar(
          title: Text(chapter.name),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MathChapterListScreen()));
              //Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )),
      body: BlocBuilder<MathChapterBloc, MathChapterState>(
        bloc: mathChapterBloc,
        builder: (context, state) {
          if (state is MathChapterLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MathChapterLoadedState) {
            final chapter = state.chapter;
            return Column(
              children: [
                Text(chapter.name),
                Text(chapter.videoUrl),
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
            );
          } else if (state is MathChapterErrorState) {
            return Text(state.error);
          } else {
            return Text('Failed to load chapter');
          }
        },
      ),
    );
  }
}
