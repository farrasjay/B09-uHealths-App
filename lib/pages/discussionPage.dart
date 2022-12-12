import 'package:flutter/material.dart';
import 'package:uhealths/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:uhealths/models/forumDiscussion.dart';
import 'package:uhealths/pages/discussionDetail.dart';
import 'package:uhealths/pages/discussionForm.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  Future<List<ForumDiscussion>> fetchForumDiscussion() async {
  var url = Uri.parse('https://pbp-midterm-project-b09-production.up.railway.app/forum/discussionFlutter/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<ForumDiscussion> listDiscussion = [];
  for (var forum in data) {
    if (forum != null) {
      listDiscussion.add(ForumDiscussion.fromJson(forum));
    }
  }
  return listDiscussion;
  }

  @override

  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text ("Forums"),
      ),
      drawer: DrawerClass(),
      body: SingleChildScrollView(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (request.loggedIn)
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo.shade900),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiscussionForm()
                    ),
                  );
                },
                child: const SizedBox(
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(
                      "Add New Discussion",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                )
              ),
            FutureBuilder<List<ForumDiscussion>>(
              future: fetchForumDiscussion(),
              builder: (context, AsyncSnapshot<List<ForumDiscussion>> snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children:[
                        Text(
                          "Nothing here",
                        ),
                        const SizedBox(
                          height: 8
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                        // make anything clickable
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForumDiscussionDetail(
                                thisForum:snapshot.data![index]
                              )
                            ),
                          );
                        },
                        child: Padding(
                          padding:const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.yellow[200],
                              borderRadius: BorderRadius.circular(17.0),
                              border: Border(
                                top: BorderSide(width: 2, color: Colors.indigo.shade900),
                                left: BorderSide(width: 2, color: Colors.indigo.shade900),
                                right: BorderSide(width: 2, color: Colors.indigo.shade900),
                                bottom: BorderSide(width: 2, color: Colors.indigo.shade900),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Flexible(
                                  child: Text(
                                    snapshot.data![index].topic,
                                    style: TextStyle(
                                      color: Colors.indigo.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Created by : ${snapshot.data![index].creator}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      height: 2,
                                    )
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Created on : ${DateTime.parse(snapshot.data![index].dateCreated.toString())}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      height: 2,
                                    )
                                  ),
                                ),
                              ]
                            )
                          )
                        ),
                      )
                    );
                  }
                }
              },
            )
          ]
        )
      )
    );
  }
}
