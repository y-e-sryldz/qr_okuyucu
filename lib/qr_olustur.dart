import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_okuyucu/main.dart';

//banner reklam
final String _adUnitId = Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/6300978111'
    : 'ca-app-pub-3940256099942544/2934735716';

Expanded qr_olustur(BuildContext context) {
  return Expanded(
    flex: 8,
    child: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //URL
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => URL(),
                      ),
                    );
                  },
                  child: Container(
                    height: 125,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 6, 85, 131),
                      borderRadius: BorderRadius.circular(
                          10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons
                              .link_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(
                            height:
                                8), // İkon ile metin arasında bir boşluk ekleyin
                        Text(
                          "URL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                //VCard
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VCard(),
                        ),
                      );
                    },
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 85, 131),
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yarıçapını ayarlayın
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Gölgelendirme rengi
                            blurRadius: 10, // Gölgelendirme belirginliği
                            offset: Offset(0, 3), // Gölgenin konumu
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .account_box_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                            color: Colors.white,
                            size: 48, // İkonun boyutunu ayarlayabilirsiniz
                          ),
                          SizedBox(
                              height:
                                  8), // İkon ile metin arasında bir boşluk ekleyin
                          Text(
                            "VCard",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Konum
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Konum(),
                        ),
                      );
                    },
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 85, 131),
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yarıçapını ayarlayın
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Gölgelendirme rengi
                            blurRadius: 10, // Gölgelendirme belirginliği
                            offset: Offset(0, 3), // Gölgenin konumu
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .location_on_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                            color: Colors.white,
                            size: 48, // İkonun boyutunu ayarlayabilirsiniz
                          ),
                          SizedBox(
                              height:
                                  8), // İkon ile metin arasında bir boşluk ekleyin
                          Text(
                            "Konum",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  width: 35,
                ),
                //wi-fi
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Wi_Fi(),
                        ),
                      );
                    },
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 85, 131),
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yarıçapını ayarlayın
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Gölgelendirme rengi
                            blurRadius: 10, // Gölgelendirme belirginliği
                            offset: Offset(0, 3), // Gölgenin konumu
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .wifi_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                            color: Colors.white,
                            size: 48, // İkonun boyutunu ayarlayabilirsiniz
                          ),
                          SizedBox(
                              height:
                                  8), // İkon ile metin arasında bir boşluk ekleyin
                          Text(
                            "Wi-Fi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //E-Mail
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => E_Mail(),
                        ),
                      );
                    },
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 85, 131),
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yarıçapını ayarlayın
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Gölgelendirme rengi
                            blurRadius: 10, // Gölgelendirme belirginliği
                            offset: Offset(0, 3), // Gölgenin konumu
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .mail_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                            color: Colors.white,
                            size: 48, // İkonun boyutunu ayarlayabilirsiniz
                          ),
                          SizedBox(
                              height:
                                  8), // İkon ile metin arasında bir boşluk ekleyin
                          Text(
                            "E-Mail",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  width: 35,
                ),
                //SMS
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SMS(),
                        ),
                      );
                    },
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 85, 131),
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yarıçapını ayarlayın
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Gölgelendirme rengi
                            blurRadius: 10, // Gölgelendirme belirginliği
                            offset: Offset(0, 3), // Gölgenin konumu
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .sms_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                            color: Colors.white,
                            size: 48, // İkonun boyutunu ayarlayabilirsiniz
                          ),
                          SizedBox(
                              height:
                                  8), // İkon ile metin arasında bir boşluk ekleyin
                          Text(
                            "SMS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //etkinlik
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Etkinlik(),
                        ),
                      );
                    },
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 85, 131),
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yarıçapını ayarlayın
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Gölgelendirme rengi
                            blurRadius: 10, // Gölgelendirme belirginliği
                            offset: Offset(0, 3), // Gölgenin konumu
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .local_activity_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                            color: Colors.white,
                            size: 48, // İkonun boyutunu ayarlayabilirsiniz
                          ),
                          SizedBox(
                              height:
                                  8), // İkon ile metin arasında bir boşluk ekleyin
                          Text(
                            "Etkinlik",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  width: 35,
                ),
                //Metin
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Metin(),
                        ),
                      );
                    },
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 85, 131),
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yarıçapını ayarlayın
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Gölgelendirme rengi
                            blurRadius: 10, // Gölgelendirme belirginliği
                            offset: Offset(0, 3), // Gölgenin konumu
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .file_copy_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                            color: Colors.white,
                            size: 48, // İkonun boyutunu ayarlayabilirsiniz
                          ),
                          SizedBox(
                              height:
                                  8), // İkon ile metin arasında bir boşluk ekleyin
                          Text(
                            "Metin",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class URL extends StatefulWidget {
  const URL({super.key});

  @override
  State<URL> createState() => _URLState();
}

class _URLState extends State<URL> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "URL",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "URL",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    _loadAd();
  }
}

