// tela inicial
// vai ter botões de navegação para outras telas


import 'package:flutter/material.dart';
import 'package:intro_interacao/widgets/bnb.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu aplicativo interativo"),),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://thumbs.dreamstime.com/b/logotipo-cl%C3%A1ssico-do-batman-isolado-em-fundo-branco-dia-bolonha-it%C3%A1lia-de-setembro-404052715.jpg",
              width: 150,
              height: 150,),
              //bloco de espaçamento
              SizedBox(height: 20,),
              //botoes de navegação
              ElevatedButton(onPressed: () => Navigator.pushNamed(context, "/form"), 
              child: Text("Responder formulário")),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: () => Navigator.pushNamed(context, "/contato"), 
              child: Text("Entre em Contato")),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bnb(context),
    );
  }
}