import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import '../drawer.dart';
import '../pages/login.dart';
import 'infografik1.dart';
import 'infografik2.dart';
import 'infografik3.dart';

class InfografikHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("INFOGRAFIK"),
      ),
      drawer: DrawerClass(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/uHealths.png"),    //Diubah aja fotonya
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.25,
                    ),
                    Text(
                      "Hello there!",
                    ),
                    SizedBox(height: 10),
                    
                    if (!request.loggedIn) Text("Anonymous", style: TextStyle(fontWeight: FontWeight.bold),)
                    else
                      Text(
                        PassData.fetcher,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Which article do you want?",
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF0D47A1),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "5 Tips Sederhana Memulai Hidup Sehat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Text("Jaman sekarang, orang-orang sudah mulai menyadari kembali betapa pentingnya memiliki pola hidup sehat. Nah, berikut adalah 5 cara sederhana agar kalian bisa memulai pola hidup sehat versi kalian. Yuk cari tahu lebih dalam!",
                                style: TextStyle(color: Colors.white)),
                                TextButton(
                                  style: TextButton.styleFrom(
                                  alignment: Alignment.center
                                  ),
                                  onPressed: () async{
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Infografik1Page(),
                                      ),
                                    );
                                  },
                                  child: const Text("Click Here!"),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF0D47A1),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Menu Makanan 4 Sehat 5 Sempurna dan Manfaatnya Bagi Kesehatan",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Text("Makanan-makanan yang sehat merupakan salah satu faktor untuk memiliki pola hidup yang sehat juga sehingga penting nih untuk mengetahui makanan 4 sehat 5 sempurna dan apa aja sih manfaatnya ? Check it out !!", style: TextStyle(color: Colors.white)),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    alignment: Alignment.center
                                  ),
                                  onPressed: () async{
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Infografik2Page(),
                                      ),
                                    );
                                  },
                                  child: const Text("Click Here!"),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF0D47A1),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "7 Gerakan Workout untuk Pemula di Rumah, Mudah dan Praktis !", 
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Text("Workout harus di GYM? Kata siapa? Ini ada kok 7 gerakan workout yang dapat dilakukan di rumah, sangat praktis. Lets check it our guys !!", style: TextStyle(color: Colors.white)),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    alignment: Alignment.center
                                  ),
                                  onPressed: () async{
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) => Infografik3Page(),
                                      ),
                                    );
                                  },
                                  child: const Text("Click Here!"),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int SessionNum;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key? key,
    required this.SessionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $SessionNum",
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}