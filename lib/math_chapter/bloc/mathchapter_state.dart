part of 'mathchapter_bloc.dart';

abstract class MathChapterState extends Equatable {
  // const MathchapterState();

  // @override
  // List<Object> get props => [];
}

class MathChapterLoadingState extends MathChapterState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MathChapterLoadedState extends MathChapterState {
  final List<MathChapter> mathChapters;

  MathChapterLoadedState(this.mathChapters);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class QuizStartedState extends MathChapterState {
  final int chapterIndex;

  QuizStartedState(this.chapterIndex);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
