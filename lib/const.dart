import 'package:flutter/material.dart';

const String kTitle = 'Карточки Домана';
const String kTextPlay = 'Игра';
const String kPlayAppBarTxt = 'Проверь свои знания';
const int kNumRandomElements = 3;


const kQuestionTxt = Text('Покажи где', style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),);
const kRandomItemTxt = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);

const kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purple, Colors.orange]));

// final kPlayBtn = FloatingActionButton.extended(
//         onPressed: () {},
//         backgroundColor: Colors.green,
//         foregroundColor: Colors.white,
//         label: Text(tTextPlay),
//         icon: Icon(Icons.play_arrow),
//         // backgroundColor: Colors.pink,
//       );

const kTextBold = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
