import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/model_infografik1.dart';

Future<List<CommentInfografik1>> fetchCommentInfografik1() async {
  var url = Uri.parse('https://pbp-midterm-project-b09-production.up.railway.app/infografis/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

// check dimana
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<CommentInfografik1> listComment1 = [];
  // print(data);
  for (var d in data) {
    if (d != null) {
      listComment1.add(CommentInfografik1.fromJson(d));
    }
  }
  return listComment1;
}

Future<void> addComment1(String comment) async { 
  var url = Uri.parse('https://pbp-midterm-project-b09-production.up.railway.app/infografis/add_comment1_flutter/');
  Map data = {};
  data['comment'] = comment;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}