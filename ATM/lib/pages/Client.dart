import 'package:flutter/material.dart';

class Client extends StatelessWidget {
  const Client({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CLIENTES'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('../../assets/detalhe_cliente.png'),
            const Text('Lista de clientes'),
            const SizedBox(height: 40), 
            const Text("Empresa de servicos"),
            Image.asset('../../assets/cliente1.png'),
            const SizedBox(height: 10), 
            const Text("Empresa de auditoria"),
            Image.asset('../../assets/cliente2.png')
          ],
        ),
      ),
    );
  }
}