import 'package:flutter/material.dart';
import 'package:quizzler/quiz_bring.dart';

void main() => runApp(Quizzler());
QuizBring quizBring = QuizBring();

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
  List<Icon> scoreKeeper = [
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
  ];

  void checkAnswer(bool userPickdAnswer) {
    bool correctAnswer = quizBring.getQuestionAns();
    //quizBring.questionBank[questionNumber].questionAnswer;
    //The user picked true.
    userPickdAnswer == correctAnswer
        ? print('User got is Right Answer')
        : print('User got is wrong');
    setState(
      () {
        quizBring.nextQuestion();
        userPickdAnswer == correctAnswer
            ? scoreKeeper.add(
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              )
            : scoreKeeper.add(
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              );
      },
    );
  }

  int questionNumber = 0;
  // List<String> questions = [
  //   'A slug\'s blood is green.',
  //   'Mango is the national fruit of Bangladesh',
  //   'The national flower of Bangladesh is Shapla',
  //   'Hilsa is the national fish of Bangladesh',
  // ];

  // List<bool> answers = [
  //   true,
  //   false,
  //   true,
  //   true,
  // ];

  // Question q1 = Question(
  //   q: 'A slug\'s blood is green.',
  //   a: true,
  // );

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
                //quizBring.questionBank[questionNumber].questionText,
                quizBring.getQuestionText(),

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
                checkAnswer(true);
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
                checkAnswer(true);
                // //The user picked false.
                // bool correctAnswer = quizBring.getQuestionAns();
                // // quizBring.questionBank[questionNumber].questionAnswer;

                // // if (correctAnswer == true) {
                // //   print('User got is Right Answer');
                // // } else {
                // //   print('User got is wrong');
                // // }

                // correctAnswer == false
                //     ? print('User got is Right Answer')
                //     : print('User got is wrong');

                // // setState(() {
                // //   questionNumber++;
                // //   print(questionNumber);

                // // });
                // setState(
                //   () {
                //     quizBring.nextQuestion();
                //     print(questionNumber);

                //     correctAnswer == true
                //         ? scoreKeeper.add(
                //             Icon(
                //               Icons.check,
                //               color: Colors.green,
                //             ),
                //           )
                //         : scoreKeeper.add(
                //             Icon(
                //               Icons.close,
                //               color: Colors.red,
                //             ),
                //           );
                //   },
                // );
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }

  void correctAnswer(bool bool) {}
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
