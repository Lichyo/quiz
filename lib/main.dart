import 'package:flutter/material.dart';
import 'Question.dart';
import 'Score.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent.shade100,
        appBar: AppBar(
          actions: [
           TextButton(
             child: const Icon(Icons.menu, color: Colors.white,),
             onPressed: (){},
           ),
          ],
          backgroundColor: Colors.teal.shade600,
          title: const Text('Quiz'),
        ),
        body: const QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question q1 = Question();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              q1.questionText[q1.questionNumber],
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            color: Colors.teal.shade400,
            child: TextButton(
              child: const Text(
                'True',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(true == q1.questionAnswer[q1.questionNumber])
                    {
                      print('corrected answer.');
                    }
                  else
                    {
                      print('wrong answer.');
                    }
                  if(q1.questionNumber < 2)
                   {
                    q1.questionNumber++;
                   }
                  else if (q1.questionNumber == 2)
                   {
                     q1.questionNumber = 0;
                   }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            color: Colors.teal.shade400,
            child: TextButton(
              child: const Text(
                'False',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(false == q1.questionAnswer[q1.questionNumber])
                  {
                    print('corrected answer.');
                  }
                  else
                  {
                    print('wrong answer.');
                  }
                  if(q1.questionNumber < 2)
                  {
                    q1.questionNumber++;
                  }
                  else if (q1.questionNumber == 2)
                  {
                    q1.questionNumber = 0;
                  }
                });
              },
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        )
      ],
    );
  }
}
