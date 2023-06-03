import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/login/bloc/LoginEvent.dart';
import 'package:rahbarapp/login/bloc/LoginState.dart';
import 'package:rahbarapp/signup/ui.dart';
import 'package:rahbarapp/widgets/button.dart';
import 'package:rahbarapp/widgets/textformfield.dart';
import 'bloc/LoginBloc.dart';
import '../CourseList.dart';

class Login extends StatefulWidget {
  // final FirebaseAuth auth;
  //const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //login funct
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
    return user;
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginBloc _loginBloc;

  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(),
        child: Scaffold(
            backgroundColor: Color.fromRGBO(236, 182, 2, 3),
            body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/welcome.png",
                                  height: 300,
                                  width: 300,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                MyTextField(
                                  hinttext: " abc@gmail.com",
                                  labeltext: "Email",
                                  color: Colors.black,
                                  type: TextInputType.emailAddress,
                                  action: TextInputAction.next,
                                  controller: emailController,
                                  value: false,
                                ),
                                SizedBox(height: 20),
                                MyTextField(
                                  hinttext: "Password",
                                  labeltext: "Password",
                                  color: Colors.black,
                                  type: TextInputType.text,
                                  action: TextInputAction.next,
                                  controller: passwordController,
                                  value: true,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 60, 5, 69),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MyButton(
                                      buttonName: "Login",
                                      color: Color.fromRGBO(85, 24, 93, 9),
                                      textcolor: Colors.white,
                                      onPressed: () async {
                                        // print("Login Button");
                                        User? user =
                                            await loginUsingEmailPassword(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                context: context);
                                        print(user);
                                        if (user != null) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      CourseList())));
                                        }
                                      },
                                    ),
                                    MyButton(
                                      buttonName: "SignUp",
                                      color: Color.fromRGBO(85, 24, 93, 9),
                                      textcolor: Colors.white,
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    SignUp())));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'OR connect with',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Add Google sign-in functionality here
                                      },
                                      child: Container(
                                        width: 300,
                                        height: 50,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Google",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}
//   const Login({Key? key}) : super(key: key);
//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // static Future<User?> loginUsingEmailPassword(
//   //     {required String email,
//   //     required String password,
//   //     required BuildContext context}) async {
//   //   FirebaseAuth auth = FirebaseAuth.instance;
//   //   User? user;
//   //   try {
//   //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
//   //         email: email, password: password);
//   //     user = userCredential.user;
//   //   } on FirebaseAuthException catch (e) {
//   //     if (e.code == "user-not-found") {
//   //       print("No user found for that email");
//   //     }
//   //   }
//   //   return user;
//   // }

//   // final _formKey = GlobalKey<FormState>();
//   // final emailController = TextEditingController();
//   // final passwordController = TextEditingController();

//   // late LoginBloc _loginBloc;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _loginBloc = LoginBloc();
//   // }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   _loginBloc.close();
//   //   emailController.dispose();
//   //   passwordController.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();

//     return BlocProvider(
//       create: (context) => LoginBloc(),
//       child: Scaffold(
//           body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
//         if (state is LoginLoading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state is LoginFailure) {
//           return Center(child: Text(state.error));
//         } else if (state is LoginSuccess) {
//           // return Container();
//           // Navigate to the CourseList page or perform any desired action
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => CourseList()));
//         } else {
//           return SingleChildScrollView(
//               child: Column(children: [
//             Form(
//               child: Column(children: [
//                 Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(children: [
//                       Image.asset(
//                         "assets/images/welcome.png",
//                         height: 300,
//                         width: 300,
//                         fit: BoxFit.cover,
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         'Welcome Back!',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       MyTextField(
//                         hinttext: " abc@gmail.com",
//                         labeltext: "Your Email",
//                         color: Colors.black,
//                         type: TextInputType.emailAddress,
//                         action: TextInputAction.next,
//                         controller: emailController,
//                         value: false,
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       MyTextField(
//                         hinttext: "Password",
//                         labeltext: "Your Password",
//                         color: Colors.black,
//                         type: TextInputType.visiblePassword,
//                         action: TextInputAction.next,
//                         controller: emailController,
//                         value: true,
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: const [
//                           Text("Forgot Password?",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 60, 5, 69),
//                               ))
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                       MyButton(
//                         buttonName: "Login",
//                         color: Color.fromRGBO(85, 24, 93, 9),
//                         textcolor: Colors.white,
//                         onPressed: () {
//                           final email = emailController.text;
//                           final password = passwordController.text;
//                           context.read<LoginBloc>().add(
//                                 LoginButtonPressed(
//                                   email: email,
//                                   password: password,
//                                 ),
//                               );
//                         },
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 // Add Google sign-in functionality here
//                               },
//                               child: Container(
//                                   width: 150,
//                                   height: 50,
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   padding: const EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     color: Colors.red,
//                                     border: Border.all(
//                                       width: 2,
//                                       color: Colors.transparent,
//                                     ),
//                                     borderRadius: BorderRadius.circular(50),
//                                   ),
//                                   child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "  Google",
//                                           style: TextStyle(
//                                               fontSize: 14.0,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold),
//                                         )
//                                       ])),
//                             ),
//                           ]),
//                     ]))
//               ]),
//             )
//           ]));
//         }
//       })),
//     );
//   }













