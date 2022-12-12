import 'package:flutter/material.dart';
import 'package:uhealths/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:uhealths/models/forumDiscussion.dart';
import 'package:uhealths/models/forumComment.dart';
import 'package:uhealths/pages/discussionPage.dart';
import 'package:uhealths/pages/discussionForm.dart';
import 'package:uhealths/pages/forumCommentPage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForumDiscussionDetail extends StatefulWidget {
  const ForumDiscussionDetail({super.key, required this.thisForum});
  final ForumDiscussion thisForum;

  @override
  State<ForumDiscussionDetail> createState() => _ForumDiscussionDetailState();
}

class _ForumDiscussionDetailState extends State<ForumDiscussionDetail> {

  Future<List<ForumComment>> fetchForumComment(id) async {
  var url = Uri.parse('https://pbp-midterm-project-b09-production.up.railway.app/forum/commentFlutter/${id}/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<ForumComment> listComment = [];
  for (var comment in data) {
    if (comment != null) {
      listComment.add(ForumComment.fromJson(comment));
    }
  }
  return listComment;
  }

  @override
  Widget build(BuildContext context) {

    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forums Detail'),
      ),
      drawer: DrawerClass(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    widget.thisForum.topic,
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Created By : ${widget.thisForum.creator}\n',
                          style: TextStyle(
                            fontSize: 16.0,
                            height: 2,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        TextSpan(
                          text: '${widget.thisForum.description}\n',
                          style: TextStyle(
                            fontSize: 14.0,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: 'Created On : ${widget.thisForum.dateCreated}\n',
                          style: TextStyle(
                            fontSize: 12.0,
                            height: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center, 
                children:[
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow[300]),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Forum()
                        ),
                      );
                    },
                    child: const SizedBox(
                      height: 40,
                      width: 190,
                      child: Center(
                        child: Text(
                          "Return to Discussions",
                          style: TextStyle(
                            color: Colors.black, 
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                      )
                    )
                  ),
                  if (request.loggedIn)
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.indigo[900]),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentForm(thisForum:widget.thisForum)
                          ),
                        );
                      },
                      child: const SizedBox(
                        height: 40,
                        width: 190,
                        child: Center(
                          child: Text(
                            "Add New Comment",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      )
                    ),
                  FutureBuilder<List<ForumComment>>(
                    future: fetchForumComment(widget.thisForum.pk),
                    builder: (context, AsyncSnapshot<List<ForumComment>> snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Column(
                            children: [
                              const Text(
                                "Nothing here",
                              ),
                              const SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              padding: EdgeInsets.all(12),
                              height:150,
                              decoration: BoxDecoration(
                                color: Colors.indigo[900],
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Padding(
                                padding:const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        snapshot.data![index].creator,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(255, 255, 225, 0),
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          letterSpacing: 1.0,
                                        )
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        snapshot.data![index].description,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        )
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Created On : ${snapshot.data![index].dateCreated}",
                                        style: const TextStyle(
                                          height: 3,
                                          fontSize: 10,
                                          color: Colors.white,
                                        )
                                      ),
                                    ),
                                  ]
                                )
                              )
                            ),
                          );
                        }
                      }
                    },
                  )
                ]
              ),
            ],
          ),
        )
      ),
    );
  }
}
