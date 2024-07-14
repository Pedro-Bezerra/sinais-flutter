import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/paginas/fluencia.dart';
import 'package:teste_prototipo/widgets/titulo.dart';

class Idade extends StatefulWidget {
  final String usuario;
  final String email;
  final String senha;
  final String curso;

  const Idade(this.usuario, this.email, this.senha, this.curso, {super.key});

  @override
  State<Idade> createState() => _IdadeState(usuario, email, senha, curso);
}

class _IdadeState extends State<Idade> {
  String usuario;
  String email;
  String senha;
  String curso;
  _IdadeState(this.usuario, this.email, this.senha, this.curso);

  int idade = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.sizeOf(context).width,
            child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Titulo("Qual é a sua idade?"),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.sizeOf(context).width,
                            child: TextFormField(
                              style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, informe a sua idade';
                                }
                                return null;
                              },
                              onChanged: (value) => {idade = int.parse(value)},
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                      BotaoNext(
                          usuario: usuario,
                          email: email,
                          senha: senha,
                          curso: curso,
                          idade: idade,
                          proximaPagina: Fluencia(usuario, email, senha, curso, idade),)
                    ]))));
  }
}
