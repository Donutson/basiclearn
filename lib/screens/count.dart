import 'package:flutter/material.dart';
import 'layouts.dart';
import 'functions.dart';

class CountPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:Colors.lightBlueAccent ,
      appBar:  AppBarLearn("Let's go count"),
      drawer: MenuGauche(context),
      body:GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 3.0,
        crossAxisCount: 3,
        children: displayCount(),
      ),
    );
  }

}