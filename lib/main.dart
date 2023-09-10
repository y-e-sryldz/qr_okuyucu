import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_okuyucu/qr_sonuc_ekran%C4%B1.dart';
import 'qr_olustur.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff21254A), // App bar rengi
        ),
        scaffoldBackgroundColor: Colors.white, // Ekranın arka plan rengi
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            0xff21254A,
            <int, Color>{
              50: Color(0xff21254A),
              100: Color(0xff21254A),
              200: Color(0xff21254A),
              300: Color(0xff21254A),
              400: Color(0xff21254A),
              500: Color(0xff21254A),
              600: Color(0xff21254A),
              700: Color(0xff21254A),
              800: Color(0xff21254A),
              900: Color(0xff21254A),
            },
          ),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool Tara = false; // QRView'ı göstermek için kullanılacak değişken
  bool Gecmis = true; //Gecmis'ı göstermek için kullanılacak değişken
  bool olustur = false; // olustur'ı göstermek için kullanılacak değişken
  String qrCodeContent = "";

  bool _isAdLoaded = false;

  InterstitialAd? _interstitialAd;
  BannerAd? _bannerAd;
  final String _adUnitId1 = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';
  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  @override
  void initState() {
    super.initState();
    _loadAd1(); // Banner reklamı yükleme işlemi
    _loadAd(context); // Arka planda interstitial reklamı yükleme işlemi
  }

  int _selectedIndex = 1; // İlk seçili sayfa

  Color _appBarColor = Colors.blue; // App bar rengi

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Tara = true;
        Gecmis = false;
        olustur = false;
      } else if (index == 1) {
        Tara = false;
        Gecmis = true;
        olustur = false;
      } else if (index == 2) {
        Tara = false;
        Gecmis = false;
        olustur = true;
      }
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) async {
      qrCodeContent = scanData.code!;
      // QR kod içeriğini inceleme ve veri türünü kontrol etme
      // url
      if (qrCodeContent.startsWith("https://")) {
        controller.pauseCamera();
        _interstitialAd?.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(1, scanData.code!)),
        );
      }
      //kişi
      else if (qrCodeContent.startsWith("BEGIN:VCARD")) {
        print(scanData.code!);
        controller.pauseCamera();
        _interstitialAd?.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(2, scanData.code!)),
        );
      }
      //konum
      else if (qrCodeContent.contains("latitude") ||
          qrCodeContent.contains("longitude") ||
          qrCodeContent.startsWith("http://maps.google.com/maps?q=")) {
        controller.pauseCamera();
        _interstitialAd?.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(3, scanData.code!)),
        );
      }
      //wifi
      else if (qrCodeContent.startsWith("WIFI:")) {
        controller.pauseCamera();
        _interstitialAd?.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(4, scanData.code!)),
        );
      }
      //mail
      else if (qrCodeContent.startsWith("mailto:")) {
        controller.pauseCamera();
        _interstitialAd?.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(5, scanData.code!)),
        );
      }
      //SMS
      else if (qrCodeContent.startsWith("SMSTO:") ||
          qrCodeContent.startsWith("SMS:")) {
        controller.pauseCamera();
        _interstitialAd?.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(6, scanData.code!)),
        );
      }
      //Etkinlik
      else if (qrCodeContent.startsWith("BEGIN:VEVENT") ||
          qrCodeContent.startsWith("BEGIN:VCALENDAR")) {
        controller.pauseCamera();
        _interstitialAd?.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(7, scanData.code!)),
        );
      } else {
        controller.pauseCamera();
        _interstitialAd?.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(8, scanData.code!)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Yellow Star")),
        backgroundColor: _appBarColor,
      ),
      body: Column(
        children: [
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt),
                label: 'Tara',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Geçmiş',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_rounded),
                label: 'QR Oluştur',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.6),
            onTap: _onItemTapped,
          ),
          if (Tara) // QR görüntülemesi açıksa QRView widget'ını göster
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomPaint(
                      painter: QRFramePainter(),
                    ),
                  ),
                ],
              ),
            ),
          if (Gecmis) // QR görüntülemesi açıksa QRView widget'ını göster
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  Text("Geçmiş yapılcak diye kalsın"),
                ],
              ),
            ),
          if (olustur) // QR görüntülemesi açıksa QRView widget'ını göster
            qr_olustur(context)
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

  void _loadAd1() async {
    BannerAd(
      adUnitId: _adUnitId1,
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

  void _loadAd(BuildContext context) async {
    InterstitialAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) {},
                onAdImpression: (ad) {},
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                },
                onAdClicked: (ad) {});
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }
}

class QRFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 210, 210, 210) // Kare rengi
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0; // Kare çerçeve kalınlığı

    final double cornerSize = 40.0; // Köşe boyutu

    final double frameLeft = 125; // Kare sol kenarı
    final double frameTop = 125; // Kare üst kenarı
    final double frameRight = size.width - 125; // Kare sağ kenarı
    final double frameBottom = size.height - 125; // Kare alt kenarı

    // Kare köşelerini dışarı doğru çizin
    canvas.drawLine(Offset(frameLeft - cornerSize, frameTop),
        Offset(frameLeft, frameTop), paint);
    canvas.drawLine(Offset(frameLeft, frameTop - cornerSize),
        Offset(frameLeft, frameTop), paint);

    canvas.drawLine(Offset(frameRight + cornerSize, frameTop),
        Offset(frameRight, frameTop), paint);
    canvas.drawLine(Offset(frameRight, frameTop - cornerSize),
        Offset(frameRight, frameTop), paint);

    canvas.drawLine(Offset(frameLeft - cornerSize, frameBottom),
        Offset(frameLeft, frameBottom), paint);
    canvas.drawLine(Offset(frameLeft, frameBottom + cornerSize),
        Offset(frameLeft, frameBottom), paint);

    canvas.drawLine(Offset(frameRight + cornerSize, frameBottom),
        Offset(frameRight, frameBottom), paint);
    canvas.drawLine(Offset(frameRight, frameBottom + cornerSize),
        Offset(frameRight, frameBottom), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
