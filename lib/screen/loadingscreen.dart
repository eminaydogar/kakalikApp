
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kakalik/staticData.dart';
import 'package:audioplayers/audio_cache.dart';

import '../styles.dart';

var liste;
class Loadingscreen extends StatefulWidget {
  @override
  _LoadingscreenState createState() => _LoadingscreenState();
}
class _LoadingscreenState extends State<Loadingscreen> {

  void readData() async
  {
    var FirebaseData=FirebaseDatabase.instance.reference();
    await FirebaseData.once().then( (DataSnapshot datasnapshot) {  Data.dataList=datasnapshot.value;});
  Navigator.pushReplacementNamed(context, '/homescreen');
  }
  void playsound(){
    final sound = new AudioCache();
    sound.play('sounds/intro.wav');
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    playsound();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: loadingcolor,
        child:Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("KAKALIK'A HOŞGELDİNİZ ",style: TextStyle(fontSize: 25.0,color: Colors.orange[200],fontFamily:fonttype1 ),),
              Image.asset('assets/images/animatedkaka.gif',),
              Text("Bilgiler yükleniyor ...",style: TextStyle(fontSize: 18.0,color: Colors.white,letterSpacing: 2),)
            ],
          )
        )
        //  Image.asset('assets/images/waitkaka.gif')
      ),
    );
  }
}
