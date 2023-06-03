// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Company extends StatelessWidget {
  const Company({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMPRESA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('../../assets/detalhe_empresa.png'),
            const SizedBox(height: 30), 
            const Text('Descrição:'),
            const Text(
              'Somos uma empresa de consultoria TOP de linha!'
            ),

          ],
        ),
      ),
    );
  }
}
