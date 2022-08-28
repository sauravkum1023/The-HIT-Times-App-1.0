import 'package:flutter/material.dart';
import 'package:the_hit_times/homepage.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "THE New HIT TIMES",
      theme: ThemeData(
        primaryColor: Color(0xFF0FB9B1),
        accentColor: Color(0xFF130f40),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white)
        ),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        //hintColor: Colors.,
        //brightness: Brightness.dark,
      ),
      home: new MainPage(),
    );
  }
}
