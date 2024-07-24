import 'package:flutter/material.dart';
import 'package:teste_prototipo/db/db.dart';
import 'home.dart';

final regexUpper = RegExp('[A-Z]');
final regexSpecial = RegExp('[!@#\$%^&*(),.?":{}|<>]');
final regexNumber = RegExp(r'\d');

class TelaNovaSenha extends StatefulWidget {
  const TelaNovaSenha({super.key});

  @override
  State<TelaNovaSenha> createState() => _TelaNovaSenhaState();
}

class _TelaNovaSenhaState extends State<TelaNovaSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormsNovaSenha(),
    );
  }
}

class AppBarNovaSenha extends StatelessWidget {
  const AppBarNovaSenha({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle sinaisStyle = TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 5, 74, 145));

    return Column(
      children: [
        Center(child: Text("SINAIS", style: sinaisStyle)),
        const Text(
          "Redefinição de senha",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ],
    );
  }
}

class FormsNovaSenha extends StatefulWidget {
  const FormsNovaSenha({super.key});

  @override
  State<FormsNovaSenha> createState() => _FormsNovaSenhaState();
}

class _FormsNovaSenhaState extends State<FormsNovaSenha> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _novaSenha = '';
  String _senhaConfirmada = '';
  bool _obscureNewPassword = true;
  bool _obscurePasswordConfirmation = true;
  bool _isPasswordFocused = false;
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
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
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          title: Text(
            'Voltar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.sizeOf(context).width,
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBarNovaSenha(),
                  SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    decoration: construirDecoracaoTextField(
                        label: "Email",
                        hint: "Insire seu email",
                        iconePrevio: Icons.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe seu email';
                      }
                      if (!DB.haCadastro(value)) {
                        return "Não há nenhum cadastro com esse email";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  Focus(
                    focusNode: _passwordFocusNode,
                    child: TextFormField(
                      decoration: construirDecoracaoTextField(
                          label: "Senha",
                          hint: "Insire sua senha",
                          iconePrevio: Icons.lock,
                          iconePosterior: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureNewPassword = !_obscureNewPassword;
                              });
                            },
                            child: Icon(
                              _obscureNewPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color.fromARGB(255, 5, 74, 145),
                            ),
                          )),
                      obscureText: _obscureNewPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe uma senha';
                        }
                        if (value.length < 8) {
                          return 'A senha deve ter no mínimo 8 caracteres';
                        }
                        if (!regexUpper.hasMatch(value)) {
                          return 'A senha deve conter uma letra maiúscula';
                        }
                        if (!regexSpecial.hasMatch(value)) {
                          return 'A senha deve conter um caracter especial';
                        }
                        if (!regexNumber.hasMatch(value)) {
                          return "A senha deve conter um número";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _novaSenha = value;
                      },
                    ),
                  ),
                  if (_isPasswordFocused)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('A senha deve ter no mínimo 8 caracteres'),
                          Text('A senha deve conter uma letra maiúscula'),
                          Text('A senha deve conter um número'),
                          Text('A senha deve conter um caracter especial'),
                        ],
                      ),
                    ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: construirDecoracaoTextField(
                        label: "Confime sua senha",
                        hint: "Insira sua senha",
                        iconePrevio: Icons.lock,
                        iconePosterior: GestureDetector(
                          onTap: () => setState(() {
                            _obscurePasswordConfirmation =
                                !_obscurePasswordConfirmation;
                          }),
                          child: Icon(
                            _obscurePasswordConfirmation
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color.fromARGB(255, 5, 74, 145),
                          ),
                        )),
                    obscureText: _obscurePasswordConfirmation,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirme sua senha';
                      }
                      if (value != _senhaConfirmada) {
                        return 'As senhas são diferentes';
                      }
                      if (value.length < 8) {
                        return 'A senha deve ter no mínimo 8 caracteres';
                      }
                      if (!regexUpper.hasMatch(value)) {
                        return 'A senha deve ter uma letra maiúscula';
                      }
                      if (!regexSpecial.hasMatch(value)) {
                        return 'A senha deve ter um caracter especial';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _senhaConfirmada = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shadowColor: Color.fromARGB(255, 133, 199, 242),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 133, 199, 242),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w900)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            DB.redefinirSenha(_novaSenha, _email);
                            print(
                                'New password: $_novaSenha, Confirmed password: $_senhaConfirmada');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
                        },
                        child: const Text('Redefinir senha',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5)),
                      )),
                ],
              )),
        ));
  }
}

InputDecoration construirDecoracaoTextField(
    {required String label,
    required String hint,
    required IconData iconePrevio,
    Widget? iconePosterior}) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: Color.fromARGB(255, 5, 74, 145)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
      borderRadius: BorderRadius.circular(8.0),
    ),
    prefixIcon: Icon(iconePrevio, color: Color.fromARGB(255, 5, 74, 145)),
    suffixIcon: iconePosterior != null ? iconePosterior : null,
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey),
    filled: true,
    fillColor: Color.fromARGB(255, 240, 240, 240),
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  );
}
