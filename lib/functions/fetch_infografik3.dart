import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/model_infografik3.dart';

Future<List<CommentInfografik3>> fetchCommentInfografik3() async {
  var url = Uri.parse('https://pbp-midterm-project-b09-production.up.railway.app/infografis/jsonketiga/');
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
  List<CommentInfografik3> listComment3 = [];
  // print(data);
  for (var d in data) {
    if (d != null) {
      listComment3.add(CommentInfografik3.fromJson(d));
    }
  }
  return listComment3;
}

Future<void> addComment3(String comment) async { //ini datetime nya bisa gak yh
  var url = Uri.parse('https://pbp-midterm-project-b09-production.up.railway.app/infografis/add_comment3_flutter/');
  Map data = {};
  data['comment'] = comment;
  http.Response response = await http.post(
    url,
    headers: {"Content-Type": 'application/json; charset=UTF-8'},
    body: json.encode(data)
  );
}