import 'package:flutter/material.dart';
import 'package:uhealths/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:uhealths/pages/login.dart';

void main() {
  runApp(const uHealthsApp());
}

class uHealthsApp extends StatelessWidget {
  const uHealthsApp({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'uHealths',
                theme: ThemeData(
                    primarySwatch: Colors.indigo,
                    appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.white),
                    color: Color(0xFF0D47A1),
                    foregroundColor: Colors.white,
                  ),
                ),
                home: const MyHomePage(title: 'uHealths'),
                routes: {
                    "/login": (BuildContext context) => const LoginPage(),
                },
            ),
        );
    }
}