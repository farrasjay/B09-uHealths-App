import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:intl/intl.dart';

import 'package:uhealths/faq/model/question_model.dart';
import 'package:uhealths/faq/model/status_model.dart';
import 'package:uhealths/faq/util/future.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class TombolLike extends StatefulWidget {
  const TombolLike({super.key, required this.id, required this.numLike, required this.userLike});
  final int id;
  final int numLike;
  final List<dynamic> userLike;
  @override
  State<TombolLike> createState() => _TombolLikeState();
}

class _TombolLikeState extends State<TombolLike> {
  Color iconColor = Colors.grey;
  String teksLike = "Like";
  int i = 0;
  double opacityLevel = 1.0;
  bool liked = false;

 

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUser(context),
      builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            print("KOSONG");
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: Text(teksLike, style: TextStyle(color: Colors.red)),
                  onPressed: (){
                    setState(() {
                      String teksTemp;
                      Color colorTemp;
              
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Warning!'),
                            content: const Text('Anda Perlu Login'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              )
                            ],
                          )
                        );
                      }
                    );
                  }, 
                  
                ),
                IconButton(
                  color: iconColor,
                  icon: Icon(Icons.favorite),
                  onPressed: () {             
                    return;
                  },
                ),
              Text(widget.numLike.toString(), style: TextStyle(color: Colors.black))
              ],
            );  
          } else {                    
            print("ini jalan kok");      
            Status status = snapshot.data!;
            if(widget.userLike.contains(status.user)){
              iconColor = Colors.red;
              teksLike = "Unlike";
            }
            else{
              iconColor = Colors.grey;
              teksLike = "Like";
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: Text(teksLike, style: TextStyle(color: Colors.red),),
                  onPressed: (){
                    setState(() {
                      var hasil = addLike(context, widget.id);
                      if(widget.userLike.contains(status.user)){
                        print("udah pernah di like");
                        _changeOpacity();
                        
                        widget.userLike.remove(status.user);
                        i--;
                        
                          Future.delayed(const Duration(seconds: 1), () {
                          // Here you can write your code
                            setState(() {  
                              _changeOpacity();  
                              teksLike = "Like";
                              iconColor =  Colors.grey;
                              
                            });
                          });
                          
                        
                      }
                      else{
                        print("belum");
                        i++;
                        widget.userLike.add(status.user);
                        _changeOpacity();
                        Future.delayed(const Duration(seconds: 1), () {
                        // Here you can write your code
                          setState(() {  
                            _changeOpacity();
                            iconColor =  Colors.red;
                            teksLike = "Unlike";                         
                          });
                        });
                        
                      }
                    });
                  }, 
                  
                ),
                AnimatedOpacity(
                  opacity: opacityLevel,
                  duration: const Duration(milliseconds: 500),
                  child: IconButton(
                  color: iconColor,
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    return;
                  },
                  ),
                ),
                

               
              Text((widget.numLike + i).toString())
              ],
            );  
          }
          }
        );

  }
}



class FutureQuestionCard extends StatefulWidget {
  final Function refresh;
  const FutureQuestionCard(
      {super.key, required this.refresh});


  @override
  State<FutureQuestionCard> createState() => _FutureQuestionCardState();
}

class _FutureQuestionCardState extends State<FutureQuestionCard> {
  bool status_user = false;
  List<bool> show =[false, false, false, false, false, false, false, false, false, false, false, false, false];



  @override
  Widget build(BuildContext context) {
    // final request = context.watch<CookieRequest>();

    // String url = "https://api.npoint.io/c72e4b4f1b5bbf05ce14";
    String url = "https://pbp-midterm-project-b09-production.up.railway.app/uhealths/faq/getjson/";
    print("BERHASIL DAPAT");

    return FutureBuilder(
        future: fetchQuestion(context, url),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            // print("BJIR NULL");
            return const Center();
          } else {
            if (!snapshot.hasData) {
              print("KOSONG");
              return Column(
                children: [
                  Text(
                    "Tidak ada Artikel",
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              // print("GAK KOSOnG KOK");
              List<Question> listQuestion = snapshot.data!;
              // print(listQuestion.length);
              return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listQuestion.length,
                    itemBuilder: (context, index) {
                      Question question = listQuestion[index];

                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   mainAxisSize: MainAxisSize.min,
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.fromLTRB(10, 5, 10, 3),

                                    //       child: Text(question.fields.question, style: TextStyle(fontFamily: '/Cairo/Cairo-Bold.ttf', fontSize: 23),
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: Visibility(child: Text(question.fields.answer, style: TextStyle(fontFamily: '/Cairo/Cairo-SemiBold.ttf')), visible: true,),
                                    //     ) ,
                                    //   ],
                              
                
                                    // ),
                                    FutureBuilder(
                                      future: fetchUser(context),
                                      builder: (context, AsyncSnapshot snapshot) {
                            
                                        if (!snapshot.hasData) {
                                          status_user = false;
                                          print("KOSONG");
                                        
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(10, 5, 10, 3),

                                                child: Text(question.fields.question, style: TextStyle(fontFamily: '/Cairo/Cairo-Bold.ttf', fontSize: 23),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Visibility(child: Text(question.fields.answer, style: TextStyle(fontFamily: '/Cairo/Cairo-SemiBold.ttf')), visible: show.elementAt(question.pk)),
                                              ) ,
                                            ],
                                    
                      
                                          );
                                        }
                                        else { 
                                          status_user = true;
                                          print("STATUS USER TRUE KARENA MASUK ELSE "+ status_user.toString());

                                          return FutureBuilder(
                                            future: fetchSession(context),
                                            builder: (context, AsyncSnapshot snapshot) {
                                              if (!snapshot.hasData) {
                                                print("KOSONG");
                                        
                                                return Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 3),

                                                      child: Text(question.fields.question, style: TextStyle(fontFamily: '/Cairo/Cairo-Bold.ttf', fontSize: 23),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Visibility(child: Text(question.fields.answer, style: TextStyle(fontFamily: '/Cairo/Cairo-SemiBold.ttf')), visible: show.elementAt(question.pk)),
                                                    ) ,
                                                  ],                                                                                                      
                                          );
                                        }else{
                                          return Row();

                                        }
                             
                                      }
                                    );}
                                      }
                                    ),
                                    IconButton(onPressed:() {
                                      print("STATUS : " +status_user.toString());
                                      setState(() {
                                        show[question.pk] = show.elementAt(question.pk) == true ? false : true;
                                        // if(status_user){
                                        //   print("ADA USER LOGIN LOh");                        
                                        //     addSession(context, question.pk);
                                        // }
                                      });
                                      
                                      return;
                                      }, 
                                      icon: Icon(Icons.add_circle_outlined)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        TextButton(
                                          child: TombolLike(id: question.pk, numLike : question.fields.liked.length, userLike: question.fields.liked),
                                          onPressed: () {/* ... */},
                                        ),
                                        const SizedBox(width: 8),
                                        
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                           
                  
                            ] 


                            
                        ),
                      );
                    },
                    

                  );

            
              
                
            }
          }
        });
  }
}


