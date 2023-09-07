import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_okuyucu/sonuc_ekran%C4%B1.dart';

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
  bool _showQRView = false; // QRView'ı göstermek için kullanılacak değişken
  String qrCodeContent = "";

  bool _isAdLoaded = false;

  BannerAd? _bannerAd;
  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  int _selectedIndex = 1; // İlk seçili sayfa

  Color _appBarColor = Colors.blue; // App bar rengi

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _showQRView = true; // Kamera ikonuna tıklandığında QRView'ı göster
      } else {
        _showQRView = false; // Diğer sekmelere tıklanınca QRView'ı kapat
      }
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {});

    controller.scannedDataStream.listen((scanData) {
      qrCodeContent = scanData.code!;
      // QR kod içeriğini inceleme ve veri türünü kontrol etme
      //url
      if (qrCodeContent.startsWith("https://")) {
        controller.pauseCamera();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(1, scanData.code!)),
        );
      } //kişi
      else if (qrCodeContent.startsWith("BEGIN:VCARD")) {
        print(scanData.code!);
        controller.pauseCamera();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => sonuc_ekrani(2, scanData.code!)),
        );
      } //konum
      else if (qrCodeContent.contains("latitude") ||
          qrCodeContent.contains("longitude") ||
          qrCodeContent.startsWith("http://maps.google.com/maps?q=")) {
        // QR kod bir Google Haritalar konum URL'si içeriyorsa
        String coordinates =
            qrCodeContent.substring("http://maps.google.com/maps?q=".length);
        // Koordinatları ayır
        List<String> parts = coordinates.split(",");
        if (parts.length == 2) {
          String latitude = parts[0];
          String longitude = parts[1];

          // Google Haritalar'da konumu açmak için URL oluştur
          String mapUrl = "http://maps.google.com/maps?q=$latitude,$longitude";
        }
        controller.pauseCamera();
      } else if (qrCodeContent.startsWith("WIFI:")) {
        // QR kod bir Wi-Fi bağlantısı içeriyorsa
        List<String> parts = qrCodeContent.split(';');
        String ssid = "";
        String password = "";

        for (String part in parts) {
          if (part.startsWith("S:")) {
            ssid = part.substring(2);
          } else if (part.startsWith("P:")) {
            password = part.substring(2);
          }
        }

        if (ssid.isNotEmpty) {
          print("SSID: $ssid");
        }
        if (password.isNotEmpty) {
          print("Şifre: $password");
        }
        controller.pauseCamera();
      }
      //mail
      else if (qrCodeContent.startsWith("mailto:")) {
        // "mailto:" kısmını atlayın
        qrCodeContent = qrCodeContent.substring(7);

        // E-posta adresini ayıklayın
        int emailEndIndex = qrCodeContent.indexOf("?");
        String emailAddress = qrCodeContent.substring(0, emailEndIndex);

        // E-posta konusu ve içeriğini ayıklayın (varsa)
        String emailSubject = "";
        String emailBody = "";

        int subjectIndex = qrCodeContent.indexOf("subject=");
        if (subjectIndex != -1) {
          int bodyIndex = qrCodeContent.indexOf("&body=");
          if (bodyIndex != -1) {
            emailSubject = qrCodeContent.substring(subjectIndex + 8, bodyIndex);
            emailBody = qrCodeContent.substring(bodyIndex + 6);
          } else {
            emailSubject = qrCodeContent.substring(subjectIndex + 8);
          }
        } else {
          int bodyIndex = qrCodeContent.indexOf("&body=");
          if (bodyIndex != -1) {
            emailBody = qrCodeContent.substring(bodyIndex + 6);
          }
        }

        // Ayıklanan bilgileri kullanabilirsiniz
        print("E-posta Adresi: $emailAddress");
        print("Konu: $emailSubject");
        print("İçerik: $emailBody");
        controller.pauseCamera();
      }
      //SMS
      else if (qrCodeContent.startsWith("SMSTO:") ||
          qrCodeContent.startsWith("SMS:")) {
        // "smsto:" veya "sms:" kısmını atlayın
        qrCodeContent = qrCodeContent.substring(qrCodeContent.indexOf(":") + 1);

        // SMS alıcısını ve mesaj içeriğini ayıklayın
        int messageBodyIndex = qrCodeContent.indexOf(":");
        if (messageBodyIndex != -1) {
          String recipient = qrCodeContent.substring(0, messageBodyIndex);
          String messageBody = qrCodeContent.substring(messageBodyIndex + 1);

          // Ayıklanan bilgileri kullanabilirsiniz
          print("Alıcı: $recipient");
          print("Mesaj İçeriği: $messageBody");
        } else {
          // SMS içeriği bulunamadı
          print("Bu bir SMS QR kodu değil.");
        }
        controller.pauseCamera();
      }
      //Etkinlik
      else if (qrCodeContent.startsWith("BEGIN:VEVENT") ||
          qrCodeContent.startsWith("BEGIN:VCALENDAR")) {
        // QR kod etkinlik bilgisi içeriyorsa
        // İçerikten etkinlik ayrıntılarını çıkarın

        List<String> lines = qrCodeContent.split('\n');

        String summary = "";
        String location = "";
        String dtStart = "";
        String dtEnd = "";
        String description = "";

        for (String line in lines) {
          if (line.startsWith("SUMMARY:")) {
            summary = line.substring("SUMMARY:".length);
          } else if (line.startsWith("LOCATION:")) {
            location = line.substring("LOCATION:".length);
          } else if (line.startsWith("DTSTART:")) {
            dtStart = line.substring("DTSTART:".length);
          } else if (line.startsWith("DTEND:")) {
            dtEnd = line.substring("DTEND:".length);
          } else if (line.startsWith("DESCRIPTION:")) {
            description = line.substring("DESCRIPTION:".length);
          }
        }
        print(summary);
        print(dtStart);
        print(dtEnd);
        print(location);
        print(description);
        // Etkinlik bilgilerini kullanın veya gösterin
        controller.pauseCamera();
      } else {
        // İçeriği belirli bir formata uyduramıyorsanız veya
        // farklı bir veri türü temsil ediyorsa, gereken işlemi yapın,
        print("AAAAAAAAAAAAAAAAAAAA");
        print(scanData.code!);
        controller.pauseCamera();
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
          if (_showQRView) // QR görüntülemesi açıksa QRView widget'ını göster
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
