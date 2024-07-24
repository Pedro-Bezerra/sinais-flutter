import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/paginas/resultado_page.dart';
import 'package:teste_prototipo/widgets/botao_de_progresso.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';
import 'package:teste_prototipo/widgets/progresso.dart';

class LicaoPTL25 extends StatefulWidget {
  final int pontuacao;
  final int qtdPerguntas;

  LicaoPTL25({this.pontuacao=0, required this.qtdPerguntas});

  @override
  _LicaoPTL25State createState() => _LicaoPTL25State(pontuacao, qtdPerguntas);
}

class _LicaoPTL25State extends State<LicaoPTL25> {
  int pontuacao;
  int qtdPerguntas;

  _LicaoPTL25State(this.pontuacao, this.qtdPerguntas);

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              MaterialPageRoute(
                builder: (context) => InicioPage(
                    usuario: "Vitinho", email: "vitor.farias@upe.br"),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFD9D9D9),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              BarraProgresso(totalQuestoes: 5, questoesCompletadas: 4),
              SizedBox(height: 20),
              Text(
                'Escreva o substantivo que corresponde à imagem',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildImageTextField(
                          'assets/images/borracha.jpg',
                          _controller1,
                        ),
                        SizedBox(height: 20),
                        _buildImageTextField(
                          'assets/images/caneta.png',
                          _controller2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildImageTextField(
                          'assets/images/caderno.jpg',
                          _controller3,
                        ),
                        SizedBox(height: 20),
                        _buildImageTextField(
                          'assets/images/regua.jpg',
                          _controller4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              BotaoNext(
                  //estaHabilitado: _canProceed(),
                  proximaPagina: //_canProceed()
                      TelaDeResultado(
                acertos: 0,
                erros: 0,
              )),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageTextField(
      String imagePath, TextEditingController controller) {
    double imageSize = MediaQuery.of(context).size.width * 0.35;

    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFF054A91)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: '',
              border: InputBorder.none,
            ),
            style: TextStyle(color: Color(0xFF054A91)),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-ZáÁâÂãÃàÀéÉêÊíÍóÓôÔõÕúÚüÜçÇ\s]+')),
            ],
            onChanged: (text) {},
          ),
        ),
      ],
    );
  }
}
