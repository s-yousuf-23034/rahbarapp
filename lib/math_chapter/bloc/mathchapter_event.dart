part of 'mathchapter_bloc.dart';

abstract class MathChapterEvent extends Equatable {
  // const MathchapterEvent();

  // @override
  // List<Object> get props => [];
}

class StartQuizEvent extends MathChapterEvent {
  final int chapterIndex;

  StartQuizEvent(this.chapterIndex);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