class VCard extends StatefulWidget {
  const VCard({super.key});

  @override
  State<VCard> createState() => _VCardState();
}

class _VCardState extends State<VCard> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "URL",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "URL",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Şirket",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Şirket",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Meslek",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Meslek",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Adres",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Adres",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Telefon Numarası",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Telefon Numarası",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "E-Mail",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "E-Mail",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    _loadAd();
  }
}

class Konum extends StatefulWidget {
  const Konum({super.key});

  @override
  State<Konum> createState() => _KonumState();
}

class _KonumState extends State<Konum> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Enlem",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enlem",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Boylam",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Boylam",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    _loadAd();
  }
}

class Wi_Fi extends StatefulWidget {
  const Wi_Fi({super.key});

  @override
  State<Wi_Fi> createState() => _Wi_FiState();
}

class _Wi_FiState extends State<Wi_Fi> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "SSID",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "SSID",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Şifre",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Şifre",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    _loadAd();
  }
}

class E_Mail extends StatefulWidget {
  const E_Mail({super.key});

  @override
  State<E_Mail> createState() => _E_MailState();
}

class _E_MailState extends State<E_Mail> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "E-posta",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "E-posta",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Konu",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Konu",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Mesaj",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Mesaj",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    _loadAd();
  }
}

class SMS extends StatefulWidget {
  const SMS({super.key});

  @override
  State<SMS> createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Tel No",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tel No",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Mesaj",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Mesaj",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    _loadAd();
  }
}

class Etkinlik extends StatefulWidget {
  const Etkinlik({super.key});

  @override
  State<Etkinlik> createState() => _EtkinlikState();
}

class _EtkinlikState extends State<Etkinlik> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Etkinlik Adı",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Etkinlik Adı",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Konum İsmi",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Konum İsmi",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Başlangıç Tarihi",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Başlangıç Tarihi",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Bitiş Tarihi",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Bitiş Tarihi",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Açıklama",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Açıklama",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                ),
              ),
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    _loadAd();
  }
}

class Metin extends StatefulWidget {
  const Metin({super.key});

  @override
  State<Metin> createState() => _MetinState();
}

class _MetinState extends State<Metin> {
  final TextEditingController _textController = TextEditingController();
  String _inputText = '';

  // QR kodu görüntülemek için dialog göstermek için bir işlev
  void _showQRDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('QR Kod Görüntüle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?data=$_inputText&size=200x200',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // QR kodu indirmek için bir işlev ekleyin (örneğin, galeriye kaydetmek için)
                      _downloadQRCode();
                    },
                    child: Text('İndir'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Dialog'u kapat
                    },
                    child: Text('Kapat'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _downloadQRCode() async {
    final url =
        'https://api.qrserver.com/v1/create-qr-code/?data=$_inputText&size=200x200';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final qrPath = '${appDir.path}/qr_code.png';

    File(qrPath).writeAsBytesSync(bytes);

    // QR kodu kaydedildiğini kullanıcıya bildirin
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('QR kodu indirildi: $qrPath'),
      ),
    );
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Metin",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: "Metin",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _inputText = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_inputText.isNotEmpty) {
                    // Metin içeriği doluysa QR kodu görüntüleme dialogunu göster
                    _showQRDialog();
                  } else {
                    // Metin içeriği boşsa kullanıcıya bir hata mesajı göstermek için bir snackbar veya alertDialog gösterebilirsiniz.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Metin içeriği boş olamaz.'),
                      ),
                    );
                  }
                },
                child: Text('QR Kod Oluştur ve Görüntüle'),
              )
            ],
          ),
        ),
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

  @override
  void initState() {
    super.initState();
    _loadAd();
  }
}
