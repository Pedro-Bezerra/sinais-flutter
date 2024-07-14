import 'package:flutter/material.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/paginas/idade.dart';
import 'package:teste_prototipo/widgets/titulo.dart';

class Curso extends StatefulWidget {
  final String usuario;
  final String email;
  final String senha;

  Curso(this.usuario, this.email, this.senha);

  @override
  _CursoState createState() => _CursoState(usuario, email, senha);
}

class _CursoState extends State<Curso> {
  String usuario;
  String email;
  String senha;

  _CursoState(this.usuario, this.email, this.senha);

  List<String> cursos = ["LIBRAS L1", "LIBRAS L2", "PORTUGUÊS L2"];
  int _selectedValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedValue = value!;
    });
  }

  Widget _buildCustomRadioTile(int value, String title, {String subhead = ''}) {
    return GestureDetector(
      onTap: () => _handleRadioValueChange(value),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: _selectedValue == value
                  ? Color.fromARGB(255, 5, 74, 145)
                  : Color.fromARGB(0, 0, 0, 0)),
          color: _selectedValue == value
              ? Color.fromARGB(255, 133, 199, 242)
              : Color.fromARGB(125, 133, 199, 242),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              Text(
                subhead,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 79, 79, 79)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Titulo("Qual curso você fará?"),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCustomRadioTile(0, 'LIBRAS L1',
                subhead: 'Alfabetização em LIBRAS'),
            _buildCustomRadioTile(1, 'LIBRAS L2',
                subhead: 'LIBRAS como segunda língua'),
            _buildCustomRadioTile(2, 'PORTUGUÊS L2',
                subhead: 'Português como segunda língua')
          ],
        ),
        BotaoNext(
            usuario: usuario,
            email: email,
            senha: senha,
            curso: cursos[_selectedValue],
            proximaPagina: Idade(usuario, email, senha, cursos[_selectedValue]),)
      ],
    ));
  }
}
