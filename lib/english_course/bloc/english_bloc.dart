import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'english_event.dart';
part 'english_state.dart';

class EnglishBloc extends Bloc<EnglishEvent, EnglishState> {
  EnglishBloc() : super(EnglishInitial()) {
    on<EnglishEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
