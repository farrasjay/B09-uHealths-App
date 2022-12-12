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

class Infografik3Page extends StatefulWidget {
    const Infografik3Page({Key? key}) : super(key: key);

    @override
    _Infografik3State createState() => _Infografik3State();
}

class Comment3 {
  late String komen;

  Comment3(
    {required this.komen}
  );
}

class _Infografik3State extends State<Infografik3Page> {
  final _formKey = GlobalKey<FormState>();   //buat apaya
  String komen = "";
  
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    return Scaffold(
      resizeToAvoidBottomInset: false,
    appBar: AppBar(
        title: const Text('INFOGRAFIK 3'),
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
              '7 Gerakan Workout untuk Pemula di Rumah, Mudah dan Praktis !',
              style: TextStyle(
                height: 2, fontSize: 40, fontWeight: FontWeight.bold
              ),
            )
            ),
            Padding(
              padding: EdgeInsets.all(75),
              child: Text(
              'Workout adalah salah satu cara paling praktis yang bisa Anda lakukan ketika ingin berolahraga di rumah. Sebab, ada berbagai latihan workout untuk pemula dengan gerakan-gerakan sederhana yang tentunya dapat mudah Anda pelajari. Meski demikian, workout termasuk olahraga yang dapat membantu tubuh membakar lebih banyak kalo dalam waktu singkat dibanding jenis lainnya. Lantas, apa saja gerakan workout untuk pemula tersebut? Yuk, langsung saja simak rekomendasi beserta tips-tipsnya di bawah ini!',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '1. Push Up',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Push up adalah salah satu latihan workout untuk pemula yang cukup efektif dalam mengencangkan otot-otot tubuh, terutama pada bagian dada, trisep, lengan, dan depan bahu. Untuk mendapatkan manfaat gerakan push up tersebut, Anda disarankan setidaknya berlatih secara rutin mulai dari 10 sampai 15 menit. Cara melakukannya pun sangat mudah, berikut langkah-langkahnya untuk pemula. Awali dengan posisi badan tengkurap di lantai dengan lutut sebagai tumpuan. Letakkan tangan di atas lantai dengan lurus untuk menopang tubuh, lalu posisikan kaki menyilang. Lakukan gerakan push up dengan menurunkan dada secara perlahan hingga mendekati permukaan lantai. Angkat kembali tubuh Anda dengan lengan, lalu ulangi gerakan tersebut beberapa kali.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '2. Sit Up',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Selain push up, ada pula latihan workout untuk pemula yang sangat sederhana dan mudah dilakukan, yaitu sit up. Adapun manfaat gerakan sit up adalah membantu Anda mengencangkan otot perut. Berikut cara melakukannya dengan benar. Pertama, rebahkan tubuh Anda telentang di lantai Tekuk lutut Anda dan posisikan telapak kaki rata dengan lantai, sementara tangan di belakang kepala. Kemudian, mulailah angkat tubuh bagian atas hingga siku Anda berada tepat di sebelah lutut. Sambil memastikan kaki tetap menempel di lantai, turunkan tubuh Anda secara perlahan. Ulangi rangkaian gerakan tersebut beberapa kali.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '3. Squat',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Rekomendasi gerakan workout untuk pemula berikutnya adalah squat. Ini merupakan latihan yang berfokus pada tubuh bagian bawah dan juga otot-otot inti. Jika Anda melatihnya secara rutin dan teratur, Anda bisa mengencangkan otot paha dan bokong. Berikut langkah-langkah melakukan squat dengan baik dan benar. Awali dengan berdiri tegak dan kedua kaki dibuka selebar pinggul Kemudian, turunkan tubuh sejauh yang Anda bisa secara perlahan dengan mendorong pinggul ke belakang Bersamaan dengan itu, luruskan kedua lengan ke depan dada guna menjaga keseimbangan tubuh Posisikan dada membusung dan tidak membungkuk, serta paha bagian atas sejajar dengan lantai, Setelah itu, angkat kembali badan Anda ke posisi berdiri tegak seperti semula. Ulangi gerakan tersebut beberapa kali.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '4. Wall Sit',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Wall sit adalah latihan workout untuk pemula yang hampir mirip dengan squat, hanya saja Anda akan memanfaatkan tembok. Adapun manfaat gerakan wall sit adalah meningkatkan kekuatan otot sekaligus daya tahan tubuh bagian bawah, terutama paha dan tungkai. Lalu, bagaimanakah cara melakukan wall sit? Simak langkah-langkahnya berikut ini. Pertama, berdirilah dengan menyandarkan punggung ke sebuah tembok. Posisikan kedua kaki Anda selebar bahu dan beri jarak sekitar 60 hingga 70 centimeter dari tembok tersebut. Kemudian, geser punggung Anda ke bawah secara perlahan sambil memastikan punggung tetap menempel. Jika posisi paha sudah sejajar dengan lantai seperti seolah-olah Anda sedang duduk di kursi, tahan gerakan tersebut selama 20 sampai 60 detik. Pastikan kedua kaki menapak lantai dengan kokoh. Setelah itu, geser kembali punggung Anda hingga ke posisi berdiri seperti di awal. Ulangi langkah-langkah tersebut berulang dengan jeda waktu sekitar 30 detik setiap gerakannya.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '5. Plank',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Gerakan workout untuk pemula selanjutnya ialah plank. Latihan ini membantu membangun kekuatan pada otot inti, atas, maupun bawah. Selain itu, manfaat plank bagi tubuh juga sekaligus memperbaiki postur tubuh serta meregangkan otot. Namun, untuk mendapat berbagai manfaat gerakan plank tersebut, Anda tentu harus melatihnya dengan benar. Berikut langkah-langkahnya. Awali dengan posisi seperti ingin melakukan gerakan push up, di mana lengan dan ujung kaki menopang tubuh Tekuk lengan Anda hingga membentuk 90 derajat, sehingga lutut menjadi tumpuan Hadapkan wajah ke arah bawah dan pastikan bahu Anda tetap rileks. Selain itu, jaga tubuh dalam garis lurus selama posisi plank. Jangan sampai punggung atau kepala menurun. Pertahankan posisi tersebut sekitar 10 detik, lalu lepaskan. Ulangi gerakan tersebut dari awal.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '6. Jumping Jacks',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Ada pula jumping jack atau juga dikenal dengan sebutan star jump. Gerakan workout untuk pemula satu ini pada dasarnya ditujukan untuk melatih kekuatan tubuh dan kardiovaskular. Cara melakukannya pun sangat bervariasi, adapun bagi pemula langkah-langkah jumping jack adalah sebagai berikut. Pertama, berdiri tegak dengan posisi kaki menempel dan tangan merapat pada kedua sisi tubuh. Kemudian, lompatlah dengan kaki terbuka lebar ke samping kanan dan kiri. Bersamaan dengan lompatan tersebut, angkat tangan Anda ke atas kepala layaknya ingin bertepuk tangan. Lalu, tubuh mendarat dan kembali ke posisi awal. Lakukan gerakan tersebut berulang-ulang.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
            ),
            Text(
              '7. Abdominal Crunch',
              style: TextStyle(
                height: 2, fontSize: 24, fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, right: 75, top: 25, bottom: 50),
              child: Text(
              'Rekomendasi latihan workout untuk pemula yang terakhir adalah abdominal crunch. Gerakan ini cukup mirip dengan sit up, di mana tujuannya ialah untuk dapat membentuk otot perut sekaligus membakar lemak-lemak di daerah tersebut. Jika ingin melakukan abdominal crunch, cara melakukannya dengan benar ialah sebagai berikut. Pertama, baring telentang sambil menekukkan lutut dan kaki menapak lantai. Letakkan kedua tangan di depan dada dengan posisi menyilang Angkat punggung atas atau bahu dari lantai sekitar 10 centimeter, sementara punggung bawah tetap pada permukaan. Tahan posisi tersebut beberapa saat kemudian turunkan kembali secara perlahan. Ulangi beberapa kali',
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