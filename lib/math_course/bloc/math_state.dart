part of 'math_bloc.dart';

abstract class MathState {}

class MathInitialState extends MathState {}

class MathDataState extends MathState {
  final List<Chapter> chapters;

  MathDataState(this.chapters);
}

abstract class Chapter {
  final int id;
  final String title;
  bool isQuizCompleted;
  double progress;

  Chapter(this.id, this.title, this.isQuizCompleted, {this.progress = 0.0});

  Chapter copyWith({bool? isQuizCompleted, double? progress});
}

class ConcreteChapter extends Chapter {
  ConcreteChapter(int id, String title, bool isQuizCompleted,
      {double progress = 0.0})
      : super(id, title, isQuizCompleted, progress: progress);

  @override
  Chapter copyWith({bool? isQuizCompleted, double? progress}) {
    return ConcreteChapter(
      id,
      title,
      isQuizCompleted ?? this.isQuizCompleted,
      progress: progress ?? this.progress,
    );
  }
}
