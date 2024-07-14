import 'package:flutter/material.dart';
import 'dart:math';

import 'package:teste_prototipo/paginas/aprender_page.dart';
import 'package:teste_prototipo/paginas/buscar_page..dart';
import 'package:teste_prototipo/paginas/perfil_page.dart';
import 'package:teste_prototipo/paginas/revisar_page.dart';

class InicioPage extends StatefulWidget {
  final String usuario;
  final String email;

  const InicioPage({required this.usuario, required this.email, super.key});

  @override
  State<InicioPage> createState() => _InicioPageState(email, usuario);
}

class _InicioPageState extends State<InicioPage> {
  final String email;
  final String usuario;

  _InicioPageState(this.email, this.usuario);

  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          AprenderPage(),
          BuscarPage(),
          RevisarPage(),
          DicionarioPage(),
          PerfilPage(email: email, usuario: usuario),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.book_online_rounded,
                color: Color.fromARGB(255, 183, 179, 179)),
            label: "Aprender",
            selectedIcon: Icon(Icons.book_online_rounded,
                color: Color.fromARGB(255, 5, 74, 145)),
          ),
          NavigationDestination(
            icon: Icon(Icons.search, color: Color.fromARGB(255, 183, 179, 179)),
            label: "Buscar",
            selectedIcon:
                Icon(Icons.search, color: Color.fromARGB(255, 5, 74, 145)),
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_circle_down,
                color: Color.fromARGB(255, 183, 179, 179)),
            label: "Revisar",
            selectedIcon: Icon(Icons.arrow_circle_down,
                color: Color.fromARGB(255, 5, 74, 145)),
          ),
          NavigationDestination(
            icon: Icon(Icons.book_rounded,
                color: Color.fromARGB(255, 183, 179, 179)),
            label: "Dicionário",
            selectedIcon: Icon(Icons.book_rounded,
                color: Color.fromARGB(255, 5, 74, 145)),
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 183, 179, 179)),
            label: "Perfil",
            selectedIcon:
                Icon(Icons.person, color: Color.fromARGB(255, 5, 74, 145)),
          ),
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}



class DicionarioPage extends StatelessWidget {
  const DicionarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color.fromARGB(255, 133, 199, 242),
            Color.fromARGB(255, 5, 74, 145)
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(pi / 4))),
    ));
  }
}
