import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(const MaterialApp(
    title: "Campeonato de Futebol",
    debugShowCheckedModeBanner: false,
    home: CampeonatoListScreen(),
  ));
}

class CampeonatoListScreen extends StatelessWidget {
  const CampeonatoListScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Campeonatos'),
      ),
      body: Center(
        child: FutureBuilder<List<Campeonato>>(
          future: getCampeonatos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar os campeonatos');
            } else {
              final campeonatos = snapshot.data;
              return ListView.builder(
                itemCount: campeonatos?.length,
                itemBuilder: (context, index) {
                  final campeonato = campeonatos![index];
                  return ListTile(
                    title: Text(campeonato.nome),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CampeonatoInfoScreen(campeonato.id),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Campeonato>> getCampeonatos() async {
    const url = 'https://api.api-futebol.com.br/v1/';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final campeonatos = List<Campeonato>.from(data['campeonatos'].map(
        (campeonato) {
          return Campeonato(
            campeonato['id'],
            campeonato['nome'],
          );
        },
      ));

      return campeonatos;
    } else {
      throw Exception('Falha ao obter os campeonatos');
    }
  }
}

class Campeonato {
  final int id;
  final String nome;

  Campeonato(this.id, this.nome);
}

class CampeonatoInfoScreen extends StatelessWidget {
  final int campeonatoId;

  const CampeonatoInfoScreen(this.campeonatoId, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Campeonato'),
      ),
      body: Center(
        child: FutureBuilder<Campeonato>(
          future: getCampeonatoInfo(campeonatoId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar as informações do campeonato');
            } else {
              final campeonato = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nome: ${campeonato?.nome}'),
                  // Text('Local: ${campeonato?.local}'),
                  // Exiba outras informações relevantes do campeonato
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<Campeonato> getCampeonatoInfo(int campeonatoId) async {
    final url = 'https://api.api-futebol.com.br/v1/$campeonatoId';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final campeonato = Campeonato(
        data['id'],
        data['nome'],
        // data['local'],
      );

      return campeonato;
    } else {
      throw Exception('Falha ao obter as informações do campeonato');
    }
  }
}

class TimeInfoScreen extends StatelessWidget {
  final int campeonatoId;
  final int timeId;

  const TimeInfoScreen(this.campeonatoId, this.timeId, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Time'),
      ),
      body: Center(
        child: FutureBuilder<Time>(
          future: getTimeInfo(campeonatoId, timeId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar as informações do time');
            } else {
              final time = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nome: ${time?.nome}'),
                  Text('Fundação: ${time?.fundacao}'),
                  // Exiba outras informações relevantes do time
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<Time> getTimeInfo(int campeonatoId, int timeId) async {
    final url = 'https://api.api-futebol.com.br/v1/$campeonatoId/times/$timeId';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final time = Time(
        data['id'],
        data['nome'],
        data['fundacao'],
      );

      return time;
    } else {
      throw Exception('Falha ao obter as informações do time');
    }
  }
}

class Time {
  final int id;
  final String nome;
  final String fundacao;

  Time(this.id, this.nome, this.fundacao);
}
