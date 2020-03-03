import 'package:flutter/material.dart';
import 'package:kakalik/screen/endscreen.dart';
import 'package:kakalik/screen/homescreen.dart';
import 'package:kakalik/screen/loadingscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/':(context)=>Loadingscreen(),
        '/homescreen':(context)=>HomeScreen(),
        '/endscreen':(context)=>Endscreen()
      },

    );
  }
}
