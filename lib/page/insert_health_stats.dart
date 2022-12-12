import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../drawer.dart';
import '../page/healthstatus_page.dart';

class InsertHealthstatsPage extends StatefulWidget {
    const InsertHealthstatsPage({key});

    @override
    State<InsertHealthstatsPage> createState() => _InsertHealthstatsPageState();
}

class _InsertHealthstatsPageState extends State<InsertHealthstatsPage> {
  String age = "";
  String gender = "";
  String height = "";
  String weight = "";
  String calories_intake = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: Text('Form Healthstats'),
            ),
             // Menambahkan drawer menu
            drawer: DrawerClass(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Ex:20",
                                      labelText: "Umur",
                                      // Menambahkan icon agar lebih intuitif
                                      icon: const Icon(Icons.people),
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          age = value!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Umur tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Male/Female/etc",
                                      labelText: "Jenis Kelamin",
                                      // Menambahkan icon agar lebih intuitif
                                      icon: const Icon(Icons.people),
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          gender = value!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Jenis Kelamin tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "in CM",
                                      labelText: "Tinggi Badan",
                                      // Menambahkan icon agar lebih intuitif
                                      icon: const Icon(Icons.people),
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          height = value!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Tinggi badan tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "in Kg",
                                      labelText: "Berat Badan",
                                      // Menambahkan icon agar lebih intuitif
                                      icon: const Icon(Icons.people),
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          weight = value!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Berat badan tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Intake Calories ex:2000",
                                      labelText: "Pemasokan Kalori",
                                      // Menambahkan icon agar lebih intuitif
                                      icon: const Icon(Icons.people),
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          calories_intake = value!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Pemasokan kalori tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          TextButton(
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          // https://pbp-midterm-project-b09-production.up.railway.app/uhealths/insert-healthstats-flutter/
                          // http://localhost:8000/uhealths/insert-healthstats-flutter/
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final response = await request.post(
                              "https://pbp-midterm-project-b09-production.up.railway.app/uhealths/insert-healthstats-flutter/",
                              jsonEncode(<String, String>{
                                'height': height,
                                'weight': weight,
                                'age': age,
                                'gender': gender,
                                'calories_intake': calories_intake
                              }));
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => const HealthStatusPage(),
                                ),
                              );
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: ListView(
                                      padding:
                                          const EdgeInsets.only(top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        const Center(child: Text('Informasi Data')),
                                        const SizedBox(height: 20),
                                        const Text(
                                          'Data Sudah Ditambahkan',
                                          textAlign: TextAlign.center,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Kembali'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          }
                            ),
                        ],
                  ),
                ),
                ),
            ),
        );
    }
}