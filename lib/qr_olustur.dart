import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';

//banner reklam
final String _adUnitId = Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/6300978111'
    : '';

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
  String _inputText = '';
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  void _showQRDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'QR Kod Görüntüle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
                      Navigator.of(context).pop(); // Dialog'u kapat
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
    final qrPath = appDir.path;
    int fileIndex = 1;

    // Aynı ada sahip dosya zaten varsa, bir sonraki sıraya geçin
    while (await File('$qrPath/qr_code_$fileIndex.png').exists()) {
      fileIndex++;
    }

    final finalQrPath = '$qrPath/qr_code_$fileIndex.png';

    File(finalQrPath).writeAsBytesSync(bytes);

    // Dosyayı galeriye ekleyin
    final result = await ImageGallerySaver.saveFile(finalQrPath);

    if (result != null && result.isNotEmpty) {
      // Başarıyla kaydedildiğini bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedildi.'),
        ),
      );
    } else {
      // Hata durumunda bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedilemedi.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Başlık metnini tam ortada hizalamak için
        title: Text(
          "Yellow Star",
          style: TextStyle(
            color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
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
                    if (isURL(_inputText)) {
                      // Metin bir URL ise QR kodu görüntüleme dialogunu göster
                      _showQRDialog();
                    } else {
                      // Metin bir URL değilse hata mesajı göster
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Geçerli bir URL değil.'),
                        ),
                      );
                    }
                  } else {
                    // Metin içeriği boşsa hata mesajı göster
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

  bool isURL(String text) {
    // URL'nin geçerli bir URL formatına sahip olup olmadığını doğrulama
    Uri? uri = Uri.tryParse(text);
    if (uri != null && uri.hasScheme && uri.hasAuthority) {
      return true;
    }
    return false;
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
  String IsimSoyisim = '';
  String Sirket = '';
  String Meslek = '';
  String Adres = '';
  String TelNo = '';
  String E_Mail = '';
  String KisiBilgisi = '';

  void _showQRDialog() {
    // Her bir veriyi ayrı stringlerde saklayın
    String fn = 'FN:$IsimSoyisim';
    String org = 'ORG:$Sirket';
    String title = 'TITLE:$Meslek';
    String adr = 'ADR:$Adres';
    String tel = 'TEL;CELL:$TelNo';
    String email = 'EMAIL;WORK;INTERNET:$E_Mail';

    // Tüm verileri birleştirin
    KisiBilgisi =
        'BEGIN:VCARD\n$fn\n$org\n$title\n$adr\n$tel\n$email\nEND:VCARD';

    // QR kodunu oluşturun ve görüntülemek için dialog gösterin
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'QR Kod Görüntüle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?data=$KisiBilgisi&size=200x200',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _downloadQRCode(); // QR kodu indirmek için bir işlev ekleyin (örneğin, galeriye kaydetmek için)
                      Navigator.of(context).pop(); // Dialog'u kapat
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
        'https://api.qrserver.com/v1/create-qr-code/?data=$KisiBilgisi&size=200x200';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final qrPath = appDir.path;
    int fileIndex = 1;

    // Aynı ada sahip dosya zaten varsa, bir sonraki sıraya geçin
    while (await File('$qrPath/qr_code_$fileIndex.png').exists()) {
      fileIndex++;
    }

    final finalQrPath = '$qrPath/qr_code_$fileIndex.png';

    File(finalQrPath).writeAsBytesSync(bytes);

    // Dosyayı galeriye ekleyin
    final result = await ImageGallerySaver.saveFile(finalQrPath);

    if (result != null && result.isNotEmpty) {
      // Başarıyla kaydedildiğini bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedildi.'),
        ),
      );
    } else {
      // Hata durumunda bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedilemedi.'),
        ),
      );
    }
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Başlık metnini tam ortada hizalamak için
        title: Text(
          "Yellow Star",
          style: TextStyle(
            color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);;
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
                "İsim Soyisim",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "İsim Soyisim",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                  onChanged: (value) {
                    setState(() {
                      IsimSoyisim = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      Sirket = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      Meslek = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      Adres = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      TelNo = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      E_Mail = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (IsimSoyisim.isNotEmpty) {
                        // Metin içeriği doluysa QR kodu görüntüleme dialogunu göster
                        _showQRDialog();
                      } else {
                        // Metin içeriği boşsa kullanıcıya bir hata mesajı göstermek için bir snackbar veya alertDialog gösterebilirsiniz.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('İsim Soyisim alanı boş olamaz.'),
                          ),
                        );
                      }
                    },
                    child: Text('QR Kod Oluştur ve Görüntüle'),
                  ),
                  Spacer(),
                ],
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

