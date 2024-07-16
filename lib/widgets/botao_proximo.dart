import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoNext extends StatelessWidget {
  final String? usuario;
  final String? email;
  final String? senha;
  final String? curso;
  final int? idade;
  final String? fluencia;
  final String? escolaridade;
  final Widget? proximaPagina;
  final VoidCallback? funcao;
  final bool estaHabilitado;

  const BotaoNext({
    this.usuario,
    this.email,
    this.senha,
    this.curso,
    this.idade,
    this.fluencia,
    this.escolaridade,
    this.proximaPagina,
    this.funcao,
    this.estaHabilitado = true,
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
            elevation: 10,
            shadowColor: Color.fromARGB(255, 133, 199, 242),
            minimumSize: Size(double.infinity, 50),
            backgroundColor: estaHabilitado ? Color(0xFF054A91) : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        onPressed: () {
          if (funcao != null) {
            funcao!();
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
