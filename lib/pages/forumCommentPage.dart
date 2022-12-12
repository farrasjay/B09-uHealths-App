import 'package:flutter/material.dart';
import 'package:uhealths/drawer.dart';
import 'package:uhealths/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:uhealths/models/forumDiscussion.dart';
import 'package:uhealths/models/forumComment.dart';
import 'package:uhealths/pages/discussionPage.dart';
import 'package:uhealths/pages/discussionDetail.dart';
import 'package:uhealths/pages/login.dart';
import 'package:provider/provider.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({super.key, required this.thisForum});
  final ForumDiscussion thisForum;
  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {

  final _formKey = GlobalKey<FormState>();
  String description = "";
  void _initSubmitComment(request) async {
    final response = await request.post(
      "https://pbp-midterm-project-b09-production.up.railway.app/forum/flutter/addComment/${widget.thisForum.pk}/", {
        'description': description,
      }
    ).then((value) {
      final newValue = new Map<String, dynamic>.from(value);
      print(newValue['status'].toString());
      setState(() {
        if (newValue['status'].toString() == "success") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Comment successfully added!"),
            backgroundColor: Colors.indigo[900],
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ForumDiscussionDetail(thisForum:widget.thisForum)
            ),
          );
        } else
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
            Text("Failed to add comment"),
            backgroundColor: Colors.redAccent,
          )
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(

      appBar: AppBar(
        title: Text('Add Forum Comment'),
      ),
      drawer: DrawerClass(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your comment",
                      labelText: "Comment",
                      icon: const Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    minLines: 5,
                    maxLines: 20,
                    onChanged: (String? value) {
                      setState(() {
                        description = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Topic cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Add Comment",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.indigo[900]
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _initSubmitComment(request);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}