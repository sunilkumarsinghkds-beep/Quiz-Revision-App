import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SubjectScreen(),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final List<String> subjects = [
    "Math",
    "Science (Physics, Chemistry, Biology)",
    "SST (History, Geography, Political Science, Economics, Disaster Management)",
    "Hindi",
    "Maithili",
    "English",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Subject"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(
                subjects[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // यहां subject click होने पर अगला page खुलेगा
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${subjects[index]} selected")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
