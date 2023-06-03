import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rahbarapp/model/math_chapter.dart';

part 'mathchapter_event.dart';
part 'mathchapter_state.dart';

class MathChapterBloc extends Bloc<MathChapterEvent, MathChapterState> {
  List<MathChapter> mathChapters = [
    MathChapter(
        name: 'Algebra',
        videoUrl: 'https://example.com/algebra',
        quizAttempted: false),
    MathChapter(
        name: 'Average',
        videoUrl: 'https://example.com/average',
        quizAttempted: false),
    MathChapter(
        name: 'Percentage',
        videoUrl: 'https://example.com/percentage',
        quizAttempted: false),
  ];
  MathChapterState get initialState => MathChapterLoadedState(mathChapters);
  MathChapterBloc(super.initialState);

  @override
  Stream<MathChapterState> mapEventToState(MathChapterEvent event) async* {
    if (event is StartQuizEvent) {
      yield QuizStartedState(event.chapterIndex);
    }
  }
}
