import 'package:flutter/material.dart';
import 'package:uhealths/pages/menu.dart';
import 'package:intro_slider/intro_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "We Are uHealths",
        description:
            "We thrives in an online health and wellness website that offers insight into the most current health and wellness, as well as contents that helps our user to be able to live healthier lives.",
        pathImage: "assets/images/slide1.png",
        backgroundColor: Color.fromARGB(255, 20, 25, 50),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "User Centered",
        description:
            "We're here to help you get your health on track with a new, fresh approach by providing you with infographics that will help you beat your goals and live a better life. We have a forum where you can interact with other health-enthusiasts.",
        pathImage: "assets/images/slide2.png",
        backgroundColor: Color.fromARGB(255, 10, 50, 75),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Join Us Now",
        description:
            "We've got your back. Just enter your height, weight, age, and gender, and we'll calculate your BMI, which is a great indicator of whether you're at a healthy weight or not. Thus, you can find out your own health status!",
        pathImage: "assets/images/slide3.png",
        backgroundColor: Color.fromARGB(255, 0, 75, 100),
      ),
    );
  }

  void onDonePress() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserMenuPage()),
      );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.black54,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.black54,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.black54,
    );
  }

  ButtonStyle uHealthsButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor: MaterialStateProperty.all<Color>(Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: uHealthsButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: uHealthsButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: uHealthsButtonStyle(),
    );
  }
}