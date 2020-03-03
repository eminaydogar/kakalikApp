import 'package:firebase_admob/firebase_admob.dart';

class AdvertService{
  static final AdvertService _instance = AdvertService._internal();
  factory AdvertService() => _instance;
  final String bannerkey="ca-app-pub-7229142027021649/1092913956";
  final String geciskey="ca-app-pub-7229142027021649/8421218566";
  MobileAdTargetingInfo _targetingInfo;

  AdvertService._internal(){
    _targetingInfo=MobileAdTargetingInfo();
  }

  showBanner(){
    BannerAd banner = new BannerAd(adUnitId:bannerkey, size: AdSize.smartBanner,
    targetingInfo: _targetingInfo
    );
banner
  ..load()
  ..show();
banner.dispose();
  }
showIntersitial(){
    InterstitialAd interstitialAd = InterstitialAd(
      adUnitId: geciskey,targetingInfo: _targetingInfo
    );
    interstitialAd
      ..load()
    ..show();
    interstitialAd.dispose();
}
}
