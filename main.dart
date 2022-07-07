//Larissa Iara
//Jeniffer de Sousa
//Ketlin Rayssa
//Rebecca Januario

import 'package:flutter/material.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(ProgQuizz());

//Tela de fundo
class ProgQuizz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Quiz - Lógica de Programação")),
          backgroundColor: Colors.deepPurple.shade200),
      backgroundColor: Colors.deepPurple.shade100,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

//Lógica com as perguntas
class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        quizBrain.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.lightGreen.shade200,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red.shade200,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  //Visual
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //Imagem logo
        Container(
          width: 300,
          height: 300,
          child: Image.network(
              'https://play-lh.googleusercontent.com/NqJM2spIRZl0HQUZuaac9Er57Gh1gKGnSQx4mWaatEAqqr0OgAHOY-ImhWEOlJYxxA=w240-h480-rw'),
        ),
        //Pergunta da vez
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        //Botão de verdadeiro
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.lightGreen.shade200,
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        //Botão de falso
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: FlatButton(
              color: Colors.red.shade200,
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        //Score do jogo
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

class Question {
  String questionText = "";
  bool questionAnswer = true;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
}

//Lista de perguntas
class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        'Podemos acessar os elementos individuais de uma array por meio de uma posição de índice, começando em A.',
        false),
    Question(
        'O operador aritmético de módulo % serve para calcular o resto de uma divisão inteira.',
        true),
    Question(
        'Um laço while não repete o bloco de código associado enquanto um teste lógico realizado retornar verdadeiro.',
        false),
    Question('O operador de concatenação "+" é válido para concatenar strings.',
        true),
    Question(
        'Os estados possíveis que um tipo lógico pode assumir é Verdadeiro e Errado".',
        false),
    Question(
        'Inteiro, Booleano, Caractere, Double são tipos válidos na programação.',
        true),
    Question(
        'Uma variável é um espaço na memória do computador destinado a um dado que é alterado durante a execução do algoritmo.',
        true),
    Question(
        'Para armazenar o estoque de uma loja deve-se utilizar o tipo String.',
        false),
    Question(
        'Algoritmo é uma sequência finita de passos, com objetivo de se resolver um problema.',
        true),
    Question(
        'Uma array é um grupo de variáveis ​​de tipo semelhante que são referidas por um nome comum.',
        true),
    Question(
        'Para adicionar css em uma página HTML, pode-se usar as formas Inline,Interno e Externo',
        true),
    Question('A diferença entre == e === é que == é igual e === é diferente.',
        false),
    Question(
        'Para inserir PHP em uma página HTML basta usar <@php .... @>', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('~ QUIZ FINALIZADO! ~');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
