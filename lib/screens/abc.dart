import 'package:flutter/material.dart';
import 'layouts.dart';
import 'functions.dart';


class AbcPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:Colors.lightBlueAccent ,
      appBar:  AppBarLearn("Let's learn alphabet"),
      drawer: MenuGauche(context),
      body:Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 3.0,
          crossAxisCount: 5,
          children: displayAlphabet(),
        ),
      )

    );
  }

}