import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> _listaTarefas = [];
  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    print("Path: ${dir.path}");

    return File("${dir.path}/data.json");
  }

  void _saveTarefa() {
    String taskStr = _controllerTarefa.text;

    Map<String, dynamic> tarefa = {
      "titulo": taskStr,
      "realizada": false,
    };

    setState(() {
      _listaTarefas.add(tarefa);
    });

    _saveFile();
  }

  Future<void> _saveFile() async {
    final file = await _getFile();
    String data = jsonEncode(_listaTarefas);
    await file.writeAsString(data);
  }

  Future<String> _readFile() async {
    try {
      final file = await _getFile();
      return await file.readAsString();
    } catch (e) {
      return "ERROR";
    }
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    final item =
        "${_listaTarefas[index]["titulo"]}${_listaTarefas[index]["realizada"].toString()}";

    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        /* Implementar essa função */
      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(_listaTarefas[index]["titulo"]),
        value: _listaTarefas[index]["realizada"],
        onChanged: (newVal) {
          setState(() {
            _listaTarefas[index]["realizada"] = newVal;
          });
          _saveFile();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _readFile().then((data) {
      setState(() {
        print("Data: $data");
        _listaTarefas = jsonDecode(data) ?? [];
        print("Data2: $_listaTarefas");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("items: $_listaTarefas");

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Color.fromARGB(255, 0, 139, 121),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 0, 255, 221),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                content: TextField(
                  controller: _controllerTarefa,
                  decoration: InputDecoration(labelText: "Digite sua tarefa"),
                  onChanged: (text) {},
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () {
                      _saveTarefa();
                      Navigator.pop(context);
                    },
                    child: Text("Salvar"),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: _listItemBuilder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
