import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/model_infografik2.dart';

Future<List<CommentInfografik2>> fetchCommentInfografik2() async {
  var url = Uri.parse('https://pbp-midterm-project-b09-production.up.railway.app/infografis/jsonkedua/');
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
  List<CommentInfografik2> listComment2 = [];
  // print(data);
  for (var d in data) {
    if (d != null) {
      listComment2.add(CommentInfografik2.fromJson(d));
    }
  }
  return listComment2;
}

Future<void> addComment2(String comment) async { 
  var url = Uri.parse('https://pbp-midterm-project-b09-production.up.railway.app/infografis/add_comment2_flutter/');
  Map data = {};
  data['comment'] = comment;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}