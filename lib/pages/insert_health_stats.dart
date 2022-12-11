import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:uhealths/models/healthstatus.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

//TODO : UBAH DATA DI DJANGO KE JSON
//BIKIN MODEL BERDASARKAN DATA JSON
//POST DATA
Future<void> createHealthStatus(CookieRequest request, int age, int height,
    int weight, int calories_intake, String gender) async {
  final data = {
    'age': age,
    'height': height,
    'weight': weight,
    'gender': gender,
    'calories_intake': calories_intake,
  };
  final response = await request.post(
      //endpoint ??
      'https://pbp-midterm-project-b09-production.up.railway.app/uhealths/ajax-post/',
      jsonEncode(data));

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print('success');
    //return HealthStatus.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create object.');
  }
}

class HealthStatsForm extends StatefulWidget {
  const HealthStatsForm({super.key});
  @override
  State<HealthStatsForm> createState() => _MyHealthStatsFormPage();
}

class _MyHealthStatsFormPage extends State<HealthStatsForm> {
  final _formKey = GlobalKey<FormState>();
  late int age = 0;
  late int height = 0;
  late int weight = 0;
  late String gender = "";
  late int calories_intake;
  late double bmi;
  late double bmr;
  late String status;
  List<String> listGender = ["Male", "Female"];
  Future<void>? _futureHealthStatus;
  //Future<HealthStatus>? _futureHealthStatus;
  double calculate_bmi(int height, int weight) {
    double denominator = (height / 100);
    double bmi = weight / (denominator * denominator);
    return bmi;
  }

  double calculate_bmr(String gender, int height, int weight, int age) {
    double bmr = 0.0;
    if (gender == 'Male') {
      bmr = 66.5 + (13.7 * weight) + (5 * height) - (6.7 * age);
    } else {
      bmr = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    }
    return bmr;
  }

  bool isNumber(String num) {
    if (num == null) {
      return false;
    }
    return double.tryParse(num) != null;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Health Status'),
      ),
      drawer: null,
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
                      hintText: "Age",
                      labelText: "Age",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        //assign value to a variable
                        age = isNumber(value!) ? int.parse(value) : 0;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        //assign value to a variable
                        age = isNumber(value!) ? int.parse(value) : 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Data cannot be empty!';
                      } else {
                        if (!(isNumber(value))) {
                          return 'Data must be a number';
                        }
                        return null;
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 500,
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          value: gender != "" ? gender : null,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: listGender.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              gender = newValue!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty || value == "") {
                              return '!';
                            }
                            return null;
                          },
                          hint: Container(
                            //and here
                            child: Text(
                              "Gender",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "height",
                      labelText: "height",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        //assign value to a variable
                        height = isNumber(value!) ? int.parse(value) : 0;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        //assign value to a variable
                        height = isNumber(value!) ? int.parse(value) : 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Data cannot be empty!';
                      } else {
                        if (!(isNumber(value))) {
                          return 'Data must be a number';
                        }
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "weight",
                      labelText: "weight",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        //assign value to a variable
                        weight = isNumber(value!) ? int.parse(value) : 0;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        //assign value to a variable
                        weight = isNumber(value!) ? int.parse(value) : 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Data cannot be empty!';
                      } else {
                        if (!(isNumber(value))) {
                          return 'Data must be a number';
                        }
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "calories intake",
                      labelText: "calories intake",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        //assign value to a variable
                        calories_intake =
                            isNumber(value!) ? int.parse(value) : 0;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        //assign value to a variable
                        calories_intake =
                            isNumber(value!) ? int.parse(value) : 0;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Data cannot be empty!';
                      } else {
                        if (!(isNumber(value))) {
                          return 'Data must be a number';
                        }
                        return null;
                      }
                    },
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              final data = {
                                'age': age,
                                'height': height,
                                'weight': weight,
                                'gender': gender,
                                'calories_intake': calories_intake,
                              };

                              _futureHealthStatus = createHealthStatus(request,
                                  age, height, weight, calories_intake, gender);
                              bmi = calculate_bmi(height, weight);
                              bmr = calculate_bmr(gender, height, weight, age);
                              if (bmi < 18.5) {
                                status = 'Thinnes';
                              } else if (bmi >= 18.5 && bmi < 25) {
                                status = 'Normal';
                              } else if (bmi >= 25 && bmi < 30) {
                                status = 'Overweight';
                              } else {
                                status = 'Obese';
                              }
                            });
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
                                      padding: const EdgeInsets.only(
                                          top: 40, bottom: 40),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Center(
                                            child: Text(
                                          'The data has been updated! \n\n\n BMI: $bmi ($status) \n\n BMR: $bmr',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 11, 42, 97)),
                                        )),
                                        SizedBox(height: 60),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )

                //tambahkan field lainnya
              ],
            ),
          ),
        ),
      ),
      //
    );
  }
}
