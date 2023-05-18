import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Frases Aleatórias"),
        backgroundColor: Colors.green[300],
      ),
      body: Center( 
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Image.asset("../assets/images/title.png"),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text("Clique aqui")
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text("Nova frase"),
              )
              ),
              
            ],
          )
        )
      )
    );
  }
}