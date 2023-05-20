import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(JoKenPoApp());

class JoKenPoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JoKenPo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JoKenPoScreen(),
    );
  }
}

class JoKenPoScreen extends StatefulWidget {
  @override
  _JoKenPoScreenState createState() => _JoKenPoScreenState();
}

class _JoKenPoScreenState extends State<JoKenPoScreen> {
  String appChoice = '';
  String result = '';

  void playGame(String userChoice) {
    setState(() {
      // Gerar escolha aleatória do App
      final choices = ['Pedra', 'Papel', 'Tesoura'];
      final random = Random();
      final randomIndex = random.nextInt(choices.length);
      appChoice = choices[randomIndex];

      // Determinar o resultado do jogo
      if (userChoice == appChoice) {
        result = 'Empate';
      } else if ((userChoice == 'Pedra' && appChoice == 'Tesoura') ||
          (userChoice == 'Papel' && appChoice == 'Pedra') ||
          (userChoice == 'Tesoura' && appChoice == 'Papel')) {
        result = 'Vencedor';
      } else {
        result = 'Perdedor';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JoKenPo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Escolha do App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Escolha uma opção:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            appChoice.isNotEmpty
                ? Image.asset(
                    '../assets/default.png',
                    width: 300,
                    height: 300,
                  )
                : Container(),
            SizedBox(height: 20),
            Text(
              result.isNotEmpty ? result : ' ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => playGame('Pedra'),
                  child: Image.asset(
                    '../assets/pedra.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => playGame('Papel'),
                  child: Image.asset(
                    '../assets/papel.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => playGame('Tesoura'),
                  child: Image.asset(
                    '../assets/tesoura.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
