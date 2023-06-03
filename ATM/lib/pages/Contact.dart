import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('../../assets/detalhe_contato.png'),
            const Text('CONTATO'),
            const SizedBox(height: 40), 
            const Text(
              'Email: atendimento@gmail.com'
            ),
            const SizedBox(height: 5), 
            const Text(
              'Telefone: 6666-6666'
            ),
            const SizedBox(height: 5), 
            const Text(
              'Celular: (21) 99999-9999'
            )
          ],
        ),
      ),
    );
  }
}