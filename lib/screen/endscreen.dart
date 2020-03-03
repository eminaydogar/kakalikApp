import 'package:flutter/material.dart';
import 'package:kakalik/services/advert-services.dart';
import 'package:kakalik/styles.dart';

class Endscreen extends StatefulWidget {
  @override
  _EndscreenState createState() => _EndscreenState();
}

class _EndscreenState extends State<Endscreen> {

  final AdvertService _reklamlar = new AdvertService();
  @override
  void initState() {
    // TODO: implement initState
   // _reklamlar.showBanner();
    _reklamlar.showIntersitial();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2,1],
                colors: [kirmiziend,maviend])
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Image.asset('assets/images/bye.gif',),
            Text("$second saniye sonunda kakanız bitti ! ",style: endfontsytle),
            Text(" Bu süre zarfında $info adet bilgi ögrendiniz ! ",style:endfontsytle),
            Text(" Sizlerle vakit geçirmekten onur duyuyoruz ! Tekrar görüşmek üzere ... ",style: endfontsytle,textAlign: TextAlign.center,),
            Text(" Bizi desteklemek için reklamları izlemeyi lütfen ihmal etmeyiniz . ",style: TextStyle(fontSize: 13,color: Colors.white),textAlign: TextAlign.center)
          ],),
        ),
      ),
    );
  }
}
