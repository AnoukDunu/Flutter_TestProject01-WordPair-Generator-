import 'package:flutter/material.dart';
import './random_words.dart';

//WHY IS GIT NOT WORKING

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    // final wordPair = WordPair.random();

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[900]),
      //calls interface for main page?
      home: RandomWords());
  }
}