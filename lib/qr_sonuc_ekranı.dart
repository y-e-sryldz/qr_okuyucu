import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
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
    Map<String, String> vCardInfo = parseVCard(veri);
    Map<String, String> wifiInfo = parseWifiInfo(veri);
    Map<String, List<String>> emailInfo = parseEmailInfo(veri);
    Map<String, List<String>> smsInfo = parseSMSInfo(veri);
    Map<String, String> eventInfo = parseEventInfo(veri);
    ;
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
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyApp()),
        );
          },
        ),
      ),
      body: Column(
        children: [
          //url
          if (sira == 1)
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("Link"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(veri),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Divider(
                          height: 10, // Çizgi yüksekliğini ayarlayabilirsiniz
                          color:
                              Colors.grey, // Çizgi rengini ayarlayabilirsiniz
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          //kişi
          if (sira == 2)
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: vCardInfo.length *
                        2, // Her veri arasına bir Divider eklemek için
                    itemBuilder: (context, index) {
                      if (index.isEven) {
                        // Değişiklik burada
                        final keyIndex = index ~/ 2;
                        final key = vCardInfo.keys.elementAt(keyIndex);
                        final value = vCardInfo[key];
                        return ListTile(
                          title: Text(key),
                          subtitle: Text(value!),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Divider(
                            height: 10,
                            color: Colors.grey,
                          ),
                        );
                      }
                    },
                  ),
                  
                ],
              ),
            ),
          //konum
          if (sira == 3)
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Enlem",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          getLatitude(veri),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: Divider(
                          height: 10, // Çizgi yüksekliğini ayarlayabilirsiniz
                          color:
                              Colors.grey, // Çizgi rengini ayarlayabilirsiniz
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Boylam",
                          style: TextStyle(
                            fontSize: 18.0, // Başlığı kalın yapabilirsiniz
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          getLongitude(veri),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          //wifi
          if (sira == 4)
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: wifiInfo.length *
                        2, // Her veri arasına bir Divider eklemek için
                    itemBuilder: (context, index) {
                      if (index.isEven) {
                        // Değişiklik burada
                        final keyIndex = index ~/ 2;
                        final key = wifiInfo.keys.elementAt(keyIndex);
                        final value = wifiInfo[key];
                        return ListTile(
                          title: Text(key),
                          subtitle: Text(value!),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Divider(
                            height: 10,
                            color: Colors.grey,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          //mail
          if (sira == 5)
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: emailInfo.length *
                        2, // Her veri arasına bir Divider eklemek için
                    itemBuilder: (context, index) {
                      if (index.isEven) {
                        final keyIndex = index ~/ 2;
                        final key = emailInfo.keys.elementAt(keyIndex);
                        final valueList = emailInfo[key];
                        final value = valueList!.join(
                            ", "); // E-posta adreslerini virgülle birleştir
                        return ListTile(
                          title: Text(key),
                          subtitle: Text(value),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Divider(
                            height: 10,
                            color: Colors.grey,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          //SMS
          if (sira == 6)
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: smsInfo.length * 2,
                    itemBuilder: (context, index) {
                      if (index.isEven) {
                        final keyIndex = index ~/ 2;
                        final key = smsInfo.keys.elementAt(keyIndex);
                        final valueList = smsInfo[key];
                        final value = valueList!.join(", ");
                        return ListTile(
                          title: Text(key),
                          subtitle: Text(value),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Divider(
                            height: 10,
                            color: Colors.grey,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          //Etkinlik
          if (sira == 7)
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: eventInfo.length * 2,
                    itemBuilder: (context, index) {
                      if (index.isEven) {
                        final keyIndex = index ~/ 2;
                        final key = eventInfo.keys.elementAt(keyIndex);
                        String value = eventInfo[key]!;
                        value = formatDateTime(value); // Tarihi biçimlendir
                        return ListTile(
                          title: Text(key),
                          subtitle: Text(value),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Divider(
                            height: 10,
                            color: Colors.grey,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          //metin
          if (sira == 8)
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("Metin"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(veri),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Divider(
                          height: 10, // Çizgi yüksekliğini ayarlayabilirsiniz
                          color:
                              Colors.grey, // Çizgi rengini ayarlayabilirsiniz
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //url
              if (sira == 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "Tarayıcıda Aç",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "İçeriği Kopyala",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              //kişi
              if (sira == 2)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "Lişilere Ekle",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "İçeriği Kopyala",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              //konum
              if (sira == 3)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text("Haritalarda Aç",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "İçeriği Kopyala",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              //wifi
              if (sira == 4)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "Bağlan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "İçeriği Kopyala",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              //mail
              if (sira == 5)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "Eposta Gönder",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "İçeriği Kopyala",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              //SMS
              if (sira == 6)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "SMS Gönder",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "İçeriği Kopyala",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              //Etkinlik
              if (sira == 7)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "Etkinlik Oluştur",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "İçeriği Kopyala",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              //metin
              if (sira == 8)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Burada giriş işlemini gerçekleştirin
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: Color(0xff21254A), // Arka plan rengini ayarlayın
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Köşeleri yuvarlama
                        ),
                      ),
                      child: Text(
                        "İçeriği Kopyala",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              // Reklam burada görüntüleniyor
              _isAdLoaded // _isAdLoaded değişkeni true ise reklamı göster
                    ? SizedBox(
                        width: _bannerAd!.size.width.toDouble(),
                        height: _bannerAd!.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd!),
                      )
                    : SizedBox(),
                     // Reklam yüklenmediyse boş bir SizedBox göster
            ],
          ),
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

  String formatDateTime(String dateTimeStr) {
    try {
      print("Önce: $dateTimeStr"); // Kontrol noktası ekleyin
      DateTime dateTime = DateTime.parse(dateTimeStr);
      String formattedDate =
          DateFormat('dd/MM/yyyy').format(dateTime); // Gün/Ay/Yıl formatı
      print("Sonra: $formattedDate"); // Kontrol noktası ekleyin
      return formattedDate;
    } catch (e) {
      print("Tarih biçimlendirme hatası: $e");
      return dateTimeStr; // Hata durumunda orijinal değeri döndür
    }
  }

  Map<String, String> parseVCard(String vCardData) {
    Map<String, String> vCardInfo = {};
    List<String> lines = vCardData.split('\n');

    for (String line in lines) {
      if (line.isNotEmpty) {
        List<String> parts = line.split(':');
        if (parts.length == 2) {
          String key = parts[0].trim();
          String value = parts[1].trim();

          // "FN" (Full Name) alanını "İsim Soyisim" olarak kullan
          if (key == "FN") {
            vCardInfo["İsim Soyisim"] = value;
          }
          // "TEL;CELL" alanının içeriğini sadece telefon numarası olarak al
          else if (key.startsWith("ORG")) {
            // Telefon numarasının önündeki "TEL;CELL:" ifadesini kaldır
            vCardInfo["Şirket"] = value.replaceAll("ORG:", "");
          } else if (key.startsWith("TITLE")) {
            // Telefon numarasının önündeki "TEL;CELL:" ifadesini kaldır
            vCardInfo["Meslek"] = value.replaceAll("TITLE:", "");
          } else if (key.startsWith("ADR")) {
            // Telefon numarasının önündeki "TEL;CELL:" ifadesini kaldır
            vCardInfo["ADRES"] = value.replaceAll("ADR:", "");
          } else if (key.startsWith("TEL;CELL")) {
            // Telefon numarasının önündeki "TEL;CELL:" ifadesini kaldır
            vCardInfo["Telefon Numarası"] = value.replaceAll("TEL;CELL:", "");
          } else if (key.startsWith("EMAIL;WORK;INTERNET")) {
            // Telefon numarasının önündeki "TEL;CELL:" ifadesini kaldır
            vCardInfo["E-Mail"] = value.replaceAll("EMAIL;WORK;INTERNET:", "");
          }
        }
      }
    }

    return vCardInfo;
  }

  String getLatitude(String qrCodeContent) {
    String coordinates =
        qrCodeContent.substring("http://maps.google.com/maps?q=".length);
    List<String> parts = coordinates.split(",");
    if (parts.length == 2) {
      return parts[0];
    }
    return "";
  }

  String getLongitude(String qrCodeContent) {
    String coordinates =
        qrCodeContent.substring("http://maps.google.com/maps?q=".length);
    List<String> parts = coordinates.split(",");
    if (parts.length == 2) {
      return parts[1];
    }
    return "";
  }

  Map<String, String> parseWifiInfo(String wifiContent) {
    Map<String, String> wifiInfo = {};
    List<String> parts = wifiContent.split(';');
    String ssid = "";
    String password = "";

    for (String part in parts) {
      if (part.startsWith("S:")) {
        ssid = part.substring(2);
      } else if (part.startsWith("P:")) {
        password = part.substring(2);
      } else if (part.startsWith("T:")) {
        password = part.substring(2);
      }
    }

    if (ssid.isNotEmpty) {
      wifiInfo["SSID"] = ssid;
    }
    if (password.isNotEmpty) {
      wifiInfo["Şifre"] = password;
    }

    return wifiInfo;
  }

  Map<String, List<String>> parseEmailInfo(String emailContent) {
    Map<String, List<String>> emailInfo = {
      "E-posta": [],
      "Konu": [],
      "Mesaj": [],
    };

    // emailContent'in boş olup olmadığını kontrol edin
    if (emailContent.isEmpty) {
      return emailInfo;
    }

    // URL'yi "?" işaretine göre böleriz
    List<String> urlParts = emailContent.split('?');

    // E-posta adresi, konu ve mesajı almak için urlParts listesini kullanırız
    if (urlParts.length == 2) {
      String emailPart = urlParts[0]; // mailto:emre@gmail.com
      String queryPart = urlParts[1]; // subject=ben&body=naber%20trekk

      // E-posta adresini ayırırız
      if (emailPart.startsWith("mailto:")) {
        emailInfo["E-posta"]!.add(emailPart.substring("mailto:".length));
      }

      // Sorgu bölümünü "&" işaretine göre böleriz
      List<String> queryParts = queryPart.split('&');

      // Konu ve mesajı ayırırız
      for (String part in queryParts) {
        List<String> keyValue = part.split('=');
        if (keyValue.length == 2) {
          String key = keyValue[0];
          String value = Uri.decodeFull(keyValue[1]); // URL kodunu çözme
          if (key == "subject") {
            emailInfo["Konu"]!.add(value);
          } else if (key == "body") {
            emailInfo["Mesaj"]!.add(value);
          }
        }
      }
    }

    return emailInfo;
  }

  Map<String, List<String>> parseSMSInfo(String smsContent) {
    Map<String, List<String>> smsInfo = {
      "Alıcı": [],
      "Mesaj": [],
    };

    // "sms:" ifadesini kaldır
    smsContent = smsContent.replaceFirst("SMSTO:", "");

    // SMS içeriğini ":" işaretine göre böleriz
    List<String> parts = smsContent.split(':');

    if (parts.length >= 2) {
      smsInfo["Alıcı"]!.add(parts[0]);
      smsInfo["Mesaj"]!.add(parts[1]);
    }

    return smsInfo;
  }

  Map<String, String> parseEventInfo(String eventData) {
    Map<String, String> eventInfo = {};
    List<String> lines = eventData.split('\n');

    for (String line in lines) {
      if (line.isNotEmpty) {
        List<String> parts = line.split(':');
        if (parts.length == 2) {
          String key = parts[0].trim();
          String value = parts[1].trim();

          if (key == "SUMMARY") {
            eventInfo["Etkinlik Adı"] = value;
          } else if (key == "LOCATION") {
            eventInfo["Konum"] = value;
          } else if (key == "DTSTART") {
            eventInfo["Başlangıç Tarihi"] = value;
          } else if (key == "DTEND") {
            eventInfo["Bitiş Tarihi"] = value;
          } else if (key == "DESCRIPTION") {
            eventInfo["Açıklama"] = value;
          }
        }
      }
    }

    return eventInfo;
  }
}
