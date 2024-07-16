import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'cadastro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSignupPage = false;

  void _togglePage() {
    setState(() {
      _showSignupPage = !_showSignupPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    var telaLoginCadastro = context.watch<TelaLoginCadastro>();

    return Scaffold(
        body: Column(
      children: [
        const Expanded(
          flex: 2,
          child: AppBarHome(),
        ),
        Expanded(
          flex: 5,
          child: telaLoginCadastro.isTelaLogin ? LoginPage() : SignUpPage(),
        ),
      ],
    ));
  }
}

class TelaLoginCadastro extends ChangeNotifier {
  var isTelaLogin = true;

  void mudarTela() {
    isTelaLogin = !isTelaLogin;
    notifyListeners();
  }
}

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle sinaisStyle = TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 5, 74, 145));

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(child: Text("SINAIS", style: sinaisStyle)),
        const ToggleLoginSignup(),
        SizedBox(height: 20),
        const Text(
          "Aperte o botão para ir para tela de login ou de cadastro",
          style:
              TextStyle(fontSize: 10, color: Color.fromARGB(255, 47, 47, 47)),
        ),
      ],
    ));
  }
}

class ToggleLoginSignup extends StatefulWidget {
  const ToggleLoginSignup({super.key});

  @override
  State<ToggleLoginSignup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ToggleLoginSignup> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    var telaLoginCadastro = context.watch<TelaLoginCadastro>();

    final TextStyle textoBotaoStyle =
        TextStyle(fontSize: 14, fontWeight: FontWeight.w900);

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 5, 74, 145),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: ToggleButtons(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedColor: Colors.white,
          color: const Color.fromARGB(255, 133, 199, 242),
          fillColor: const Color.fromARGB(255, 133, 199, 242),
          renderBorder: false,
          isSelected: isSelected,
          onPressed: (int index) {
            bool estadoInicial = isSelected[0];
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < isSelected.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            });
            if (estadoInicial != isSelected[0]) {
              telaLoginCadastro.mudarTela();
            }
          },
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
              child: Text("Log in", style: textoBotaoStyle),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
              child: Text("Cadastro", style: textoBotaoStyle),
            )
          ],
        ));
  }
}
