import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _msg = "Clique abaixo para gerar a frase";

  List<String> messages = ["Bom dia!", "Boa tarde!", "Nova frase"];

  void _generateText() {
    int i = Random().nextInt(messages.length);
    setState(() {
      this._msg = messages[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Frases Aleatórias"),
          backgroundColor: Colors.green[300],
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "../../assets/images/title.png",
                      fit: BoxFit.fill,
                      scale: 1.5,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(_msg,
                            style: TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic))),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                          onPressed: () => _generateText(),
                          child: Text("Nova frase",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green)),
                    ),
                  ],
                ))));
  }
}
