import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp()
  ));
}


//importando as caracteristicas da página Statefull
class MyApp extends StatefulWidget {
  const MyApp({super.key});


  // método para identificar as mudanças de estado e chamar a reconstrução de janela.
  @override // reescrita de um método existente.
  State<MyApp> createState() => _MyAppState();
  // arrow function
}


//class para construção da lógica e da estrutura da janela.
class _MyAppState extends State<MyApp> {
  // classe normal da aplicação
  //atributos
  int contador = 6767676767676767;

  //método build da tela (obrigatório)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Aplicativo com Statefull - Contador")),
      //body
      //container com espaçamento interno
      body: Padding(
        padding: EdgeInsets.all(8), //espaçamento de todas as bordas de 8
        //container para centralizar os elementos no meio da tela (Esquerda e direita)
        child: Center(
          //Column, permite adicionar mais de 1 elemento
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nº de Click: $contador", style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: (){
                  //adicionar setState (Mudança de estado)
                  setState(() {
                    contador++;
                  });
                },
                child: Text("Clique aqui!"),
                ),
            ]
          ),
        )
      ),
    );
  }
}