//Might subject to be delete

import 'dart:async';
import 'package:complete_recorder/App%20Pages/record_list.dart';
import 'package:flutter/material.dart';

class SplashScreenRecording extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenRecordingState createState() => _SplashScreenRecordingState();
}

class _SplashScreenRecordingState extends State<SplashScreenRecording> {

  _loadWidget() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => RecordList()));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.purple[600], Colors.pink, Colors. red[600]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              SizedBox(
                height: 40.0,
                width: 40.0,
              ),
              Text(
                'Saving',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
