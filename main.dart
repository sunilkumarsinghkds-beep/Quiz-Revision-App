import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Class 10 Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SubjectScreen(),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final Map<String, dynamic> subjects = {
    "Math": {
      "Algebra": [
        {"q": "What is (a+b)² ?", "a": "a² + 2ab + b²"},
        {"q": "Solve: 2x+3=7", "a": "x = 2"},
      ],
      "Geometry": [
        {"q": "Area of Circle?", "a": "πr²"},
      ],
    },
    "Science": {
      "Physics": [
        {"q": "Speed of light?", "a": "3 × 10⁸ m/s"},
        {"q": "Newton’s 2nd law?", "a": "F = ma"},
      ],
      "Chemistry": [
        {"q": "H2O is?", "a": "Water"},
        {"q": "Atomic number of Oxygen?", "a": "8"},
      ],
      "Biology": [
        {"q": "Unit of life?", "a": "Cell"},
        {"q": "Process of making food in plants?", "a": "Photosynthesis"},
      ],
    },
    "SST": {
      "History": [
        {"q": "Who was first President of India?", "a": "Dr. Rajendra Prasad"},
      ],
      "Geography": [
        {"q": "Largest river in India?", "a": "Ganga"},
      ],
      "Political Science": [
        {"q": "India is a ____?", "a": "Republic"},
      ],
      "Economics": [
        {"q": "Father of Economics?", "a": "Adam Smith"},
      ],
      "Disaster Management": [
        {"q": "Earthquake is measured by?", "a": "Richter scale"},
      ],
    },
    "Hindi": {
      "कविता": [
        {"q": "भारत का राष्ट्रीय गान?", "a": "जन गण मन"},
      ],
    },
    "Maithili": {
      "गद्य": [
        {"q": "मैथिली की प्रमुख कवि?", "a": "विद्यापति"},
      ],
    },
    "English": {
      "Grammar": [
        {"q": "Past tense of 'Go'?", "a": "Went"},
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Subject")),
      body: ListView(
        children: subjects.keys.map((subject) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(subject, style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ChapterScreen(subject: subject, chapters: subjects[subject]),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ChapterScreen extends StatelessWidget {
  final String subject;
  final Map<String, dynamic> chapters;

  ChapterScreen({required this.subject, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$subject Chapters")),
      body: ListView(
        children: chapters.keys.map((chapter) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(chapter, style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        QuestionScreen(chapter: chapter, questions: chapters[chapter]),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class QuestionScreen extends StatelessWidget {
  final String chapter;
  final List<Map<String, String>> questions;

  QuestionScreen({required this.chapter, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chapter)),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(questions[index]['q']!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Answer: ${questions[index]['a']}"),
            ),
          );
        },
      ),
    );
  }
}
