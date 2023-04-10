import 'package:custom_video_player/src/source/video_loading_style.dart';
import 'package:custom_video_player/src/source/video_style.dart';
import 'package:custom_video_player/src/video.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool fullscreen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: fullscreen == false
            ? AppBar(
                backgroundColor: Colors.blue,
                title: Text('Video Player'),
                centerTitle: true,
              )
            : null,
        body: Column(
          children: [
            CustomVideoPlayer(
              aspectRatio: 16 / 9,
              url:
                  // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                  // "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
                  // "https://player.vimeo.com/external/440218055.m3u8?s=7ec886b4db9c3a52e0e7f5f917ba7287685ef67f&oauth2_token_id=1360367101",
                  "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
              videoStyle: VideoStyle(),
              videoLoadingStyle: VideoLoadingStyle(
                loading: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('image/app_logo.png'),
                        fit: BoxFit.fitHeight,
                        height: 50,
                      ),
                      Text("Loading video"),
                    ],
                  ),
                ),
              ),
              onFullScreen: (t) {
                setState(() {
                  fullscreen = t;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
