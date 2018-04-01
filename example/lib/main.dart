import 'dart:io' show Platform;

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
    if(Platform.isAndroid) {
      try {
        track = await FlutterNowplayingPlugin.currentTrack;
        if (!mounted)
          return;
      } on PlatformException {}
      setState(() {
        _track = track;
      });
    }
  }

  updateCurrentTrack() async {
    Track track = Track.empty();
    // Platform messages may fail, so we use a try/catch PlatformException.
    if(Platform.isAndroid) {
      try {
        track = await FlutterNowplayingPlugin.currentTrack;
      } on PlatformException {}
    }
    setState(() {
      _track = track;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bodyText = Platform.isAndroid ? new Text(
        'Current Playing Song:\nTitle: ${_track.title}\nAlbum: ${_track
            .album}\nArtist: ${_track.artist}') : new Text(
        "Sorry, iOS is not supported.");
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Center(
          child: bodyText,
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
