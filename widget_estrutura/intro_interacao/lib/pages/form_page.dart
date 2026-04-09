//página de formulário
//tela com elementos de formulário para interação do usuário
//textField
//checkBox
//radio button
//slider // barra de seleção
//switch=> botão de alternância
//dropdown => menu suspenso

//form => ajuda na validação de dados

import 'package:flutter/material.dart';

//chama as mudança de estado
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

//lógica de construção da tela
class _FormPageState extends State<FormPage> {
  //atributos
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _confirmarSenha = "";
  bool _aceitarTermos = false;
  String _sexo = "Feminino"; //radio (femino)
  double _idade = 18; // slider -> posição 18
  List<String> _interesses = [];
  String _cidade = "Americana";

  //esconder senha
  bool _obscureSenha = true;

  final formKey =
      GlobalKey<
        FormState
      >(); // formulário somente será enviado se a chave estiver validada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário de Cadastro")),
      body: Padding(
        padding: EdgeInsets.all(8),
        // adicionar elemento e fazer a verificação
        child: Form(
          key: formKey, //chave de validação para o form
          child: SingleChildScrollView(
            child: Column(
              children: [
                //campo texto para nome
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite seu Nome...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() {
                    _nome = value;
                  }),
                  validator: (value) =>
                      value!.isEmpty ? "Campo Obrigatório" : null,
                ),
                //campo email
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite seu Email...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() {
                    _email = value;
                  }),
                  validator: (value) =>
                      value!.contains("@") ? null : "Email Inválido",
                ),
                //campo senha
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite sua Senha...",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _obscureSenha =
                            !_obscureSenha; // inverter o valor para a booleana
                      }),
                      icon: Icon(
                        _obscureSenha ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    _senha = value;
                  }),
                  validator: (value) => value!.length <= 6
                      ? " Senha deve ser maior que 6 Caracateres"
                      : null,
                  obscureText: _obscureSenha, //esconder senha
                  //icone para mostrar ou esconder a senha
                ),


                //campo confirmar senha
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirme sua senha...",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _obscureSenha =
                            !_obscureSenha; // inverter o valor para a booleana
                      }),
                      icon: Icon(
                        _obscureSenha ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    _confirmarSenha = value;
                  }),
                  validator: (value) => value! != _senha
                      ? "Sua senha deve ser a mesma!"
                      : null,
                  obscureText: _obscureSenha, //esconder senha
                  //icone para mostrar ou esconder a senha
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
