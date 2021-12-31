import 'package:flutter/material.dart';

import 'model/question.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      appBarTheme:AppBarTheme(
        backgroundColor: Color(0xff071953),
      ),
      scaffoldBackgroundColor: Color(0xff0a0e21),
    ),
    home: Quiz(),
    debugShowCheckedModeBanner: false,
  ));
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776.", true),
    Question.name("The Supreme law of the land is the Constitution.", true),
    Question.name(
        "The two rights in the Declaration of Independence are:"
            "  \n Life  "
            "  \n Pursuit of happiness.",
        true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means:\nYou can practice any religion, "
            "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false), //6
    Question.name("We elect a U.S. Representative for 2 years", true),
    Question.name(
        "A U.S. Senator represents all people of the United States", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ " Father of Our Country " \.', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
       // backgroundColor: Colors.blueGrey,
      ),
     // backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
                  "images/flag.png",
                  width: 250,
                  height: 180,
                )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid)),
                height: 120,
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(fontSize: 16.9, color: Colors.white),
                      ),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _prevQuestion(),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(true, context),
                  child: Text(
                    "TRUE",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false, context),
                  child: Text(
                    "FALSE",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900),
                ),
                ElevatedButton(
                  onPressed: () => _nextQuestion(),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
      // correct answer

      debugPrint("Yes Correct!");
      final snackbar = SnackBar(
        content: const Text("Yes Correct!"),
        backgroundColor: Colors.lightGreen,
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }else{
      debugPrint("Incorrect!");
      final snackbar = SnackBar(
        content: const Text("Incorrect!"),
        backgroundColor: Colors.deepOrange,
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    _updateQuestion();

  }

  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
      // debugPrint("$_currentQuestionIndex");
    });
  }

  _prevQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      // debugPrint("$_currentQuestionIndex");
    });
  }
  _nextQuestion() {
    _updateQuestion();
  }
}