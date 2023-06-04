import 'package:flutter/material.dart';
import 'package:rahbarapp/pages/FAQs.dart';
import 'package:rahbarapp/pages/setting.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 60, 5, 69),
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Username', // Replace with your dynamic username
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.calculate),
                      title: Text('Maths Progress'),
                      onTap: () {
                        // Handle navigation to Maths Progress
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text('English Progress'),
                      onTap: () {
                        // Handle navigation to English Progress
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.description),
                      title: Text('Mock Tests'),
                      onTap: () {
                        // Handle navigation to Mock Tests
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.video_call),
                      title: Text('ZOOM Class'),
                      onTap: () {
                        // Handle navigation to ZOOM Class
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsScreen()));
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.question_answer),
                      title: Text('FAQs'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FAQsScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
