import 'package:flutter/material.dart';
import 'package:teste_prototipo/db/db.dart';
import 'package:teste_prototipo/paginas/historico_page.dart';
import 'dart:math';

import 'package:teste_prototipo/widgets/cabecalho_drawer.dart';
import 'package:teste_prototipo/paginas/editar_perfil.dart';
import 'package:teste_prototipo/paginas/home.dart';

class PerfilPage extends StatefulWidget {
  final String email;
  final String usuario;

  const PerfilPage({required this.email, required this.usuario, super.key});

  @override
  _PerfilPageState createState() => _PerfilPageState(email, usuario);
}

class _PerfilPageState extends State<PerfilPage> {
  final String email;
  final String usuario;

  _PerfilPageState(this.email, this.usuario);

  var currentPage = DrawerSections.nenhuma;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CabecalhoDrawer(usuario: usuario),
              CorpoDrawer(
                currentPage: currentPage,
                onItemTap: (section) {
                  setState(() {
                    currentPage = section;
                  });
                },
                email: email,
                usuario: usuario,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 237, 228, 222),
        ),
        /*decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 133, 199, 242),
              Color.fromARGB(255, 5, 74, 145)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(pi / 4),
          ),
        ),*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 30,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 133, 199, 242),
                        Color.fromARGB(255, 5, 74, 145)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(pi / 4),
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.20,
                    height: MediaQuery.sizeOf(context).height * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5000),
                      color: Color.fromARGB(255, 217, 217, 217),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color.fromARGB(255, 79, 79, 79),
                    ),
                  ),
                ),
                Positioned(
                  top: 55,
                  child: Text(
                    usuario,
                    style: TextStyle(
                      fontSize: 32,
                      color: Color.fromARGB(255, 47, 47, 47),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Text(
                    "Nível 1",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 47, 47, 47),
                    ),
                  ),
                ),
                Positioned(
                  top: 115,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        "Aprendendo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 47, 47, 47),
                        ),
                      ),
                      Icon(Icons.flag_rounded),
                    ],
                  ),
                ),
                Positioned(
                  top: 115,
                  left: 20,
                  child: Column(
                    children: [
                      Text(
                        "Nativo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 47, 47, 47),
                        ),
                      ),
                      Icon(Icons.flag_rounded),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 133, 199, 242),
                    Color.fromARGB(255, 5, 74, 145)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(pi / 4),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                      alignment: Alignment(-0.77, 0),
                      child: Text(
                        "Recompensas",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.card_giftcard_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Nível 1",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.card_giftcard_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Nível 2",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.card_giftcard_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Nível 3",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.74,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 133, 199, 242),
                          Colors.white
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        transform: GradientRotation(pi / 4),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CorpoDrawer extends StatelessWidget {
  final DrawerSections currentPage;
  final Function(DrawerSections) onItemTap;
  final String email;
  final String usuario;

  CorpoDrawer(
      {required this.currentPage,
      required this.onItemTap,
      required this.email,
      required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemMenu(
          id: 1,
          titulo: "Editar perfil",
          icone: Icons.edit,
          selecionado: currentPage == DrawerSections.editar_perfil,
          onTap: () {
            onItemTap(DrawerSections.editar_perfil);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarPerfil(usuarioAntigo: usuario, email: email),
                ));
          },
        ),
        ItemMenu(
          id: 2,
          titulo: "Ver histórico",
          icone: Icons.history,
          selecionado: currentPage == DrawerSections.historico,
          onTap: () {
            onItemTap(DrawerSections.logout);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Historico(usuario: usuario, email: email),
                ));
          },
        ),
        ItemMenu(
          id: 3,
          titulo: "Sair",
          icone: Icons.logout,
          selecionado: currentPage == DrawerSections.logout,
          onTap: () {
            onItemTap(DrawerSections.logout);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
        ),
        ItemMenu(
          id: 4,
          titulo: "Remover cadastro",
          icone: Icons.delete,
          selecionado: currentPage == DrawerSections.remover_cadastro,
          onTap: () {
            onItemTap(DrawerSections.remover_cadastro);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text(
                    'Você deseja continuar com a remoção?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  titlePadding: EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {
                        DB.removerCadastro(email).then((value) {
                          if (value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          } else {
                            print("Erro na remoção do cadastro");
                          }
                        });
                      },
                      child: Text('Remover',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300)),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancelar',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300)),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class ItemMenu extends StatelessWidget {
  final int id;
  final String titulo;
  final IconData icone;
  final bool selecionado;
  final VoidCallback onTap;

  ItemMenu({
    required this.id,
    required this.titulo,
    required this.icone,
    required this.selecionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selecionado ? Colors.grey.shade300 : Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icone,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  titulo,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  editar_perfil,
  logout,
  remover_cadastro,
  historico,
  nenhuma
}
