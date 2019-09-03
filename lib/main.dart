import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/abc.dart';
import 'screens/count.dart';
import 'screens/color.dart';
import 'screens/animals.dart';
import 'screens/videolist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Learn',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/abc': (BuildContext context) => AbcPage() ,
        '/123': (BuildContext context) => CountPage(),
        '/color': (BuildContext context) => ColorPage(),
        '/animals': (BuildContext context) => AnimalsPage(),
        '/video': (BuildContext context) => VideoListPage(),
      },
    );
  }
}


