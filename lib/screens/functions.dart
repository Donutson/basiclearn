import 'package:flutter/material.dart';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'videoreading.dart';


AudioCache audioPlayer = AudioCache();
toplay(String cat, String name){
  String path = "audio/";
  path += cat + "/"+ name +".mp3";
  play() async {
    audioPlayer.play(path);
  }
  return play;

}


ListTile menuElement(String titre,String imagelink, IconData icon){
  var display = icon != null ? Icon(icon,): Image.asset(imagelink, height: 25, width: 25,);
  return ListTile(
    leading: display,
    title: Text(titre,
      textScaleFactor: 1.3,
    ),
  );
}

GestureDetector gesture(Function action, Widget child){
  return GestureDetector(
    onTap: action ,
    child:child,
  );
}


List<Widget> displayAlphabet(){
  List<Widget> alphabet = new List<Widget>();
  int ind = 65;
  String letter;
  do{
    letter=new String.fromCharCode(ind);
    var play = toplay("alphabet", letter);
    var element = Center(
      child: Text(letter,
        textScaleFactor: 4,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurpleAccent.withOpacity(0.7),
        ),
      )
    );
    alphabet.add(gesture(play,element));
    ind++;
  }while(letter != "Z");
  return alphabet;
}


List<Widget> displayAnimals(){
  List<Widget> animals = new List<Widget>();
  for(int i=1; i<=10; i++){
    var play = toplay("animals", i.toString());
    animals.add(gesture(play ,Image.asset("assets/images/animals/"+ i.toString() + ".jpg",
    )),);
  }
  return animals;
}


List<Widget> displayColors(){
  List<Widget> colors = new List<Widget>();
  //var liste = listFilesFrom("..");
  //print(liste);
  for(int i=1; i<=6; i++){
    var play = toplay("color", i.toString());
    colors.add(gesture(play ,Image.asset("assets/images/color/"+ i.toString() + ".png",
    )),);
  }
  return colors;
}


List<Widget> displayCount(){
  List<Widget> count = new List<Widget>();
  for(int i=0; i<=10; i++){
    var play = toplay("count", i.toString());
    var element =Center(
      child: Text(i.toString(),
        textScaleFactor: 3.5,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurpleAccent.withOpacity(0.7),
        ),
      )
    );
    count.add(gesture(play ,element),);
  }
  return count;
}

List<Widget> displayVideoslist(ctx){
  List<Widget> videoslist = new List<Widget>();
  for(int i=1; i<=10; i++){
    var action =(){
      Navigator.push(
        ctx,
        MaterialPageRoute(builder: (ctx) => new VideoPlayerScreen(i.toString(), 'Learning '+ i.toString())),
      );
    };
    videoslist.add(gesture(action ,menuElement('Learning '+ i.toString(),null,Icons.video_library )),);
  }
  return videoslist;
}


List<String> listFilesFrom( String directory){
  List<String> listfiles = new List<String>();
  var dir = Directory(directory);
  // List directory contents
  List contents = dir.listSync();
  for (var fileOrDir in contents) {
    listfiles.add(fileOrDir.path.substring(directory.length + 1));
  }
  return listfiles;
}


