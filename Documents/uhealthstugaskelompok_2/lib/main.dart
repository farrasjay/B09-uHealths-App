import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import '../page/home.dart';
import '../page/login.dart';

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
                    primarySwatch: Colors.blue,
                ),
                home: const MyHomePage(title: 'uHealths'),
                routes: {
                    "/login": (BuildContext context) => const LoginPage(),
                },
            ),
        );
    }
}