import 'package:flutter/material.dart';
import 'functions.dart';
import 'dart:io';

AppBar AppBarLearn(title){
  return AppBar(
    title: Center(
      child: Text(title),
    ),
  );
}

Drawer MenuGauche(BuildContext ctx){
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
        ),
        gesture((){Navigator.pushReplacementNamed(ctx, '/');Navigator.pop(ctx);},menuElement('Home',null,Icons.home )),
        gesture((){Navigator.pushReplacementNamed(ctx, '/video');},menuElement('Videos',null,Icons.video_library )),
        gesture((){Navigator.pushReplacementNamed(ctx, '/abc');}, menuElement('Alphabet','assets/images/homepage/ABC.jpg',null )),
        gesture((){Navigator.pushReplacementNamed(ctx, '/123');},menuElement('Count','assets/images/homepage/123.jpg',null )),
        gesture((){Navigator.pushReplacementNamed(ctx, '/animals');},menuElement('Animals','assets/images/homepage/animals.jpg',null )),
        gesture((){Navigator.pushReplacementNamed(ctx, '/color');},menuElement('Color','assets/images/homepage/color.png',null )),
        gesture(()=> exit(0), menuElement('Quit',null,Icons.exit_to_app )),
      ],
    ),
  );
}