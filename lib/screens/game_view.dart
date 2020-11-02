import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";

import 'package:toast/toast.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score = 0;
  final _random = new Random();
  var letras = [
    'A',
    'B',
    'C',
    'D',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  String randomLetter;
  String randomLetterfake1;
  String randomLetterfake2;
  String randomLetterfake3;
  @override
  Widget build(BuildContext context) {
    randomLetter = letras[_random.nextInt(letras.length)];
    randomLetterfake1 = letras[_random.nextInt(letras.length)];
    randomLetterfake2 = letras[_random.nextInt(letras.length)];
    randomLetterfake3 = letras[_random.nextInt(letras.length)];
    final randomOrderedWidgets = [
      Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            child: Image.asset('lib/assets/img/Morse/$randomLetter.png'),
            onTap: () {
              Toast.show("CORRECT", context,
                  duration: Toast.LENGTH_SHORT,
                  gravity: Toast.BOTTOM,
                  textColor: Colors.green);
              print('CORRECT');
              setState(() {
                score++;
              });
            },
          ),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            child: Image.asset('lib/assets/img/Morse/$randomLetterfake1.png'),
            onTap: () {
              Toast.show("INCORRECT", context,
                  duration: Toast.LENGTH_SHORT,
                  gravity: Toast.BOTTOM,
                  textColor: Colors.red);
              print('INCORRECT');
              setState(() {
                score = 0;
              });
            },
          ),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            child: Image.asset('lib/assets/img/Morse/$randomLetterfake2.png'),
            onTap: () {
              Toast.show("INCORRECT", context,
                  duration: Toast.LENGTH_SHORT,
                  gravity: Toast.BOTTOM,
                  textColor: Colors.red);
              print('INCORRECT');
              setState(() {
                score = 0;
              });
            },
          ),
        ),
      )
    ];
    randomOrderedWidgets.shuffle();
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: Text('GUESS THE LETTER!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat')),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  'SCORE: $score',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              )
            ],
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.05),
              child: Text(
                randomLetter,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: []..addAll(randomOrderedWidgets),
          )
        ],
      )),
    );
  }
}
