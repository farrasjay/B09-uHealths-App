import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../drawer.dart';
import '../model/healthstatus.dart';
import '../page/insert_health_stats.dart';
import '../page/login.dart';

class UserStatus {
  static late Fields _getStatus;
  static Fields get fetcher => _getStatus;
}

class HealthStatusPage extends StatefulWidget {
  const HealthStatusPage({Key? key}) : super(key: key);

  @override
  _HealthStatusPageState createState() => _HealthStatusPageState();
}

// "https://pbp-midterm-project-b09-production.up.railway.app/uhealths/ajax"
// "http://localhost:8000/uhealths/ajax"
class _HealthStatusPageState extends State<HealthStatusPage> {
  Future<List<HealthStatus>> fetchHealthStatusPage(CookieRequest request) async {
    var data = await request.get(
      "https://pbp-midterm-project-b09-production.up.railway.app/uhealths/ajax"
    );

    // convert the json data into HealthStatusPage object
    List<HealthStatus> listHealthStatusPage = [];
    for (var d in data) {
      if (d != null) {
        listHealthStatusPage.add(HealthStatus.fromJson(d));
      }
    }
    return listHealthStatusPage;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Health Status'),
          actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const InsertHealthstatsPage(),
                ),
              );
            },
            child: Text("Post New Healthstats"),
          ),
        ],
        ),
        drawer: DrawerClass(),
        body: FutureBuilder(
            future: fetchHealthStatusPage(request),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Status is empty, sadge D:",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    UserStatus._getStatus = snapshot.data![index].fields;
                                    showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: Container(
                                      child: ListView(
                                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Center(child: const Text('Status Details')),
                                          SizedBox(height: 20),
                                          Text(
                                            "Umur : " + UserStatus.fetcher.age.toString(),
                                            textAlign: TextAlign.center,
                                            ),
                                          Text(
                                            "Jenis Kelamin : " + UserStatus.fetcher.gender,
                                            textAlign: TextAlign.center,
                                            ),
                                          Text(
                                            "Berat Badan : " + UserStatus.fetcher.weight.toString(),
                                            textAlign: TextAlign.center,
                                            ),
                                          Text(
                                            "Tinggi Badan : " + UserStatus.fetcher.height.toString(),
                                            textAlign: TextAlign.center,
                                            ),
                                          Text(
                                            "Nilai BMI : " + UserStatus.fetcher.bmi.toStringAsFixed(2),
                                            textAlign: TextAlign.center,
                                            ),
                                          Text(
                                            "Nilai BMR : " + UserStatus.fetcher.bmr.toStringAsFixed(2),
                                            textAlign: TextAlign.center,
                                            ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Kembali'),
                                          ), 
                                        ],
                                      ),
                                    ),
                                  );
                                });
                                  },
                                  child: Text(
                                  "${snapshot.data![index].fields.lastUpdate}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                  )
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}