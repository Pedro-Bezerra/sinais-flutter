import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/paginas/resultado_page.dart';
import 'package:teste_prototipo/widgets/botao_proximo.dart';
import 'package:teste_prototipo/widgets/widget_progresso.dart';
import 'package:teste_prototipo/widgets/progresso.dart';

class LicaoPTL25 extends StatefulWidget {
  @override
  _LicaoPTL25State createState() => _LicaoPTL25State();
}

class _LicaoPTL25State extends State<LicaoPTL25> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              WidgetProgresso(
                  count: 5), // Widget de progresso com 4 bolas azuis
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
                estaHabilitado: _canProceed(),
                proximaPagina: _canProceed()
                    ? TelaDeResultado(
                        acertos: 0,
                        erros: 0,
                      )
                    : null,
              ),
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
            color: Colors.white, // Fundo branco
            border:
                Border.all(color: Color(0xFF054A91)), // Cor da borda e traço
            borderRadius: BorderRadius.circular(8.0), // Borda arredondada
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: '',
              border: InputBorder.none, // Remove a borda padrão do TextField
            ),
            style: TextStyle(
                color: Color(0xFF054A91)), // Cor do texto da caixa de texto
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-ZáÁâÂãÃàÀéÉêÊíÍóÓôÔõÕúÚüÜçÇ\s]+')),
            ],
            onChanged: (text) {
              Provider.of<ProgressManager>(context, listen: false).nextStep();
            },
          ),
        ),
      ],
    );
  }

  bool _canProceed() {
    return Provider.of<ProgressManager>(context).currentStep >= 4;
  }
}
