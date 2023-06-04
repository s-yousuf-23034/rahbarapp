import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahbarapp/home/bloc/splash_bloc.dart';
import 'package:rahbarapp/math_chapter/bloc/mathchapter_bloc.dart';
import 'package:rahbarapp/math_chapter/bloc/mathchapter_state.dart';
import 'package:rahbarapp/math_chapter/math_chapterlist_screen.dart';
import 'package:rahbarapp/model/math_chapter.dart';
import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MathChapterBloc>(
      create: (context) => MathChapterBloc(),
      child: MaterialApp(
        title: "Rahbar",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        themeMode: ThemeMode.light,
        home: MathChapterListScreen(),
      ),
    );
  }
}
