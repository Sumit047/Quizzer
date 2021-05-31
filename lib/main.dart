import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizquestions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> storevalues=[

  ];
  // List<String> questions=['You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.', ];
  // List<bool> qans=[
  //   false,true,true
  // ];
  // Question q1=Question(q: 'hell',a: false);
  // List<Question> qsbank=[
  //   Question(q: 'You can lead a cow down stairs but not up stairs.',a: false),
  // Question(q: 'Approximately one quarter of human bones are in the feet.',a: true),
  // Question(q: 'A slug\'s blood is green.',a: true)
  //
  // ];
  Quizqs quiz=Quizqs();
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quiz.getanswertext();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quiz.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quiz.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        storevalues = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          storevalues.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          storevalues.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quiz.nextQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getquestionsText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  // storevalues.add(
                  //     Icon(
                  //       Icons.check, color:Colors.green
                  // ),
                  //
                  // );
                  checkAnswer(true);

                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  // storevalues.add(
                  //   Icon(
                  //       Icons.close, color:Colors.red
                  //   ),
                  // );
                  checkAnswer(false);
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: storevalues,
        )
      ],
    );
  }
}




