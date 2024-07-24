import 'package:flutter/material.dart';
import 'package:teste_prototipo/db/db.dart';
import 'package:teste_prototipo/paginas/inicio.dart';

class Historico extends StatefulWidget {
  static int pontuacao = -1;
  final String usuario;
  final String email;

  static void mudarPontuacao(int novaPontuacao, StateSetter setState) {
    setState(() {
      pontuacao = novaPontuacao;
    });
  }

  const Historico({required this.usuario, required this.email, super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  late Future<dynamic> _historicoData;

  @override
  void initState() {
    super.initState();
    _historicoData = DB.getHistoricoByEmail(widget.email);
  }

  List<String> _niveis = [
    "Nível 1",
    "Nível 2",
    "Nível 3",
    "Nível 4",
    "Nível 5"
  ];

  String _itemSelecionado = "Nível 1";

  void _dropDownItemSelected(String novoItem) {
    if (novoItem == "Nível 1") {
      setState(() {
        _itemSelecionado = novoItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    InicioPage(usuario: widget.usuario, email: widget.email),
              ),
            );
          },
        ),
        title: Text(
          'Voltar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: _historicoData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro no carregamento dos dados"));
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Center(child: Text("Não há nenhum dado disponível. Responda ao mínimo uma lição!"));
          } else {
            var data = snapshot.data;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        iconEnabledColor: Colors.black,
                        iconSize: 40,
                        focusColor: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        value: _itemSelecionado,
                        items: _niveis.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Center(
                              child: Text(
                                dropDownStringItem,
                                style: TextStyle(
                                  color: dropDownStringItem == "Nível 1"
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? novoItem) {
                          if (novoItem != null) {
                            _dropDownItemSelected(novoItem);
                          }
                        },
                        selectedItemBuilder: (BuildContext context) {
                          return _niveis.map<Widget>((String item) {
                            return Center(
                              child: Text(
                                _itemSelecionado,
                                style: TextStyle(
                                  color: _itemSelecionado == "Nível 1"
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Histórico",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ContainerHistorico(conteudo: "Vocabulário", pontuacao: data[4]),
                  SizedBox(height: 20),
                  ContainerHistorico(conteudo: "Gramática"),
                  SizedBox(height: 20),
                  ContainerHistorico(conteudo: "Escrita")
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ContainerHistorico extends StatelessWidget {
  final String conteudo;
  final int pontuacao;

  const ContainerHistorico({
    required this.conteudo,
    this.pontuacao = -1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.18,
      width: MediaQuery.sizeOf(context).width * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFF054A91),
        ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            conteudo,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (pontuacao >= 0)
                Text(
                  "$pontuacao",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )
              else
                Icon(
                  Icons.circle_rounded,
                  color: Color(0xFF054A91),
                ),
              Icon(
                Icons.circle_rounded,
                color: Color(0xFF054A91),
              ),
              Icon(
                Icons.circle_rounded,
                color: Color(0xFF054A91),
              ),
              Icon(
                Icons.circle_rounded,
                color: Color(0xFF054A91),
              ),
              Icon(
                Icons.circle_rounded,
                color: Color(0xFF054A91),
              )
            ],
          )
        ],
      ),
    );
  }
}
