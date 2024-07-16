import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_prototipo/db/db.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/titulo.dart';

class Escolaridade extends StatefulWidget {
  final String usuario;
  final String email;
  final String senha;
  final String curso;
  final int idade;
  final String fluencia;

  Escolaridade(this.usuario, this.email, this.senha, this.curso, this.idade,
      this.fluencia);

  @override
  _EscolaridadeState createState() =>
      _EscolaridadeState(usuario, email, senha, curso, idade, fluencia);
}

class _EscolaridadeState extends State<Escolaridade> {
  String usuario;
  String email;
  String senha;
  String curso;
  int idade;
  String fluencia;

  _EscolaridadeState(this.usuario, this.email, this.senha, this.curso,
      this.idade, this.fluencia);

  int _selectedValue = 0;
  List<String> escolaridades = [
    'Educação Infantil',
    'Ensino Fundamental I',
    'Ensino Fundamental II',
    'Ensino Médio',
    'Ensino Técnico',
    'Ensino Superior',
    'Pós-graduação'
  ];

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Titulo("Qual é a sua escolaridade?"),
          RadioListTile(
            value: 0,
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChange,
            title: Text('Educação Infantil'),
          ),
          RadioListTile(
            value: 1,
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChange,
            title: Text('Ensino Fundamental I'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChange,
            title: Text('Ensino Fundamental II'),
          ),
          RadioListTile(
            value: 3,
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChange,
            title: Text('Ensino Médio'),
          ),
          RadioListTile(
            value: 4,
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChange,
            title: Text('Ensino Técnico'),
          ),
          RadioListTile(
            value: 5,
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChange,
            title: Text('Ensino Superior'),
          ),
          RadioListTile(
            value: 6,
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChange,
            title: Text('Pós-graduação'),
          ),
          BotaoNext(
            usuario: usuario,
            email: email,
            senha: senha,
            curso: curso,
            idade: idade,
            fluencia: fluencia,
            escolaridade: escolaridades[_selectedValue],
            proximaPagina: InicioPage(
              usuario: usuario,
              email: email,
            ),
            funcao: () => DB.inserirDadosCadastro(usuario, email, senha, curso, idade,
                fluencia, escolaridades[_selectedValue]),
          )
        ],
      ),
    ));
  }
}
