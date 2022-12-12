import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uhealths/drawer.dart';
import 'package:uhealths/faq/model/session.dart';
import 'package:uhealths/faq/model/status_model.dart';
import 'package:uhealths/faq/page/faq_widget.dart';
import 'package:uhealths/faq/util/future.dart';
// import 'package:my_panel/util/drawer.dart';

// import 'package:google_fonts/google_fonts.dart'; // font style
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});
  

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController questionController = TextEditingController();
  List<int> listUser = [];
  String _pertanyaan = "";
  double fontJudul = 22;
  final rawSvg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2000 1500"><defs><pattern id="b" width="3" height="3" patternTransform="matrix(50 0 0 50 -49000 -36750)" patternUnits="userSpaceOnUse"><use y="2" fill="#fcfcfc" href="#a"/><use x="1" y="2" fill="#fcfcfc" href="#a"/><use x="2" y="2" fill="#fafafa" href="#a"/><use fill="#fafafa" href="#a"/><use x="2" fill="#f7f7f7" href="#a"/><use x="1" y="1" fill="#f7f7f7" href="#a"/></pattern><pattern id="c" width="7" height="11" patternTransform="matrix(50 0 0 50 -49000 -36750)" patternUnits="userSpaceOnUse"><g fill="#f5f5f5"><use href="#a"/><use y="5" href="#a"/><use x="1" y="10" href="#a"/><use x="2" y="1" href="#a"/><use x="2" y="4" href="#a"/><use x="3" y="8" href="#a"/><use x="4" y="3" href="#a"/><use x="4" y="7" href="#a"/><use x="5" y="2" href="#a"/><use x="5" y="6" href="#a"/><use x="6" y="9" href="#a"/></g></pattern><pattern id="d" width="5" height="13" patternTransform="matrix(50 0 0 50 -49000 -36750)" patternUnits="userSpaceOnUse"><g fill="#f5f5f5"><use y="5" href="#a"/><use y="8" href="#a"/><use x="1" y="1" href="#a"/><use x="1" y="9" href="#a"/><use x="1" y="12" href="#a"/><use x="2" href="#a"/><use x="2" y="4" href="#a"/><use x="3" y="2" href="#a"/><use x="3" y="6" href="#a"/><use x="3" y="11" href="#a"/><use x="4" y="3" href="#a"/><use x="4" y="7" href="#a"/><use x="4" y="10" href="#a"/></g></pattern><pattern id="e" width="17" height="13" patternTransform="matrix(50 0 0 50 -49000 -36750)" patternUnits="userSpaceOnUse"><g fill="#f2f2f2"><use y="11" href="#a"/><use x="2" y="9" href="#a"/><use x="5" y="12" href="#a"/><use x="9" y="4" href="#a"/><use x="12" y="1" href="#a"/><use x="16" y="6" href="#a"/></g></pattern><pattern id="f" width="19" height="17" patternTransform="matrix(50 0 0 50 -49000 -36750)" patternUnits="userSpaceOnUse"><g fill="#fff"><use y="9" href="#a"/><use x="16" y="5" href="#a"/><use x="14" y="2" href="#a"/><use x="11" y="11" href="#a"/><use x="6" y="14" href="#a"/></g><g fill="#efefef"><use x="3" y="13" href="#a"/><use x="9" y="7" href="#a"/><use x="13" y="10" href="#a"/><use x="15" y="4" href="#a"/><use x="18" y="1" href="#a"/></g></pattern><pattern id="g" width="47" height="53" patternTransform="matrix(50 0 0 50 -49000 -36750)" patternUnits="userSpaceOnUse"><g fill="#F60"><use x="2" y="5" href="#a"/><use x="16" y="38" href="#a"/><use x="46" y="42" href="#a"/><use x="29" y="20" href="#a"/></g></pattern><pattern id="h" width="59" height="71" patternTransform="matrix(50 0 0 50 -49000 -36750)" patternUnits="userSpaceOnUse"><g fill="#F60"><use x="33" y="13" href="#a"/><use x="27" y="54" href="#a"/><use x="55" y="55" href="#a"/></g></pattern><pattern id="i" width="139" height="97" patternTransform="matrix(50 0 0 50 -49000 -36750)" patternUnits="userSpaceOnUse"><g fill="#F60"><use x="11" y="8" href="#a"/><use x="51" y="13" href="#a"/><use x="17" y="73" href="#a"/><use x="99" y="57" href="#a"/></g></pattern><path id="a" stroke="#fff" stroke-width=".5" d="M0 0h1v1H0z"/></defs><rect width="100%" height="100%" fill="url(#b)"/><rect width="100%" height="100%" fill="url(#c)"/><rect width="100%" height="100%" fill="url(#d)"/><rect width="100%" height="100%" fill="url(#e)"/><rect width="100%" height="100%" fill="url(#f)"/><rect width="100%" height="100%" fill="url(#g)"/><rect width="100%" height="100%" fill="url(#h)"/><rect width="100%" height="100%" fill="url(#i)"/></svg>';

  @override
  Widget build(BuildContext context) {
    void refresh() {
      setState(() {});
      print("Berhasil refresh halaman myArticle");
    }


    // final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
             "Frequently Asked Question"),
      ),
      
      drawer: DrawerClass(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.symmetric(horizontal: 1),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/faq_bg.png'), 
              fit: BoxFit.none, repeat: ImageRepeat.repeat),
              
          ),
          child:
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 100),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,20,0,30),
                      child: Text("Frequently Asked Question", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),),
                    )
                  ),
                  FutureQuestionCard(refresh: () => refresh()),
                  Align(
                    alignment: Alignment.center,
                    child: 
                      ElevatedButton(
                      onPressed: () {
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text('Question'),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Question',
                                      ),
                                      controller: questionController,
                                      keyboardType: TextInputType.text,
                                      onSaved: (value) {
                                        questionController.text = value!;
                                      },
                                      textInputAction: TextInputAction.done,

                                    ),
                                    FutureBuilder(
                                      future: fetchUser(context),
                                      builder: (context, AsyncSnapshot snapshot) {
                                        if (!snapshot.hasData) {
                                          print("KOSONG");
                                        
                                          return Text("Anda Harus Login", style: TextStyle(color: Colors.red),);
                                        }
                                        else {
 
                                          return Row();}
                                      }
                                    ),                 
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  child: Text("Submit"),
                                  onPressed: () {
                                    // your code
                                    if (_formKey.currentState!.validate()) {
                                      _pertanyaan = questionController.text;
                                      print("Pertanyaan"+_pertanyaan);
                                      sendQuestion(context, _pertanyaan);
                                    }
                                    Navigator.pop(context);
                                  })
                            ],
                          );
                        });
                        
                      },
                      // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                      style: ElevatedButton.styleFrom(
                          elevation: 12.0,
                          textStyle: const TextStyle(color: Color(0xFF0D47A1)),
                          fixedSize: Size.fromWidth(180)),
                      child: Row(children: [Icon(Icons.add_circle_outline), Text("Send Your Question")],),
                ),
                    
                  ),
                
                  
                  
                ]),
              ),
        ),
      ),
    );
  }
}