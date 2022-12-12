import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uhealths/faq/model/question_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:uhealths/faq/model/session.dart';

import '../model/status_model.dart';

Future<List<Question>> fetchQuestion(BuildContext context, String urlJson) async {
  final request = context.watch<CookieRequest>();
  var url = Uri.parse(urlJson);
  print("MARI KITA COBA : " + urlJson);
  var response = await http.get(
    url,
    headers: request.headers,
  );

  print("respons fetchArticle : " + response.statusCode.toString());

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));


  // melakukan konversi data json menjadi object Article
  List<Question> listQuestion = [];
  for (var d in data) {
    if (d != null) {
      listQuestion.add(Question.fromJson(d));
    }
  }
  return listQuestion;
}

Future<Status> fetchUser(BuildContext context) async {
  final request = context.watch<CookieRequest>();
  String urlJson = "https://pbp-midterm-project-b09-production.up.railway.app/uhealths/faq/getstatus/";
  var url = Uri.parse(urlJson);
  print("MARI KITA COBA : " + urlJson);
  var response = await http.get(
    url,
    headers: request.headers,
  );

  print("respons fetchUser : " + response.statusCode.toString());

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  print(data.toString());


  // melakukan konversi data json menjadi object Article
  Status status = Status.fromJson(data);

  
  return status;
}


Future<Session> fetchSession(BuildContext context) async {
  final request = context.watch<CookieRequest>();
  String urlJson = "https://pbp-midterm-project-b09-production.up.railway.app/uhealths/faq/get";
  var url = Uri.parse(urlJson);
  print("MARI KITA COBA : " + urlJson);
  var response = await http.get(
    url,
    headers: request.headers,
  );

  print("respons fetchUser : " + response.statusCode.toString());

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  print(data.toString());


  // melakukan konversi data json menjadi object Article
  Session status = Session.fromJson(data);
  print(status.recentlyViewedQuestion);

  
  return status;
}

sendQuestion(BuildContext context, String question) async {
  final request = context.read<CookieRequest>();

  try {
    String url = 'https://pbp-midterm-project-b09-production.up.railway.app/uhealths/faq/send_question/';
    var respons = await http.post(
      Uri.parse(url),
      body: {
        "question": question,
      },
      headers: request.headers,
    );
    print("respons addArticle : " + respons.statusCode.toString());
  } catch (e) {
    print(e);
  }
}

Future<int> addLike(BuildContext context, int id) async {
  final request = context.read<CookieRequest>();

  try {
    String url = 'https://pbp-midterm-project-b09-production.up.railway.app/uhealths/faq/like/${id}';
    var respons = await http.post(
      Uri.parse(url),
      body: {},
      headers: request.headers,
    );
    print("respons addArticle : " + respons.statusCode.toString());
    return 1; 
  } catch (e) {
    print(e);
    return 0;
  }
}

// Future<int> addSession(BuildContext context, int id) async {
//   final request = context.read<CookieRequest>();

//   try {
//     String url = 'http://127.0.0.1:8000/uhealths/faq/set/${id}';
//     var respons = await http.post(
//       Uri.parse(url),
//       body: {},
//       headers: request.headers,
//     );
//     print("respons addArticle : " + respons.statusCode.toString());
//     return 1; 
//   } catch (e) {
//     print(e);
//     return 0;
//   }
// }


