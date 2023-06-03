import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SERVIÇO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('../../assets/detalhe_servico.png'),
            const Text('Lista de serviços oferecidos'),
            const SizedBox(height: 40), 
            const Text(
              'Conserto'
            ),
            
            const Text(
              'Limpeza'
            ),
            
            const Text(
              'Negociações'
            )
          ],
        ),
      ),
    );
  }
}