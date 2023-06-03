import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:rahbarapp/login/bloc/LoginEvent.dart';
import 'package:rahbarapp/login/bloc/LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitEvent) {
      yield LoginLoading();

      try {
        // Perform the login logic here
        // You can use Firebase Auth or any other authentication mechanism
        // Replace the code below with your login logic
        await Future.delayed(Duration(seconds: 2));

        // Simulating a successful login
        yield LoginSuccess();
      } catch (e) {
        // Handle login errors
        yield LoginError(e.toString());
      }
    }
  }
}


// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final FirebaseAuth _auth;

//   LoginBloc({required FirebaseAuth auth})
//       : _auth = auth,
//         super(LoginInitial());

//   @override
//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginButtonPressed) {
//       yield* _mapLoginButtonPressedToState(event);
//     }
//   }

//   Stream<LoginState> _mapLoginButtonPressedToState(
//       LoginButtonPressed event) async* {
//     yield LoginLoading();
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: event.email,
//         password: event.password,
//       );
//       yield LoginSuccess(user: userCredential.user!);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         yield LoginFailure(error: 'No user found for that email');
//       } else if (e.code == 'wrong-password') {
//         yield LoginFailure(error: 'Wrong password');
//       } else {
//         yield LoginFailure(error: 'Login failed');
//       }
//     } catch (e) {
//       yield LoginFailure(error: 'Login failed');
//     }
//   }
// }
