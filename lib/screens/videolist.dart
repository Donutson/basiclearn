import 'package:flutter/material.dart';
import 'layouts.dart';
import 'functions.dart';


class VideoListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor:Colors.lightBlueAccent ,
      appBar:  AppBarLearn("Video for learning"),
      drawer: MenuGauche(context),
      body: ListView(
        children: displayVideoslist(context),
      ),
    );
  }

}
