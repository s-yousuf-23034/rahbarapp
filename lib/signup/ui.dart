import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/login/Login.dart';
import 'package:rahbarapp/signup/bloc/SignUpEvent.dart';
import 'package:rahbarapp/signup/bloc/SignUpState.dart';
import 'package:rahbarapp/widgets/button.dart';
import 'package:rahbarapp/widgets/textformfield.dart';
import 'bloc/SignUpBloc.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegExp regExp = RegExp(SignUp.pattern as String);

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  String? validation() {
    if (name.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Name cannot be Empty',
        ),
      ));
    } else if (name.text.trim().length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Check Your Name'),
        ),
      );
    }

    if (email.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Email cannot be Empty',
        ),
      ));
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Please enter the valid Email',
        ),
      ));
    }
    if (password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Password cannot be Empty',
        ),
      ));
    } else if (password.text.trim().length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password length must be at least 8.'),
        ),
      );
    } else {
      registerUser();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Registered Successfully',
        ),
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
          backgroundColor: Color.fromRGBO(236, 182, 2, 3),
          key: globalKey,
          //backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/welcome.png",
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Create Your Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              MyTextField(
                                value: false,
                                hinttext: 'Your Name',
                                labeltext: 'Name',
                                color: Colors.black,
                                type: TextInputType.text,
                                action: TextInputAction.next,
                                controller: name,
                              ),
                              MyTextField(
                                value: false,
                                hinttext: 'abc@gmail.com',
                                labeltext: 'Email',
                                color: Colors.black,
                                type: TextInputType.emailAddress,
                                action: TextInputAction.next,
                                controller: email,
                              ),
                              MyTextField(
                                value: true,
                                hinttext: 'Password',
                                labeltext: 'Password',
                                color: Colors.black,
                                type: TextInputType.text,
                                action: TextInputAction.done,
                                controller: password,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              MyButton(
                                  buttonName: "SignUp",
                                  color: Color.fromRGBO(85, 24, 93, 9),
                                  textcolor: Colors.white,
                                  onPressed: () {
                                    validation();
                                  }),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Already have an account?"),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                      child: const Text(
                                        "Sign In",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 3, 64, 77),
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> registerUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User user = userCredential.user!;
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': name.text,
        'email': email.text,
        'password': password.text,
      });
      print('User registered successfully!');
    } catch (e) {
      print('Error registering user: $e');
    }
  }
}
