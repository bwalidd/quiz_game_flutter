// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(235, 193, 193, 193),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 141, 125, 53),
          title: const Text(
            "QUIZZZ",
            style: TextStyle(
              fontFamily: 'newfont',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: const Examful(),
        ),
      ),
    );
  }
}

class Examful extends StatefulWidget {
  const Examful({super.key});

  @override
  State<Examful> createState() => _ExamfulState();
}

class _ExamfulState extends State<Examful> {
  List<Widget> answers = [];
  List<Question> mylist = [
      Question('How many planet in our galaxy?', 'images/image-1.jpg', true),
      Question( 'Cats are not vegtarians?', 'images/image-2.jpg', false),
      Question('china is in Africa?',  'images/image-3.jpg', false),
      Question('the earth is flat?', 'images/image-4.jpg', false)
  ];
  int ques = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answers,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(mylist[ques].img),
              SizedBox(
                height: 15,
              ),
              Text(
               mylist[ques].quest,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text(
                "True",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              onPressed: () {
                bool anss = mylist[ques].answer;
                if (anss == true) {
                  answers.add(
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                    ),
                  );
                } else {
                  answers.add(
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                setState(() {
                  if (ques < mylist.length) {
                    ques++;
                  } else {
                    ques = 0;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text(
                "False",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              onPressed: () {
                bool ans = mylist[ques].answer;
                if (ans == false) {
                  answers.add(
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                    ),
                  );
                } else {
                  answers.add(
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                setState(() {
                  if (ques < mylist.length - 1) {
                    ques++;
                  } else {
                    ques = 0;
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
