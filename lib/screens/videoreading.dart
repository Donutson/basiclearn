import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'functions.dart';


class VideoPlayerScreen extends StatefulWidget {
  String videoname;
  String videotitle;
  VideoPlayerScreen(this.videoname, this.videotitle);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(videoname, videotitle);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  String videoname;
  String videotitle;
  _VideoPlayerScreenState(this.videoname, this.videotitle);
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool _seeFloatButton;
  double _sliderposition;
  double dureevideo;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset("assets/video/"+ videoname +".mp4");

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    //Initialize variable to display floatactionbutton
    _seeFloatButton = false;

    //Initialize slider position
    _sliderposition = 0.0;

    dureevideo = _controller.value.duration?.inSeconds?.toDouble();


    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dureevideo = _controller.value.duration?.inSeconds?.toDouble();
    var videoscreen = FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return VideoPlayer(_controller);
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
    var slider = Slider(
        value: _sliderposition,
        min: 0.0,
        max: dureevideo ,
        activeColor: Colors.red,
        inactiveColor: Colors.white,
        onChanged: (double d){
          setState(() {
            _sliderposition = d;
          });
          _controller.seekTo(Duration(seconds: d.toInt()));
        });
    var floatbutton = Column(
      mainAxisAlignment: MainAxisAlignment.end,

      children: <Widget>[
        slider,
        FloatingActionButton(
          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();

              }
            });
          },
          // Display the correct icon depending on the state of the player.
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ],
    )
    ;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(videotitle),
        )
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: gesture((){setState( (){
        _seeFloatButton = true;
      });
      Timer(Duration(seconds: 5), () {
        setState( (){
          _seeFloatButton = false;
        });
      });
      ;},
          videoscreen),
      floatingActionButton: _seeFloatButton? floatbutton :null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}