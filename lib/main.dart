import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyCalculator());
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key key}) : super(key: key);

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  String originalPrice = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gautam Price Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(
                hintText: 'Enter your code',
              ),
              validator: (String value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        String value = priceController.text.toLowerCase();
                        String price = "";
                        value.runes.forEach((int rune) {
                          var character = new String.fromCharCode(rune);
                          switch (character) {
                            case 'b':
                              setState(() {
                                price += "0";
                              });
                              break;
                            case 'o':
                              setState(() {
                                price += "1";
                              });
                              break;
                            case 'y':
                              setState(() {
                                price += "2";
                              });
                              break;
                            case 'f':
                              setState(() {
                                price += "3";
                              });
                              break;
                            case 'r':
                              setState(() {
                                price += "4";
                              });
                              break;
                            case 'i':
                              setState(() {
                                price += "5";
                              });
                              break;
                            case 'e':
                              setState(() {
                                price += "6";
                              });
                              break;
                            case 'n':
                              setState(() {
                                price += "7";
                              });
                              break;
                            case 'd':
                              setState(() {
                                price += "8";
                              });
                              break;
                            default:
                              setState(() {
                                price += "9";
                              });
                          }
                        });
                        setState(() {
                          originalPrice = price;
                        });
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                ),
                Padding(
                  child: ElevatedButton(
                    child: Text("Reset"),
                    onPressed: () => {
                      setState(() {
                        priceController.clear();
                        originalPrice = "";
                      })
                    },
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                )
              ],
            ),
            RichText(
              text: TextSpan(
                  text: "Your Price is:",
                  style: TextStyle(color: Colors.black, fontSize: 38),
                  children: [
                    TextSpan(
                      text: originalPrice,
                      style: TextStyle(color: Colors.blueAccent, fontSize: 48),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
