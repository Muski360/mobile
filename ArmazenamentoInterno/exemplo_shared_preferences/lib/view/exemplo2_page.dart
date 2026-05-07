import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exemplo2Page extends StatefulWidget {
  const Exemplo2Page({super.key});

  @override
  State<Exemplo2Page> createState() => _Exemplo2PageState();
}

class _Exemplo2PageState extends State<Exemplo2Page> {
  late SharedPreferences _prefs; // Escopo late, permite criar uma variável/obj inicialmente nula e mudar o valor dpeois, pode ser mudada quantas vezes for necessário

  bool _darkMode = false;

  // Métodos de conexão com o SharedPreferences
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Método para buscar dados no Shared
  void _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance(); // Pega as informações salvas no Shared
    setState(() {
      _darkMode = _prefs.getBool("darkMode") ?? false; // Verificação de nulidade obrigatório, ?? se caso a chave darkMode no Shared Preferences seja nula (não tenha valor atribuido ainda) a variável _darkMode será false;
    });
  }

  // Método para salvar dados no Shared
  void _savePreferences() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o valor da booleana
      
    });
    await _prefs.setBool("darkMode", _darkMode); // Atribuindo o valor da variável a _darkMode a chave darkMode do shared
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modo Escuro com Shared Preferences"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tema Atual: ${_darkMode ? "Escuro" : "Claro"}"),
            Switch(value: 
            _darkMode, onChanged: (_) => _savePreferences())
          ],
        ),
      ),
    );
  }
}