class Konum extends StatefulWidget {
  const Konum({super.key});

  @override
  State<Konum> createState() => _KonumState();
}

class _KonumState extends State<Konum> {
  double latitude = 1.8936080275545206; // Enlem (Latitude)
  double longitude = -157.41142375909914; // Boylam (Longitude)
  String locationName = 'Denizin Ortası ne bakıyon'; // Konum adı

  String locationQRCodeData = '';

  void _showQRDialog() {
    locationQRCodeData = 'geo:$latitude,$longitude?q=$locationName';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Konum QR Kodu Görüntüle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?data=$locationQRCodeData&size=200x200',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _downloadQRCode(); // QR kodu indirmek için bir işlev ekleyin (örneğin, galeriye kaydetmek için)
                      Navigator.of(context).pop(); // Dialog'u kapat
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
        'https://api.qrserver.com/v1/create-qr-code/?data=$locationQRCodeData&size=200x200';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final qrPath = appDir.path;
    int fileIndex = 1;

    // Aynı ada sahip dosya zaten varsa, bir sonraki sıraya geçin
    while (await File('$qrPath/qr_code_$fileIndex.png').exists()) {
      fileIndex++;
    }

    final finalQrPath = '$qrPath/qr_code_$fileIndex.png';

    File(finalQrPath).writeAsBytesSync(bytes);

    // Dosyayı galeriye ekleyin
    final result = await ImageGallerySaver.saveFile(finalQrPath);

    if (result != null && result.isNotEmpty) {
      // Başarıyla kaydedildiğini bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedildi.'),
        ),
      );
    } else {
      // Hata durumunda bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedilemedi.'),
        ),
      );
    }
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Başlık metnini tam ortada hizalamak için
        title: Text(
          "Yellow Star",
          style: TextStyle(
            color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
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
                "Konum Adı",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Konum Adı",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                  onChanged: (value) {
                    setState(() {
                      latitude = value as double;
                    });
                  },
                ),
              ),
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
                  onChanged: (value) {
                    setState(() {
                      latitude = value as double;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      longitude = value as double;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      _showQRDialog();
                    },
                    child: Text('QR Kod Oluştur ve Görüntüle'),
                  ),
                  Spacer(),
                ],
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

class Wi_Fi extends StatefulWidget {
  const Wi_Fi({super.key});

  @override
  State<Wi_Fi> createState() => _Wi_FiState();
}

class _Wi_FiState extends State<Wi_Fi> {
  String wifiSSID = ''; // Wi-Fi ağı adı
  String wifiPassword = ''; // Wi-Fi şifresi
  String wifiEncryptionType =''; // Wi-Fi şifreleme türü (WEP, WPA, WPA2,vb.)
  String wifiQRCodeData = '';

