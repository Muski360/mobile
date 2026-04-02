// Situação de aprendizagem 02 - aplicativo To Do List

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TodoListView(),
  ));
}


// a classe da Janela Stateful

// 1º classe: identifica as mudanças de estado e chama o rebuild da tela
class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  //chama o rebuild
  @override
  State<TodoListView> createState() => _TodoListViewState(); //arrow function
}

// 2º classe: fica toda a lógica da tela, atributos / métodos
class _TodoListViewState extends State<TodoListView> {
  // atributos 
  //obj para controlar os dados do input
  //final => permite a mudanã de valor uma única vez
  // _ = private
  final TextEditingController _tarefasController = TextEditingController(); // pegar o valor do input
  final List<Map<String, dynamic>> _tarefas = []; // lista de Coleções [{}, {}, {}]. Cada Coleção é um MAP (Key, Value)

  // métodos

  // build => lógica por trás da Janela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de tarefas"), centerTitle: true,),
      body: Padding(
        //espaçamento 
        padding: EdgeInsets.all(8),
        child: Column(children: [
          //adicionar + de 1 elemento
          //input da tarefa
          TextField(
            controller: _tarefasController,
            decoration:  InputDecoration(
              labelText: "Digite uma tarefa..."
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _adicionarTarefa, 
            child: Text("Adicionar tarefa")),

            //Scroll de parte da tela somente
            Expanded(child: ListView.builder(
              itemCount: _tarefas.length, 
              itemBuilder: (context, index) => 
              // ForEach
              ListTile(
                title: Text(_tarefas[index]["titulo"], style: TextStyle(
                  decoration: _tarefas[index]["concluida"]? TextDecoration.lineThrough : null
                )),
                // adicionar um checkbox antes do texto

                leading: Checkbox(
                 value: _tarefas[index]["concluida"],
                 onChanged: (bool? valor) => setState(() {
                  _tarefas[index]["concluida"] = valor!;
                 })),


                trailing: IconButton(onPressed: () => _removerTarefa(index), 
                icon: Icon(Icons.delete)),
              ),
        ),)
        ],
        ),));
  }

// método para adicionar tarefa
  void _adicionarTarefa() {
    if(_tarefasController.text.trim().isNotEmpty){
      // se tarefa não estiver vazia
      // adiciona a tarefa a lista
      // mudar o estado da janela
      setState(() {
        // envia um aviso da mudança de estado
        _tarefas.add({"titulo":_tarefasController.text.trim(), "concluida":false});
        _tarefasController.clear();
      });
    }
  }

 
 void _removerTarefa(int index) {
    if (_tarefas[index]["concluida"] == true) {
      setState(() {
        _tarefas.remove(_tarefas[index]);
      });
    } else {
      Fluttertoast.showToast(
        msg: "Conclua para deletar.",
        textColor: const Color.fromARGB(255, 0, 0, 0),
        fontSize: 16.0
    );
    }
  }
}