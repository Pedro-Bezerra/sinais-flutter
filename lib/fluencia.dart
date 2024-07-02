import 'package:flutter/material.dart';
import 'package:teste_prototipo/escolaridade.dart';

class Fluencia extends StatefulWidget {
  final String usuario;
  final String email;
  final String senha;
  final String curso;
  final int idade;

  Fluencia(this.usuario, this.email, this.senha, this.curso, this.idade);

  @override
  _FluenciaState createState() =>
      _FluenciaState(usuario, email, senha, curso, idade);
}

class _FluenciaState extends State<Fluencia> {
  String usuario;
  String email;
  String senha;
  String curso;
  int idade;

  _FluenciaState(this.usuario, this.email, this.senha, this.curso, this.idade);

  List<String> fluencias = ["APRENDIZ", "PRINCIPIANTE", "AVANÇADO"];
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
        Titulo(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCustomRadioTile(0, 'APRENDIZ', subhead: 'Começando do zero'),
            _buildCustomRadioTile(1, 'PRINCIPIANTE',
                subhead: 'Melhorar e progredir'),
            _buildCustomRadioTile(2, 'AVANÇADO',
                subhead: 'Não quero perder fluência')
          ],
        ),
        BotaoNext(
            usuario, email, senha, curso, idade, fluencias[_selectedValue])
      ],
    ));
  }
}

class Titulo extends StatelessWidget {
  const Titulo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("Qual curso você fará?",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black));
  }
}

class BotaoNext extends StatelessWidget {
  final String usuario;
  final String email;
  final String senha;
  final String curso;
  final int idade;
  final String fluencia;

  const BotaoNext(
    this.usuario,
    this.email,
    this.senha,
    this.curso,
    this.idade,
    this.fluencia, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 5, 74, 145),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Escolaridade(
                      usuario, email, senha, curso, idade, fluencia)));
        },
        child: const Text("NEXT",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
    );
  }
}
