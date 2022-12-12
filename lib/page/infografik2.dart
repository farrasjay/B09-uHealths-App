import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';
import 'package:uhealthstugaskelompok/main.dart';
import '../drawer.dart';
import '../functions/fetch_infografik1.dart';
import 'infografik1.dart';
import 'infografik2.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Infografik2Page extends StatefulWidget {
    const Infografik2Page({Key? key}) : super(key: key);

    @override
    _Infografik2State createState() => _Infografik2State();
}

class Comment2 {
  late String komen;

  Comment2(
    {required this.komen}
  );
}

class _Infografik2State extends State<Infografik2Page> {
  final _formKey = GlobalKey<FormState>();   //buat apaya
  String komen = "";
  
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    return Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: AppBar(
        title: const Text('INFOGRAFIK 2'),
    ),
    drawer: DrawerClass(),
    body: SingleChildScrollView(child: 
    Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            // if _counter % 2 == 0, display "Even" with  red color, else display "Odd" with blue color
            Padding(
                padding: EdgeInsets.only(left: 200, right: 200, top: 30, bottom: 15),
                child: Text(
              'Menu Makanan 4 Sehat 5 Sempurna dan Manfaatnya Bagi Kesehatan',
              style: TextStyle(
                height: 2, fontSize: 40, fontWeight: FontWeight.bold
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(75),
              child: Text(
              'Apa yang dimaksud dengan makanan 4 sehat 5 sempurna? Makanan 4 sehat 5 sempurna adalah program pemerintah yang mengharuskan setiap orang mengonsumsi lebih dari 1 jenis makanan dalam satu waktu. Makanan 4 sehat 5 sempurna terdiri dari makanan pokok, lauk pauk, sayur-sayuran, buah-buahan dan juga susu untuk memenuhi kebutuhan nutrisi tubuh. Lalu, apa saja komponen penyusun pola makan 4 sehat 5 sempurna?',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '1. Makanan Pokok',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Makanan pokok merupakan makanan yang kaya akan karbohidrat, suatu zat yang sangat diperlukan tubuh untuk membuat energi. Di Indonesia, makanan pokok umumnya berupa nasi, tetapi di beberapa daerah, makanan pokok jenis lain juga dikonsumsi seperti contohnya, kombinasi beras dan jagung yang umum dikonsumsi di Madura dan sagu di Papua.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '2. Lauk Pauk',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Lauk pauk merupakan bahan makanan yang mengandung kadar protein tinggi. Pada usia tumbuh kembang anak, protein sangat diperlukan untuk membangun tubuh. Sedangkan pada usia dewasa, protein dapat diubah menjadi cadangan energi. Selain itu, protein juga menjadi salah satu zat yang penting untuk sistem kekebalan tubuh. Protein dapat diperoleh dari dua jenis makanan, yakni nabati dan hewani. Protein nabati umumnya berasal dari kacang-kacangan dan olahannya, seperti tahu dan tempe yang merupakan olahan dari kacang kedelai. Sementara itu, protein hewani dapat diperoleh dengan mengonsumsi daging dan olahannya. Namun, konsumsi protein hewani sebaiknya dibatasi karena sumber protein hewani juga mengandung lemak dan kolesterol yang dapat berbahaya bagi tubuh jika dikonsumsi berlebih. Protein dari daging unggas dan makanan laut lebih sehat dibanding daging merah.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '3. Sayuran',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Selain memiliki kandungan serat yang baik untuk proses pencernaan, sayuran juga mengandung berbagai vitamin dan mineral yang diperlukan oleh tubuh untuk bekerja dengan baik. Misalnya, wortel kaya akan vitamin A yang diperlukan untuk mata, sementara bayam mengandung vitamin A, vitamin B kompleks, vitamin C, vitamin E, dan vitamin K. Agar lebih mudah dalam memilah manfaat dan kegunaan sayur dan buah, berikut klasifikasi manfaat sayur dan buah berdasarkan warnanya. Warna Merah: Sayur dan buah yang berwarna merah memiliki kandungan nutrisi yang berguna untuk melindungi tubuh dari virus, memperlancar aliran darah ke jantung, dan mencegah penuaan dini. Selain itu, kandungan lainnya dalam sayur dan buah adalah lycopene yang ditemukan dalam semangka dan tomat.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '4. Buah-Buahan',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Konsumsi buah-buahan tidak kalah pentingnya dengan sayuran dan bahan makanan lain. Seperti sayuran, buah-buahan juga kaya akan serat dan vitamin yang diperlukan oleh tubuh untuk menjaga kesehatan. Contohnya, buah jeruk kaya akan vitamin C, sementara buah naga mengandung zat besi yang diperlukan untuk mencegah anemia. Meskipun dianggap mewah, sebenarnya kita dapat mengonsumsi buah-buahan dengan harga terjangkau. Indonesia diberkahi dengan tanah yang subur dan iklim tropis, yang memungkinkan berbagai jenis tanaman buah tumbuh subur. Buah-buahan musiman seperti mangga dan duku, atau buah yang tersedia sepanjang tahun seperti pisang, dapat diperoleh dengan mudah dan murah.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '5. Susu',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Susu adalah minuman yang cocok sebagai pelengkap asupan gizi karena memiliki kandungan protein yang cukup tinggi. Susu merupakan asupan kalsium, yang berperan penting untuk menjaga keutuhan tulang. Namun, perlu diingat pula bahwa tidak semua orang dapat mengonsumsi susu karena beberapa orang dapat mengalami intoleransi laktosa yang menyebabkan penderitanya tidak dapat mencerna laktosa, zat yang banyak terkandung pada susu. Berikut susu yang biasa di konsumsi: Susu Kedelai Susu kedelai memiliki kandungan lemak jenuh yang rendah. Jika kamu sedang dalam program diet, susu kedelai dapat membantu karena cocok dijadikan susu pengganti susu sapi. Susu Almond Susu dari kacang almond cocok dikonsumsi oleh kamu yang alergi pada laktosa. Laktosa yang berlebih dapat menyebabkan produksi gas dan diare. Susu Sapi Susu sapi mengandung kalori yang cukup banyak, yaitu berkisar antara 80-150 kalori. Susu sapi baik untuk menambah energi bagi perempuan saat sedang PMS serta dapat mengurangi stres. Setelah mengetahui manfaat dari masing-masing elemen 4 sehat 5 sempurna, kini saatnya kita untuk mencocokkan menu makanan sehari-hari agar masing-masing elemen tersebut terpenuhi. Lengkapi juga dengan Program 12 Hari Realfood yang lengkap menjaga Realfoodfam dan keluarga tercinta.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
          ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "COMMENTS"
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                      hintText: "Add a new comment",
                      labelText: "Comment",
                    ),
                    // Menambahkan behavior saat nama diketik  
                    onChanged: (String? value) {
                      setState(() {
                        if (value != "") {
                        komen = value!;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan 
                    onSaved: (String? value) {
                      setState(() {
                        if (value != "") {
                        komen = value!;
                        }
                      });
                    },
                    // Validator sebagai validasi form 
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'It has no comment';
                      }
                      return null;
                    },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.center
                      ),
                      onPressed: () async{
                        if (_formKey.currentState!.validate() && komen != "") {
                          addComment1(komen);
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => Infografik1Page(),
                          ),
                        );
                      },
                      child: const Text("Add"),
                    ),
                  ],
                )
              ),
              FutureBuilder(
                future: fetchCommentInfografik1(), 
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                        child: CircularProgressIndicator(
                        color: Colors.blue,
                    ));
                  } else {
                      return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (data, index) => Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(snapshot.data![snapshot.data.length - index - 1].fields.nama),          
                              Text(
                                      formatter.format(DateTime.parse(snapshot
                                          .data![
                                              snapshot.data!.length - index - 1]
                                          .fields
                                          .date
                                          .toString())),
                                      // snapshot.data![snapshot.data!.length - index - 1].fields.date.toString(),
                                    ),
                              Text(snapshot.data![snapshot.data.length - index - 1].fields.comment)
                            ]
                          )
                        )
                      );
                    }
                }
              )
            ],
          )
          ]
        ),
        
      )
      
    )
);
    }
    rebuildAllChildren(BuildContext context) {}

  clear() {}
}