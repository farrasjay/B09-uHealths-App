import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uhealths/constant.dart';
import 'package:uhealths/drawer.dart';
import 'package:uhealths/pages/login.dart';

class UserMenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      drawer: DrawerClass(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/uHealths.png"),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.225,
                    ),
                    Text(
                    "Hello there!", style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      PassData.fetcher,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: Text(
                        "What are you up to today?", style: TextStyle(fontSize: 18)
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      height: 90,
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
                            "assets/icons/calculator.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "BMI & BMR Calculator", style: TextStyle(color: Color.fromARGB(255, 255, 225, 0), fontWeight: FontWeight.bold),
                                ),
                                Text("Track your most recent health status!", style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/unlocked.svg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
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
                            "assets/icons/infographic.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Infographics", style: TextStyle(color: Color.fromARGB(255, 255, 225, 0), fontWeight: FontWeight.bold),
                                ),
                                Text("Get the most updated info about healthy lifestyle!", style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/unlocked.svg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
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
                            "assets/icons/discussion.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Discussions", style: TextStyle(color: Color.fromARGB(255, 255, 225, 0), fontWeight: FontWeight.bold),
                                ),
                                Text("Interact with other health-enthusiast!", style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/unlocked.svg"),
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
