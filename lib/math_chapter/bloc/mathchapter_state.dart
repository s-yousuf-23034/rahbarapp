import 'package:equatable/equatable.dart';
import 'package:rahbarapp/model/math_chapter.dart';

abstract class MathChapterState extends Equatable {
  const MathChapterState();

  @override
  List<Object?> get props => [];
}

class MathChapterLoadingState extends MathChapterState {}

class MathChapterLoadedState extends MathChapterState {
  final List<MathChapter> mathChapters;
  dynamic chap;
<<<<<<< HEAD
  MathChapterLoadedState(this.mathChapters, {this.chap});
=======
  MathChapterLoadedState(this.mathChapters,{this.chap});
>>>>>>> 1ab4efa6ee64a9fc76de3c1518022deaf0b6b766

  @override
  List<Object?> get props => [mathChapters];

  get chapter => chap;
}

class MathChapterErrorState extends MathChapterState {
  final String error;

  MathChapterErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
