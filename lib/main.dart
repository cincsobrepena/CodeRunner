import 'package:flutter/material.dart';

void main() {
  runApp(CodeRunner());
}

class CodeRunner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeRunner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CodeRunner'),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: <Widget>[
          CourseCard(
            title: 'Learn Python',
            progress: 0.7,
            // imageUrl: 'https://example.com/python.png',
          ),
          CourseCard(
            title: 'Learn JavaScript',
            progress: 0.5,
            // imageUrl: 'https://example.com/javascript.png',
          ),
          // Add more CourseCards here
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('CodeRunner'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Navigate to home screen
            },
          ),
          ListTile(
            title: Text('Programming Language'),
            onTap: () {
              // Navigate to courses screen
            },
          ),
          // Add more list tiles for other sections
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final double progress;
  // final String imageUrl;

  CourseCard({required this.title, required this.progress});
  // CourseCard({required this.title, required this.progress, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          // Image.network(imageUrl),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: progress,
            ),
          ),
        ],
      ),
    );
  }
}