  void _showQRDialog() {
    wifiQRCodeData = 'WIFI:S:$wifiSSID;T:$wifiEncryptionType;P:$wifiPassword;;';
    

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Wi-Fi QR Kodu Görüntüle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?data=$wifiQRCodeData&size=200x200',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _downloadQRCode(); // QR kodu indirmek için bir işlev ekleyin (örneğin, galeriye kaydetmek için)
                      Navigator.of(context).pop(); // Dialog'u kapat
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
        'https://api.qrserver.com/v1/create-qr-code/?data=$wifiQRCodeData&size=200x200';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final qrPath = appDir.path;
    int fileIndex = 1;

    // Aynı ada sahip dosya zaten varsa, bir sonraki sıraya geçin
    while (await File('$qrPath/qr_code_$fileIndex.png').exists()) {
      fileIndex++;
    }

    final finalQrPath = '$qrPath/qr_code_$fileIndex.png';

    File(finalQrPath).writeAsBytesSync(bytes);

    // Dosyayı galeriye ekleyin
    final result = await ImageGallerySaver.saveFile(finalQrPath);

    if (result != null && result.isNotEmpty) {
      // Başarıyla kaydedildiğini bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedildi.'),
        ),
      );
    } else {
      // Hata durumunda bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedilemedi.'),
        ),
      );
    }
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Başlık metnini tam ortada hizalamak için
        title: Text(
          "Yellow Star",
          style: TextStyle(
            color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
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
                  onChanged: (value) {
                    setState(() {
                      wifiSSID = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Şifreleme Türü",
                style: TextStyle(
                  fontSize: 16, // Metin boyutunu burada ayarlayabilirsiniz
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Şifreleme Türü (WEP, WPA, WPA2, vb.)",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                  style: TextStyle(
                      color: Colors.black), // Yazı rengini beyaz yapar
                  onChanged: (value) {
                    setState(() {
                      wifiEncryptionType = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      wifiPassword = value;
                      
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (wifiSSID.isNotEmpty &&
                          wifiEncryptionType.isNotEmpty) {
                        // Metin içeriği doluysa QR kodu görüntüleme dialogunu göster
                        _showQRDialog();
                      } else {
                        // Metin içeriği boşsa kullanıcıya bir hata mesajı göstermek için bir snackbar veya alertDialog gösterebilirsiniz.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('SSID ve Şifreleme Türü doldurulmalıdır.'),
                          ),
                        );
                      }
                    },
                    child: Text('QR Kod Oluştur ve Görüntüle'),
                  ),
                  Spacer(),
                ],
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

class E_Mail extends StatefulWidget {
  const E_Mail({super.key});

  @override
  State<E_Mail> createState() => _E_MailState();
}

class _E_MailState extends State<E_Mail> {
  String email = ''; // E-posta adresi
  String emailSubject = ''; // E-posta konusu
  String emailBody = ''; // E-posta içeriği

  String emailQRCodeData = '';

  // QR kodu görüntülemek için dialog göstermek için bir işlev
  void _showQRDialog() {
    emailQRCodeData = 'mailto:$email?subject=$emailSubject&body=$emailBody';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'E-Posta QR Kodu Görüntüle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?data=$emailQRCodeData&size=200x200',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _downloadQRCode();// QR kodu indirmek için bir işlev ekleyin (örneğin, galeriye kaydetmek için)
                      Navigator.of(context).pop(); // Dialog'u kapat
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
        'https://api.qrserver.com/v1/create-qr-code/?data=$emailQRCodeData&size=200x200';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final qrPath = appDir.path;
    int fileIndex = 1;

    // Aynı ada sahip dosya zaten varsa, bir sonraki sıraya geçin
    while (await File('$qrPath/qr_code_$fileIndex.png').exists()) {
      fileIndex++;
    }

    final finalQrPath = '$qrPath/qr_code_$fileIndex.png';

    File(finalQrPath).writeAsBytesSync(bytes);

    // Dosyayı galeriye ekleyin
    final result = await ImageGallerySaver.saveFile(finalQrPath);

    if (result != null && result.isNotEmpty) {
      // Başarıyla kaydedildiğini bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedildi.'),
        ),
      );
    } else {
      // Hata durumunda bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedilemedi.'),
        ),
      );
    }
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Başlık metnini tam ortada hizalamak için
        title: Text(
          "Yellow Star",
          style: TextStyle(
            color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
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
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      emailSubject = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      emailBody = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (email.isNotEmpty && emailBody.isNotEmpty) {
                        // Metin içeriği doluysa QR kodu görüntüleme dialogunu göster
                        _showQRDialog();
                      } else {
                        // Metin içeriği boşsa kullanıcıya bir hata mesajı göstermek için bir snackbar veya alertDialog gösterebilirsiniz.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Mail adresi ve mesaj alanı boş olamaz.'),
                          ),
                        );
                      }
                    },
                    child: Text('QR Kod Oluştur ve Görüntüle'),
                  ),
                  Spacer(),
                ],
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

