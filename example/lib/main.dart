import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nowplaying_plugin/flutter_nowplaying_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Track _track = Track.empty();
  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Track track = Track.empty();
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      track = await FlutterNowplayingPlugin.currentTrack;
      if (!mounted)
        return;
    } on PlatformException {
    }
    setState(() {
      _track =  track;
    });
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }
  updateCurrentTrack() async {
    Track track = Track.empty();
    // Platform messages may fail, so we use a try/catch PlatformException.
    print("log ");
    try {
      track = await FlutterNowplayingPlugin.currentTrack;
    } on PlatformException {
      print("log ");
    }
    setState(() {
      _track =  track;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: new Text('Current Playing Song:\nTitle: ${_track.title}\nAlbum: ${_track.album}\nArtist: ${_track.artist}'),
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: updateCurrentTrack,
            tooltip: "Update Current Track",
            child: new Icon(Icons.update)
        ),
      ),
    );
  }
}
