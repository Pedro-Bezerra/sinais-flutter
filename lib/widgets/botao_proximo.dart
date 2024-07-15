import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/main.dart';

void inserirDado(String usuario, String email, String senha, String curso,
    int idade, String fluencia, String escolaridade) async {
  await supabase.from('cadastro').insert({
    'usuario': usuario,
    'email': email,
    'senha': senha,
    'curso': curso,
    'idade': idade,
    'fluencia': fluencia,
    'escolaridade': escolaridade
  });
}

class BotaoNext extends StatelessWidget {
  final String usuario;
  final String email;
  final String senha;
  final String curso;
  final int idade;
  final String fluencia;
  final String escolaridade;
  final Widget? proximaPagina;

  const BotaoNext({
    this.usuario = "",
    this.email = "",
    this.senha = "",
    this.curso = "",
    this.idade = 0,
    this.fluencia = "",
    this.escolaridade = "",
    this.proximaPagina,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: ElevatedButton(
         style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: Color(0xFF054A91),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
        onPressed: () {
          if (escolaridade != "") {
            inserirDado(
                usuario, email, senha, curso, idade, fluencia, escolaridade);
          }
          if (proximaPagina != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => proximaPagina!,
                ));
          }
        },
        child: const Text("Próximo",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
    );
  }
}