class SMS extends StatefulWidget {
  const SMS({super.key});

  @override
  State<SMS> createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  String phoneNumber = ''; // Telefon numarası
  String smsBody = ''; // SMS içeriği

  String smsQRCodeData = '';

  // QR kodu görüntülemek için dialog göstermek için bir işlev
  void _showQRDialog() {
    smsQRCodeData = 'sms:$phoneNumber?body=$smsBody';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'SMS QR Kodu Görüntüle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?data=$smsQRCodeData&size=200x200',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _downloadQRCode(); // QR kodu indirmek için bir işlev ekleyin (örneğin, galeriye kaydetmek için)
                      Navigator.of(context).pop(); // Dialog'u kapat
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
        'https://api.qrserver.com/v1/create-qr-code/?data=$smsQRCodeData&size=200x200';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final qrPath = appDir.path;
    int fileIndex = 1;

    // Aynı ada sahip dosya zaten varsa, bir sonraki sıraya geçin
    while (await File('$qrPath/qr_code_$fileIndex.png').exists()) {
      fileIndex++;
    }

    final finalQrPath = '$qrPath/qr_code_$fileIndex.png';

    File(finalQrPath).writeAsBytesSync(bytes);

    // Dosyayı galeriye ekleyin
    final result = await ImageGallerySaver.saveFile(finalQrPath);

    if (result != null && result.isNotEmpty) {
      // Başarıyla kaydedildiğini bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedildi.'),
        ),
      );
    } else {
      // Hata durumunda bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedilemedi.'),
        ),
      );
    }
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Başlık metnini tam ortada hizalamak için
        title: Text(
          "Yellow Star",
          style: TextStyle(
            color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
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
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      smsBody = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (phoneNumber.isNotEmpty) {
                        // Metin içeriği doluysa QR kodu görüntüleme dialogunu göster
                        _showQRDialog();
                      } else {
                        // Metin içeriği boşsa kullanıcıya bir hata mesajı göstermek için bir snackbar veya alertDialog gösterebilirsiniz.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Telefon numarası boş olamaz.'),
                          ),
                        );
                      }
                    },
                    child: Text('QR Kod Oluştur ve Görüntüle'),
                  ),
                  Spacer(),
                ],
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

class Etkinlik extends StatefulWidget {
  const Etkinlik({super.key});

  @override
  State<Etkinlik> createState() => _EtkinlikState();
}

class _EtkinlikState extends State<Etkinlik> {
  String etkinlikAdi = '';
  String konumIsmi = '';
  String aciklama = '';
  DateTime? baslangicTarihi;
  DateTime? bitisTarihi;
  String etkinlikBilgisi = '';

