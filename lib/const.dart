import 'package:flutter/material.dart';


const String kTitle = 'Карточки Домана';
const String kPlayAppBarTxt = 'Проверь свои знания';
const int kNumRandomElements = 3;

const kTextPlay = Text('Игра',style: TextStyle(fontWeight: FontWeight.bold),);
const kQuestionTxt = Text('Покажи где', style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),);

const kRandomItemTxt = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
const kTextBold = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

const kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purple, Colors.orange]));




