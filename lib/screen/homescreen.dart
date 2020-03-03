
import 'dart:async';
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:kakalik/staticData.dart';
import 'package:kakalik/styles.dart';






class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 // bool state=false;

  List<dynamic> data= new List();
  List<String> choosedata=["iba","ck"];
  int imagechild=1;
  List<String> poopname =['JOE','SUSAN','PATRICK','ARTHUR','LOBA', 'GEORGE','PENNY','KENNY','MOE & MONE'];
  final player =  new AudioCache();
  Random rd = new Random();
  int listElement=0;
  int dataElement=0;
  var datalist=Data.dataList;
  bool state=true;


  void animatedchild()  {
    setState(() {
      player.play('sounds/pageflip.wav');
      state=!state;
      imagechild++;
      if(imagechild==10) { imagechild=1; }
      listElement=rd.nextInt(datalist.length-1)+1;
      dataElement=rd.nextInt(2);
      info=info+1;
    });
  }


  void starttimer(){
    Timer(Duration(seconds:1),timerfunc);
  }
  timerfunc(){
    second=second+1;
    starttimer();
  }

void finishkaka(){
    Navigator.pushReplacementNamed(context, '/endscreen');

}





  @override
  void initState() {
    super.initState();
   listElement=rd.nextInt(100)+1;
  starttimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarkakalik,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7,0.8,1],
                colors: [mavi,mavi2,mavi3])
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              AnimatedCrossFade(duration: Duration(milliseconds: 800),
                  firstChild: Column(
                children: <Widget>[
                  Image.asset('assets/images/kaka$imagechild.gif',scale: 2.2,),
                  Text("${poopname[imagechild-1]}",style: TextStyle(color: Colors.orange[200],fontSize: 25,fontFamily: fonttype1),)
                ],
              ),
              secondChild: Text("KAKALIK"),
                  crossFadeState: CrossFadeState.showFirst
              ),
              AnimatedCrossFade(duration: Duration(milliseconds: 800),
              firstChild: Text("${datalist[listElement][choosedata[dataElement]]}",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily:fonttype2),textAlign: TextAlign.center,),
                secondChild: Text("${datalist[listElement][choosedata[dataElement]]}",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily:fonttype2),textAlign: TextAlign.center,),
                crossFadeState: state ? CrossFadeState.showSecond : CrossFadeState.showFirst
              ),
            Row(
              children: <Widget>[
                Expanded(child: OutlineButton( borderSide:buttonborderside
                  , child: Text("Kakayı Bitir",style: TextStyle(color: Colors.red[300]),),
                  onPressed:finishkaka,
                ),
                ),
                Expanded(child: OutlineButton( borderSide:buttonborderside,child: Text("Kaka Yapmaya Devam Et ",style: TextStyle(color: Colors.green[300])),
                onPressed:animatedchild,

                ),
                )
              ],
            )
            ],
          ),
        ),
      ),
    );

  }
}