  DateTime? _selectedDate1;
  DateTime? _selectedDate2;
  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate1 = picked;
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        _selectedDate2 = picked;
      });
  }

  Future<void> _selectDate(BuildContext context, bool isbaslangicTarihi) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isbaslangicTarihi) {
          baslangicTarihi = picked;
        } else {
          bitisTarihi = picked;
        }
      });
    }
  }

  void _showQRDialog() {
    if (etkinlikAdi.isEmpty ||
        konumIsmi.isEmpty ||
        aciklama.isEmpty ||
        baslangicTarihi == null ||
        bitisTarihi == null) {
      // Eksik veri olduğunda kullanıcıya bir hata mesajı göstermek için bir snackbar veya alertDialog kullanabilirsiniz.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lütfen eksik bilgileri doldurun.'),
        ),
      );
      return;
    }

    etkinlikBilgisi = '''
BEGIN:VEVENT
SUMMARY:$etkinlikAdi
LOCATION:$konumIsmi
aciklama:$aciklama
DTSTART:${DateFormat('yyyyMMddTHHmmss').format(baslangicTarihi!)}
DTEND:${DateFormat('yyyyMMddTHHmmss').format(bitisTarihi!)}
END:VEVENT''';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Etkinlik QR Kodu Görüntüle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?data=$etkinlikBilgisi&size=200x200',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _downloadQRCode(); // QR kodu indirmek için bir işlev ekleyin (örneğin, galeriye kaydetmek için)
                      Navigator.of(context).pop(); // Dialog'u kapat
                    },
                    child: Text('İndir'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Dialog'u kapat
                      print(etkinlikBilgisi);
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
        'https://api.qrserver.com/v1/create-qr-code/?data=$etkinlikBilgisi&size=200x200';
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final qrPath = appDir.path;
    int fileIndex = 1;

    // Aynı ada sahip dosya zaten varsa, bir sonraki sıraya geçin
    while (await File('$qrPath/qr_code_$fileIndex.png').exists()) {
      fileIndex++;
    }

    final finalQrPath = '$qrPath/qr_code_$fileIndex.png';

    File(finalQrPath).writeAsBytesSync(bytes);

    // Dosyayı galeriye ekleyin
    final result = await ImageGallerySaver.saveFile(finalQrPath);

    if (result != null && result.isNotEmpty) {
      // Başarıyla kaydedildiğini bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedildi.'),
        ),
      );
    } else {
      // Hata durumunda bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedilemedi.'),
        ),
      );
    }
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Başlık metnini tam ortada hizalamak için
        title: Text(
          "Yellow Star",
          style: TextStyle(
            color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
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
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    setState(() {
                      etkinlikAdi = value;
                    });
                  }, // Yazı rengini beyaz yapar
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
                  onChanged: (value) {
                    setState(() {
                      konumIsmi = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      aciklama = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Başlangıç Tarihi",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (picked != null) {
                              setState(() {
                                _selectedDate1 = picked;
                                baslangicTarihi =
                                    picked; // Tarihi seçildiği anda atama yap
                              });
                              print(_selectedDate1);
                              print(baslangicTarihi);
                            }
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                          ),
                          child: Text(
                            _selectedDate1 != null
                                ? ' ${DateFormat('dd MMM y', 'tr_TR').format(_selectedDate1!)}'
                                : 'Tarih Seç',
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Bitiş Tarihi",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (picked != null) {
                              setState(() {
                                _selectedDate2 = picked;
                                bitisTarihi =
                                    picked; // Tarihi seçildiği anda atama yap
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                          ),
                          child: Text(
                            _selectedDate2 != null
                                ? ' ${DateFormat('dd MMM y', 'tr_TR').format(_selectedDate2!)}'
                                : 'Tarih Seç',
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (etkinlikAdi.isNotEmpty) {
                        // Metin içeriği doluysa QR kodu görüntüleme dialogunu göster
                        _showQRDialog();
                      } else {
                        // Metin içeriği boşsa kullanıcıya bir hata mesajı göstermek için bir snackbar veya alertDialog gösterebilirsiniz.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Etkinlik adı boş olamaz.'),
                          ),
                        );
                      }
                    },
                    child: Text('QR Kod Oluştur ve Görüntüle'),
                  ),
                  Spacer(),
                ],
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
    initializeDateFormatting('tr_TR', null);
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
          title: Text(
            'QR Kod Görüntüle',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
                      Navigator.of(context).pop(); // Dialog'u kapat
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
    final qrPath = appDir.path;
    int fileIndex = 1;

    // Aynı ada sahip dosya zaten varsa, bir sonraki sıraya geçin
    while (await File('$qrPath/qr_code_$fileIndex.png').exists()) {
      fileIndex++;
    }

    final finalQrPath = '$qrPath/qr_code_$fileIndex.png';

    File(finalQrPath).writeAsBytesSync(bytes);

    // Dosyayı galeriye ekleyin
    final result = await ImageGallerySaver.saveFile(finalQrPath);

    if (result != null && result.isNotEmpty) {
      // Başarıyla kaydedildiğini bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedildi.'),
        ),
      );
    } else {
      // Hata durumunda bildirin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR kodu galeriye kaydedilemedi.'),
        ),
      );
    }
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Başlık metnini tam ortada hizalamak için
        title: Text(
          "Yellow Star",
          style: TextStyle(
            color: Colors.white, // Yazı rengini beyaz olarak ayarlayın
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
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
