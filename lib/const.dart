import 'package:flutter/material.dart';


const String kTitle = 'Карточки Домана';
const String kPlayAppBarTxt = 'Проверь свои знания';
const int kNumRandomElements = 2;

const kTextPlay = Text('Игра',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
const kQuestionTxt = Text('Покажи где', style: TextStyle(fontSize: 55, fontFamily: 'Lobster'));
const kQuestionTxtSmall = Text('Покажи где', style: TextStyle(fontSize: 20, fontFamily: 'Lobster'));

const kTitleAppBar = TextStyle(fontSize: 22,fontFamily: 'Neucha');
const kListTxt = TextStyle(color: Colors.white, fontSize: 22,fontFamily: 'Neucha');
const kRandomItemTxt = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
const kRandomItemTxtSmall = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

const kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purple, Colors.orange]));




