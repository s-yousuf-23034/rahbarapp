import 'package:flutter/material.dart';
import 'package:rahbarapp/Quiz/Question.dart';
import 'package:rahbarapp/Quiz/quiz_upload_page.dart';
import 'package:rahbarapp/Zoom/zoom_announcement.dart';
import 'package:rahbarapp/login/Login.dart';

class AdminSettingsPage extends StatelessWidget {
  final String userName;

  const AdminSettingsPage({Key? key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Admin Setting',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 60, 5, 69),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the ZoomAnnouncementPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ZoomAnnouncementPage(
                        userName: userName,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber, // Set button color to amber
                ),
                child: Text('Go to Zoom Announcements Page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizUploadPage(
                        userName: userName,
                        onUploadQuiz: (List<Question> value) {},
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber, // Set button color to amber
                ),
                child: Text('Go to Quiz Uploading Page'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 60, 5, 69),
        padding: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 24.0), // Adjust the padding here
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the login screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(
              primary: Colors.amber, // Set button color to amber
            ),
          ),
        ),
      ),
    );
  }
}
