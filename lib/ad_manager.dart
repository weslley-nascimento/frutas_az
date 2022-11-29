/*
import 'dart:io';


class AdMobManager {

  //APP ID
  static String _getAdMobAppId() {
    if (Platform.isAndroid) {
      //return '';//ID App
      return 'ca-app-pub-3940256099942544~3347511713';//Teste
    } else if (Platform.isIOS) {
      //return '';//ID App
      return "<YOUR_IOS_ADMOB_APP_ID>";//Teste
    } else {
      return null;
    }
  }

  //BANNER
  //Recupera o ID do BANNER
  static String _getBannerAdId() {
    if (Platform.isAndroid) {
      //return '';//ID Banner
      return 'ca-app-pub-3940256099942544/6300978111';//Teste
    } else if (Platform.isIOS) {
      //return '';//ID Banner
      return 'ca-app-pub-3940256099942544/2934735716';//Teste
    } else {
      return null;
    }
  }

  static BannerAd _homeBannerAd;

  //Cria o BANNER
  static BannerAd _getCreateBannerAd(){
    return BannerAd(
      adUnitId: _getBannerAdId(),
      size: AdSize.smartBanner,
    );
  }

  //Carrega e mostra o Banner na tela
  static void showHomeBannerAd(){
    if (_homeBannerAd == null) {
      _homeBannerAd = _getCreateBannerAd();
    }
    _homeBannerAd
      ..load()
      ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0
      );
  }

  */
/*
  //Função para ocultar o banner
  static void hideHomeBannerAd() async {
    await _homeBannerAd.dispose();
    _homeBannerAd = null;
  }
  *//*


  //INTERSTITIAL
  static String _getInterstitialAdId() {
    if (Platform.isAndroid) {
      //return '';//ID Interstitial
      return 'ca-app-pub-3940256099942544/1033173712';//Teste
    } else if (Platform.isIOS) {
      //return '';//ID Interstitial
      return 'ca-app-pub-3940256099942544/4411468910';//Teste
    } else {
      return null;
    }
  }

  static InterstitialAd _homeInterstitialAd;

  static InterstitialAd getNewTripInterstitial(){
    return InterstitialAd(
      adUnitId: _getInterstitialAdId(),
      listener: (MobileAdEvent event){
        print("InterstitialAd event is $event");
      },
    );
  }

  static void showHomeInterstitialAd(){
    if(_homeInterstitialAd == null){
      _homeInterstitialAd = getNewTripInterstitial();
    }
    _homeInterstitialAd
      ..load()
      ..show(
          anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
          horizontalCenterOffset: 0.0
      );
  }

}*/
