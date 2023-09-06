import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:camera/camera.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
  Barcode? result;
  QRViewController? controller;
  
  late CameraController _cameraController;
  late QRViewController _qrViewController;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
  }

  bool _isAdLoaded = false;

  BannerAd? _bannerAd;
  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  @override
  void initState() {
    super.initState();
    _loadAd();
    _initializeCamera();
  }


  int _selectedIndex = 0; // İlk seçili sayfa
  List<Widget> _widgetOptions = [
    Center(child: Text('Kamera')),
    Center(child: Text('Geçmiş')),
    Center(child: Text('Qr Oluştur')),
  ]; // Widget listesi

  List<String> _appBarTitles = ['Kamera', 'Geçmiş', 'Qr Oluştur'];
  Color _appBarColor = Colors.blue; // App bar rengi

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _appBarColor = Colors.blue; // Her tıklamada maviye geri dön
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_appBarTitles[_selectedIndex])),
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
        ],
      ),
      
      bottomNavigationBar: Container(
        // Reklamı içeren alt bar
        decoration: BoxDecoration(
          color: Color(0xff21254A), // Arka plan rengini istediğiniz gibi ayarlayabilirsiniz
        ),

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
    _cameraController.dispose();
    _qrViewController.dispose();
    _bannerAd?.dispose();
    super.dispose();
  }
}
