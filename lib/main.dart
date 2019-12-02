import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jnumap_flutter_app/tab_page.dart';
import 'package:splashscreen/splashscreen.dart';

import 'map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.white,
        accentColor: Colors.blueAccent,
        buttonColor: Colors.green,
        fontFamily: 'NanumMyeongjo',
      ),
      home: SplashPage()
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabPage()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splashmap.jpg'),
          fit: BoxFit.cover
      ),),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}

