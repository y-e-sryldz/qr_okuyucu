import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_okuyucu/main.dart';

class sonuc_ekrani extends StatefulWidget {
  int sira;
  String veri;

  sonuc_ekrani(this.sira, this.veri);

  @override
  State<sonuc_ekrani> createState() => _sonuc_ekraniState();
}

class _sonuc_ekraniState extends State<sonuc_ekrani> {
  int get sira => widget.sira;
  String get veri => widget.veri;
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Yellow Star",
            style: TextStyle(
              color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          if (sira == 1)
            Expanded(
              child: Stack(
                children: [],
              ),
            ),
          if (sira == 2)
            Expanded(
              child: Stack(
                children: [
                  Text("kişi"),
                ],
              ),
            ),
          if (sira == 3)
            Expanded(
              child: Stack(
                children: [
                  Text("kişi"),
                ],
              ),
            ),
          if (sira == 4)
            Expanded(
              child: Stack(
                children: [
                  Text("kişi"),
                ],
              ),
            ),
          if (sira == 5)
            Expanded(
              child: Stack(
                children: [
                  Text("kişi"),
                ],
              ),
            ),
          if (sira == 6)
            Expanded(
              child: Stack(
                children: [
                  Text("kişi"),
                ],
              ),
            ),
          if (sira == 7)
            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Başlık: $summary"),
                      Text("Başlangıç Tarihi: $dtStart"),
                      Text("Bitiş Tarihi: $dtEnd"),
                      Text("Yer: $location"),
                      Text("Açıklama: $description"),
                    ],
                  ),
                ],
              ),
            ),
          if (sira == 8)
            Expanded(
              child: Stack(
                children: [
                  Text("kişi"),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        // Reklamı içeren alt bar
        decoration: BoxDecoration(
          color: Color(
              0xff21254A), // Arka plan rengini istediğiniz gibi ayarlayabilirsiniz
        ),
        //reklam kodu
        child: SafeArea(
          child: _isAdLoaded // _isAdLoaded değişkeni true ise reklamı göster
              ? SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                )
              : SizedBox(), // Reklam yüklenmediyse boş bir SizedBox göster
        ),
      ),
    );
  }

  void _loadAd() async {
    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            _isAdLoaded = true; // Reklam yüklendiğinde değişkeni true yapın
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Diğer listener işlevleri buraya ekleyebilirsiniz
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
