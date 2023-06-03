import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);
}

// abstract class LoginState extends Equatable {
//   const LoginState();

//   @override
//   List<Object> get props => [];
// }

// class LoginInitial extends LoginState {}

// class LoginLoading extends LoginState {}

// class LoginSuccess extends LoginState {
//   final User user;

//   const LoginSuccess({required this.user});

//   @override
//   List<Object> get props => [user];
// }

// class LoginFailure extends LoginState {
//   final String error;

//   const LoginFailure({required this.error});

//   @override
//   List<Object> get props => [error];
// }
