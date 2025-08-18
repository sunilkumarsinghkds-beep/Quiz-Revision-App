import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Revision App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SubjectPage(),
    );
  }
}

// ================= SUBJECT PAGE =================
class SubjectPage extends StatelessWidget {
  final List<String> subjects = [
    "Math",
    "Science (Physics, Chemistry, Biology)",
    "SST (History, Geography, Political Science, Economics, Disaster Management)",
    "Hindi",
    "Maithili",
    "English"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Subject")),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subjects[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChapterPage(subject: subjects[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ================= CHAPTER PAGE =================
class ChapterPage extends StatelessWidget {
  final String subject;

  ChapterPage({required this.subject});

  final Map<String, List<String>> chapters = {
    "Math": ["Algebra", "Geometry", "Mensuration"],
    "Science (Physics, Chemistry, Biology)": ["Physics Basics", "Chemistry Basics", "Biology Basics"],
    "SST (History, Geography, Political Science, Economics, Disaster Management)":
        ["History: Ancient India", "Geography: Earth", "Economics: Money", "Disaster Management"],
    "Hindi": ["कविता", "गद्यांश"],
    "Maithili": ["कविता", "निबंध"],
    "English": ["Grammar", "Literature"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: ListView(
        children: chapters[subject]!.map((chapter) {
          return ListTile(
            title: Text(chapter),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      QuestionPage(subject: subject, chapter: chapter),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

// ================= QUESTION PAGE =================
class QuestionPage extends StatelessWidget {
  final String subject;
  final String chapter;

  QuestionPage({required this.subject, required this.chapter});

  final Map<String, List<Map<String, String>>> questions = {
    "Algebra": [
      {
        "q": "What is (a+b)² ?",
        "a": "a² + 2ab + b²"
      },
      {
        "q": "Solve: 2x+3=7",
        "a": "x = 2"
      }
    ],
    "Physics Basics": [
      {
        "q": "What is Newton's First Law?",
        "a": "A body remains at rest or in uniform motion unless acted upon by force."
      },
      {
        "q": "What is the speed of light?",
        "a": "3 × 10⁸ m/s"
      }
    ],
    "कविता": [
      {
        "q": "भारत के प्रसिद्ध कवि का नाम बताओ?",
        "a": "सूरदास, तुलसीदास, कबीर"
      }
    ],
    "Grammar": [
      {
        "q": "What is a noun?",
        "a": "A word used as the name of a person, place, or thing."
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chapter)),
      body: ListView(
        children: questions[chapter] != null
            ? questions[chapter]!.map((qa) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("Q: ${qa['q']}"),
                    subtitle: Text("Ans: ${qa['a']}"),
                  ),
                );
              }).toList()
            : [
                Center(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("No questions added yet."),
                ))
              ],
      ),
    );
  }
}
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
