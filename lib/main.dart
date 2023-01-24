// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_null_comparison, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var WtController = TextEditingController();
  var FtController = TextEditingController();
  var InController = TextEditingController();

  var result = '';
  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  TextField(
                    controller: WtController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Weight'),
                        prefixIcon: Icon(Icons.monitor_weight),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: FtController,
                    decoration: InputDecoration(
                        label: Text('Enter Your height in Feet'),
                        prefixIcon: Icon(Icons.height),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: InController,
                    decoration: InputDecoration(
                      label: Text('Enter Your height in inches'),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        var WT = WtController.text.toString();
                        var Ft = FtController.text.toString();
                        var IN = InController.text.toString();

                        if (WT != "" && Ft != "" && IN != "") {
                          setState(() {
                            var iwt = int.parse(WT);
                            var ift = int.parse(Ft);
                            var iin = int.parse(IN);

                            var tInch = (ift * 12) + iin;
                            var tCm = tInch * 2.54;
                            var tM = tCm / 100;

                            var Msg = '';

                            var bmi = iwt / (tM * tM);
                            if (bmi <= 18.5) {
                              bgColor = Colors.yellow;
                              Msg = 'You are Underweight';
                            } else if (bmi > 18.5 && bmi <= 25) {
                              bgColor = Colors.green;
                              Msg = 'You are Healthy';
                            } else if (bmi > 25) {
                              bgColor = Colors.red;
                              Msg = 'You are Overweight';
                            }

                            result =
                                '${Msg}\n Your BMI is ${bmi.toStringAsFixed(2)}';
                          });
                        } else {
                          setState(() {
                            result = ' Please enter all data';
                          });
                        }
                      },
                      child: Text('CALCULATE')),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
