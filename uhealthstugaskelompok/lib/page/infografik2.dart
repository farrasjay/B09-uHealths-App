import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uhealthstugaskelompok/functions/fetch_infografik2.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:uhealthstugaskelompok/main.dart';

import 'infografik1.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


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
  String? _komen;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: AppBar(
        title: const Text('INFOGRAFIK 2'),
    ),
    drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              ),
              accountEmail: Text('Anonymous@uhealths.co'),
              accountName: Text(
                'Anonymous',
                style: TextStyle(fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 15, 125),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Infografik 1',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Infografik1Page(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Infografik 2',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Infografik2Page(),
                  ),
                );
              },
            ),
            const Divider(
              height: 10,
              thickness: 2,
            ),
          ],
        ),
      ),
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
            Text(
              '5 Tips Sederhana Memulai Hidup Sehat',
              style: TextStyle(
                height: 3, fontSize: 50, fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Banyak orang yang tidak begitu paham bagaimana caranya menerapkan pola hidup sehat, baik secara fisik dan mental. Padahal, kebiasaan hidup sehat dan bahagia adalah kunci panjang umur. Artinya, semakin bahagia seseorang, maka besar pula kemungkinannya orang tersebut hidup lebih lama. Jadi, yuk mulai terapkan pola hidup sehat dengan berbagai cara atau tips di bawah ini.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '1. Hindari Stress',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Macet di jalan, deadline tugas atau kerjaan yang mencekik, keuangan yang tersendat, hubungan asmara yang sedang renggang, dan berbagai prahara hidup lainnya tentu akan membuat Anda stres. Saat Anda stres, semua sistem dalam tubuh Anda akan meresponsnya dengan cara yang berbeda-beda. Stres yang bersifat kronis dapat berdampak pada kesehatan Anda secara keseluruhan. Jika Anda stres, cobalah untuk tenangkan diri sambil mengambil napas dalam-dalam dan embuskan secara perlahan. Lakukan hal tersebut berulang kali sampai merasa lebih rileks. Anda juga bisa melakukan berbagai aktivitas lainnya yang Anda senangi, seperti membaca buku, menonton film, atau lainnya. Intinya, buatlah diri Anda merasa nyaman dengan cara yang Anda senangi.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '2. Bijak Memilih Makanan',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Apa yang Anda makan tentu akan memengaruhi bagaimana tubuh Anda bekerja. Oleh sebab itu, penting bagi Anda untuk memperhatikan setiap makanan yang Anda konsumsi setiap hari demi mewujudkan pola hidup sehat. Pastikan kalau makanan dalam piring Anda memenuhi prinsip gizi seimbang yang mencakup karbohidrat, serat, protein, dan lemak baik. Perhatikan pula porsi makan Anda. Memperhatikan porsi makan sangatlah penting untuk mencegah Anda mengalami kegemukan dan terserang berbagai penyakit kronis. Ingat, apa pun yang berlebihan tentu tidak baik untuk tubuh. Selain memilah makanan yang akan dikonsumsi, Anda juga harus bijak dalam mengolahnya. Hindari mengolah makanan dengan cara digoreng. Anda bisa mengolah makanan dengan cara yang lebih sehat, seperti direbus, dikukus, atau ditumis.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '3. Lakukan Olahraga Setiap Hari',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Olahraga tak melulu harus jogging atau pergi ke gym. Anda bebas melakukan berbagai jenis olahraga yang memang Anda sukai demi menerapkan kebiasaan pola hidup sehat. Nah, bagi Anda pekerja kantoran yang mungkin tidak memiliki banyak waktu untuk berolahraga, Anda bisa melakukan berbagai aktivitas fisik sederhana guna memastikan tubuh Anda tetap bergerak. Saat menuju ruangan kantor, cobalah untuk memilih naik tangga ketimbang lift atau eskalator. Anda juga bisa meluangkan waktu untuk berjalan-jalan atau sekadar naik turun tangga sebelum dan sesudah makan siang. Jika Anda suka bersepeda atau berenang, maka jangan ragu untuk melakukannya. Begitu pula jika hanya menyukai jalan santai. Kuncinya satu, buatlah tubuh Anda aktif bergerak setiap hari. Dengan aktif bergerak, tubuh Anda akan berusaha untuk membakar kalori yang mengendap di tubuh. Selain itu, hal ini juga dapat membantu mengalirkan lebih banyak oksigen ke dalam sel-sel tubuh dan menjaganya tetap sehat. Tak heran jika setelah olahraga atau melakukan aktivitas fisik Anda jadi merasa lebih bugar.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '4. Cukup Tidur',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Rajin olahraga dan makan makanan yang bernutrisi tinggi akan berakhir sia-sia kalau Anda sendiri kurang tidur. Menurut Cheri Mah, pakar masalah gangguan tidur di Stanford University dan University of California, tidur adalah kebutuhan paling mendasar untuk menuju pola hidup sehat. Tidur menjadi sebuah fondasi di mana pikiran dan tubuh yang sehat terbentuk. Jika kebiasaan hidup sehat ini goyah, tentunya akan berdampak pada kesehatan Anda. Menurut National Sleep Foundation, durasi tidur yang ideal bagi orang dewasa sekitar 7 – 9 jam per malam. Jadi, pastikan kalau setiap malam Anda tidur setidaknya 7 – 9 jam, ya!',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '5. Banyak Minum Air Putih',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Sekitar 60% dari komposisi tubuh Anda adalah air. Setiap hari, cairan dalam tubuh akan terus berkurang lewat keringat, urine, dan bahkan setiap kali Anda bernapas. Inilah mengapa penting untuk memastikan bahwa kebutuhan cairan Anda terpenuhi setiap hari supaya mencegah dehidrasi. Bawalah botol minum sendiri ke mana pun Anda pergi. Masukkan botol tersebut ke dalam tas, sehingga Anda tidak akan lupa membawanya ke mana-mana. Selain itu, sediakan juga air putih di meja kerja atau kamar tidur.',
              style: TextStyle(
                fontSize: 14,
              ),
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
                    // Menambahkan behavior saat nama diketik  (MASIH BINGUNG BANGET)
                    onChanged: (String? value) {
                      setState(() {
                        if (value != "") {
                        _komen = value!;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan (MASIH BINGUNG BANGET)
                    onSaved: (String? value) {
                      setState(() {
                        if (value != "") {
                        _komen = value!;
                        }
                      });
                    },
                    // Validator sebagai validasi form (MASIH BINGUNG JUGA)
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.center
                      ),
                      onPressed: () async{
                        DateTime now = new DateTime.now();
                        print("masuk1");
                        final request = context.read<CookieRequest>();
                        print("masuk2");
                        //String newdate = DateFormat.format(DateTime(now.year, now.month, now.day));
                        final response = await request.post(
                            'https://pbp-midterm-project-b09-production.up.railway.app/infografis/add_comment2_flutter/',
                            {
                            'comment':_komen,
                            'date': DateTime(now.year, now.month, now.day),
                            //'user': request.user,
                            //'nama' : request.user.get_username(),
                            }).then((response) => {
                              clear(), rebuildAllChildren(context)
                            }); 
                      },
                      child: const Text("Add"),
                    ),
                  ],
                )
              ),
              FutureBuilder(
                future: fetchCommentInfografik2(),
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
                              Text(snapshot.data![snapshot.data!.length - index - 1]['nama']),          //snapshot kenapa pake tanda seru
                              Text(snapshot.data![snapshot.data!.length - index - 1]['date']),
                              Text(snapshot.data![snapshot.data!.length - index - 1]['comment'])
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