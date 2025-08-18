import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SubjectPage(),
    );
  }
}

class SubjectPage extends StatelessWidget {
  final Map<String, Map<String, List<Map<String, String>>>> data = {
    "Math": {
      "Algebra": [
        {"q": "x+2=5, x=?", "a": "3"},
        {"q": "2x=10, x=?", "a": "5"}
      ],
      "Geometry": [
        {"q": "Triangle का sum of angles?", "a": "180°"}
      ],
    },
    "Science": {
      "Physics": [
        {"q": "Speed का formula?", "a": "Distance/Time"}
      ],
      "Chemistry": [
        {"q": "H2O क्या है?", "a": "Water"}
      ],
      "Biology": [
        {"q": "Human Heart के chambers?", "a": "4"}
      ],
    },
    "SST": {
      "History": [
        {"q": "Mughal Empire founder?", "a": "Babur"}
      ],
      "Geography": [
        {"q": "India का सबसे बड़ा state?", "a": "Rajasthan"}
      ],
      "Political Science": [
        {"q": "भारत का संविधान कब लागू हुआ?", "a": "26 January 1950"}
      ],
      "Economics": [
        {"q": "GDP का full form?", "a": "Gross Domestic Product"}
      ],
      "Disaster Management": [
        {"q": "भूकंप किससे मापा जाता है?", "a": "Richter scale"}
      ],
    },
    "Hindi": {
      "गद्यांश": [
        {"q": "‘गोदान’ किसने लिखा?", "a": "मुंशी प्रेमचंद"}
      ],
      "पद्यांश": [
        {"q": "‘मधुशाला’ के कवि?", "a": "हरिवंश राय बच्चन"}
      ],
      "व्याकरण": [
        {"q": "संज्ञा कितने प्रकार की होती है?", "a": "5"}
      ],
    },
    "Maithili": {
      "गद्यांश": [
        {"q": "विद्यापति किस भाषा के कवि थे?", "a": "मैथिली"}
      ],
      "पद्यांश": [
        {"q": "मैथिली साहित्य के आदिकवि?", "a": "विद्यापति"}
      ],
      "व्याकरण": [
        {"q": "मैथिली में स्वर कितने हैं?", "a": "12"}
      ],
    },
    "English": {
      "Prose": [
        {"q": "Who wrote Hamlet?", "a": "William Shakespeare"}
      ],
      "Poetry": [
        {"q": "Poet of ‘Daffodils’?", "a": "William Wordsworth"}
      ],
      "Grammar": [
        {"q": "Plural of Mouse?", "a": "Mice"}
      ],
    }
  };

  SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subjects")),
      body: ListView(
        children: data.keys.map((subject) {
          return ListTile(
            title: Text(subject),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChapterPage(subject: subject, chapters: data[subject]!),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class ChapterPage extends StatelessWidget {
  final String subject;
  final Map<String, List<Map<String, String>>> chapters;

  const ChapterPage({super.key, required this.subject, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: ListView(
        children: chapters.keys.map((chapter) {
          return ListTile(
            title: Text(chapter),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionPage(chapter: chapter, questions: chapters[chapter]!),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class QuestionPage extends StatelessWidget {
  final String chapter;
  final List<Map<String, String>> questions;

  const QuestionPage({super.key, required this.chapter, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chapter)),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(questions[index]["q"]!),
              subtitle: Text("Answer: ${questions[index]["a"]!}"),
            ),
          );
        },
      ),
    );
  }
}
