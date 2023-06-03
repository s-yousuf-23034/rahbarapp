part of 'math_bloc.dart';

abstract class MathEvent extends Equatable {
  const MathEvent();

  @override
  List<Object> get props => [];
}

class QuizCompletedEvent extends MathEvent {
  final int chapterId;

  const QuizCompletedEvent(this.chapterId);
}
