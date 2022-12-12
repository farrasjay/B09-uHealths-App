import 'package:flutter/material.dart';
import 'package:uhealths/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:uhealths/main.dart';
import 'package:uhealths/models/forumDiscussion.dart';
import 'package:uhealths/pages/discussionPage.dart';
import 'package:provider/provider.dart';

class DiscussionForm extends StatefulWidget {
  const DiscussionForm({super.key});

  @override
  State<DiscussionForm> createState() => _ForumFormState();
}

class _ForumFormState extends State<DiscussionForm> {
  final _formKey = GlobalKey<FormState>();
  String topic = "";
  DateTime? date = DateTime.now();
  String description = "";
  
  void _initSubmitForum(request) async {
    final response = await request.post(
      "https://pbp-midterm-project-b09-production.up.railway.app/forum/flutter/addDiscussion/", {
        
        'topic': topic,
        'description': description,
      }
    ).then((value) {
      final newValue = new Map<String, dynamic>.from(value);
      setState(() {
        if (newValue['status'].toString() == "success") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Success add forum!"),
              backgroundColor: Colors.green,
            )
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Forum()
            ),
          );
        } else 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed add forum"),
              backgroundColor: Colors.red,
            )
          );
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Comment'),
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
                      hintText: "Enter your Topic",
                      labelText: "Topic",
                      icon: const Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        topic = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        topic = value!;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Discussion",
                      labelText: "Discussion",
                      icon: const Icon(Icons.title),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    minLines: 10,
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
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo[900]),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _initSubmitForum(request);
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