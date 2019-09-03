import 'package:flutter/material.dart';
import 'functions.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          leading: Text(""),
          backgroundColor:Colors.lightBlueAccent ,
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.video_library,
                  size: 35,
                  color: Colors.indigo,
                ),
                onPressed: (){Navigator.pushNamed(context, '/video');})
          ],
        ),
        body: OrientationBuilder(
                builder: (context, orientation){
                  return GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisSpacing: 10.0,
                    crossAxisCount: orientation == Orientation.portrait? 2 : 4,
                    children: <Widget>[
                      gesture((){Navigator.pushNamed(context, '/abc');},Image.asset("assets/images/homepage/ABC.jpg")),
                      gesture((){Navigator.pushNamed(context, '/123');},Image.asset("assets/images/homepage/123.jpg")),
                      gesture((){Navigator.pushNamed(context, '/color');},Image.asset("assets/images/homepage/color.png")),
                      gesture((){Navigator.pushNamed(context, '/animals');},Image.asset("assets/images/homepage/animals.jpg")),
                    ],
                  );
                }
            )
    );
  }
}