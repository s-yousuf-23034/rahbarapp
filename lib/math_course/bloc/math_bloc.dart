import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'math_event.dart';
part 'math_state.dart';

class MathBloc extends Bloc<MathEvent, MathState> {
  MathBloc() : super(MathInitialState());

  @override
  Stream<MathState> mapEventToState(MathEvent event) async* {
    if (event is QuizCompletedEvent) {
      final currentState = state;
      if (currentState is MathDataState) {
        final updatedChapters = currentState.chapters.map((chapter) {
          if (chapter.id == event.chapterId) {
            return chapter.copyWith(isQuizCompleted: true, progress: 100.0);
          }
          return chapter;
        }).toList();
        yield MathDataState(updatedChapters);
      }
    }
  }
}