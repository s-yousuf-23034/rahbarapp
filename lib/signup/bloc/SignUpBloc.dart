import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rahbarapp/login/Login.dart';
import 'package:rahbarapp/signup/ui.dart';
import './SignUpEvent.dart';
import './SignupState.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpUserEvent) {
      yield SignUpLoading();

      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: event.email.toString(),
          password: event.password,
        );
        User? user = userCredential.user;

        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'name': event.name,
            'email': event.email,
            'password': event.password,
          });

          yield SignUpSuccess();
        }
      } catch (e) {
        yield SignUpFailure(error: e.toString());
      }
    }
  }
}
