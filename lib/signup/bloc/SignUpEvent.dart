import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpUserEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;

  SignUpUserEvent(
      {required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [name, email, password];
}
