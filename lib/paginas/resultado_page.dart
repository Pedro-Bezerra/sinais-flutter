import 'package:flutter/material.dart';
import 'package:teste_prototipo/db/db.dart';
import 'package:teste_prototipo/paginas/historico_page.dart';
import 'package:teste_prototipo/paginas/inicio.dart';

class TelaDeResultado extends StatelessWidget {
  final int acertos;
  final int erros;

  TelaDeResultado({required this.acertos, required this.erros});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF85C7F2), Color(0xFF054A91)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bom trabalho!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Respostas corretas: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        '$acertos',
                        style: TextStyle(
                            color: Color(0xFF72FF80),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Espaçamento entre as seções
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Respostas erradas: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        '$erros',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shadowColor: Color.fromARGB(255, 133, 199, 242),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color.fromARGB(255, 133, 199, 242),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w900),
                ),
                onPressed: () {
                  //Historico.mudarPontuacao(acertos);
                  DB.inserirDadosHistorico(
                      "Vitinho", "vitor.farias@upe.br", acertos, erros);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InicioPage(
                          usuario: "Vitinho", email: "vitor.farias@upe.br"),
                    ),
                  );
                },
                child: Text(
                  'VOLTAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
