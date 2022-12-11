import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uhealths/drawer.dart';
import 'package:uhealths/main.dart';
import 'package:uhealths/pages/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class PassData {
  static int user_id = 0;
  static String username = "Anonymous";
  static int get getID => user_id;
  static String get fetcher => username;
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  final _loginFormKey = GlobalKey<FormState>();
   bool isPasswordVisible = false;
   void togglePasswordView() {
     setState(() {
       isPasswordVisible = !isPasswordVisible;
     });
   }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      drawer: DrawerClass(),
      body: Form(
        key: _loginFormKey,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 0, 15, 125), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: ListView(
              children: <Widget>[
                headerSection(),
                textSection(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  margin: EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    // "https://pbp-midterm-project-b09-production.up.railway.app/login-flutter/"
                    // "http://localhost:8000/login-flutter/"
                    onPressed: () async {
                      if (_loginFormKey.currentState!.validate()) {
                        final response = await request.post(
                          "https://pbp-midterm-project-b09-production.up.railway.app/login-flutter/",
                          jsonEncode(<String, String> {
                              'username': username,
                              'password': password
                            }
                          )
                        );

                        if (request.loggedIn) {
                          PassData.username = username;
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  content: Row(
                            children: const [
                              Icon(Icons.info_outline_rounded,
                                  size: 30, color: Colors.white),
                              Spacer(
                                flex: 1,
                              ),
                              Text("Login Successful",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          )));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserMenuPage()));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  content: Row(
                            children: const [
                              Icon(Icons.warning_amber_rounded,
                                  size: 30, color: Colors.white),
                              Spacer(
                                flex: 1,
                              ),
                              Text("Username or password does not exist!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          )));
                        }
                      }
                    },
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            onChanged: (value) {
              username = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Username must not empty!";
              }
              if (value.length < 5) {
                return "Username must at least contains 5 characters!";
              }
              return null;
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white),
              hintText: "Username",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            onChanged: (value) {
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Password must not empty!";
              }
              return null;
            },
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Align(
        alignment: Alignment.center,
        child: Text("uHealths",
          style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold
          )),
      )
    );
  }
}