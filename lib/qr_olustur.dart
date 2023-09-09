import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
            SizedBox(height: 10,),
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
                      borderRadius: BorderRadius.circular(10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.link_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(height: 8), // İkon ile metin arasında bir boşluk ekleyin
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
                SizedBox(width: 35,),
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
                      borderRadius: BorderRadius.circular(10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_box_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(height: 8), // İkon ile metin arasında bir boşluk ekleyin
                        Text(
                          "VCard",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
            SizedBox(height: 10,),
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
                      borderRadius: BorderRadius.circular(10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(height: 8), // İkon ile metin arasında bir boşluk ekleyin
                        Text(
                          "Konum",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                SizedBox(width: 35,),
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
                      borderRadius: BorderRadius.circular(10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wifi_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(height: 8), // İkon ile metin arasında bir boşluk ekleyin
                        Text(
                          "Wi-Fi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
            SizedBox(height: 10,),
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
                      borderRadius: BorderRadius.circular(10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(height: 8), // İkon ile metin arasında bir boşluk ekleyin
                        Text(
                          "E-Mail",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                SizedBox(width: 35,),
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
                      borderRadius: BorderRadius.circular(10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sms_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(height: 8), // İkon ile metin arasında bir boşluk ekleyin
                        Text(
                          "SMS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
            SizedBox(height: 10,),
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
                      borderRadius: BorderRadius.circular(10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_activity_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(height: 8), // İkon ile metin arasında bir boşluk ekleyin
                        Text(
                          "Etkinlik",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                SizedBox(width: 35,),
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
                      borderRadius: BorderRadius.circular(10), // Köşe yarıçapını ayarlayın
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Gölgelendirme rengi
                          blurRadius: 10, // Gölgelendirme belirginliği
                          offset: Offset(0, 3), // Gölgenin konumu
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_copy_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                          color: Colors.white,
                          size: 48, // İkonun boyutunu ayarlayabilirsiniz
                        ),
                        SizedBox(height: 8), // İkon ile metin arasında bir boşluk ekleyin
                        Text(
                          "Metin",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  )
                ),
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
      body: Column(
        children: [
        
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
      body: Column(
        children: [
        
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
      body: Column(
        children: [
        
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
      body: Column(
        children: [
        
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
      body: Column(
        children: [
        
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
      body: Column(
        children: [
        
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
      body: Column(
        children: [
        
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
      body: Column(
        children: [
        
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
 @override
  void initState() {
    super.initState();
    _loadAd();
  }
}



 