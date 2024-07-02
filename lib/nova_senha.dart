import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_prototipo/main.dart';
import 'home.dart';

final regexUpper = RegExp('[A-Z]');
final regexSpecial = RegExp('[!@#\$%^&*(),.?":{}|<>]');

Future<List<dynamic>?> getUserByEmail(String email) async {
  try {
    final response = await supabase
        .from('cadastro')
        .select()
        .eq('email', email)
        .limit(1)
        .single();

    return response.values.toList();
  } catch (e) {
    print("Erro na obtenção dos dados");
    return [];
  }
}

bool haCadastro(String email) {
  getUserByEmail(email).then((value) {
    if (listEquals(value!, [])) {
      return false;
    }
  });
  return true;
}

void redefinirSenha(String novaSenha, String email) async {
  try {
    await supabase
        .from('cadastro')
        .update({'senha': novaSenha}).eq('email', email);
  } catch (e) {
    print('Erro na obtenção dos dados');
  }
}

class TelaNovaSenha extends StatefulWidget {
  const TelaNovaSenha({super.key});

  @override
  State<TelaNovaSenha> createState() => _TelaNovaSenhaState();
}

class _TelaNovaSenhaState extends State<TelaNovaSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Expanded(
          flex: 1,
          child: AppBarNovaSenha(),
        ),
        Expanded(
          flex: 4,
          child: FormsNovaSenha(),
        ),
      ],
    ));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.sizeOf(context).width,
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 5, 74, 145))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 5, 74, 145)))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!haCadastro(value)) {
                    return "Não há nenhum cadastro com esse email";
                  }
                  return null;
                },
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() {
                        _obscureNewPassword = !_obscureNewPassword;
                      }),
                      child: Icon(_obscureNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    labelText: 'Nova senha',
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 5, 74, 145))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 5, 74, 145)))),
                obscureText: _obscureNewPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  if (value.length < 8) {
                    return 'Your password must have at least 8 characters';
                  }
                  if (!regexUpper.hasMatch(value)) {
                    return 'Your password must have an uppercase letter';
                  }
                  if (!regexSpecial.hasMatch(value)) {
                    return 'Your password must have a special character';
                  }
                  return null;
                },
                onChanged: (value) {
                  _novaSenha = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                              _obscurePasswordConfirmation =
                                  !_obscurePasswordConfirmation;
                            }),
                        child: Icon(_obscurePasswordConfirmation
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    labelText: 'Confirmar senha',
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 5, 74, 145))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 5, 74, 145)))),
                obscureText: _obscurePasswordConfirmation,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (_novaSenha != _senhaConfirmada) {
                    return "As senhas não são iguais";
                  }
                  return null;
                },
                onChanged: (value) {
                  _senhaConfirmada = value!;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 133, 199, 242),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w900)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        redefinirSenha(_novaSenha, _email);
                        print(
                            'New password: $_novaSenha, Confirmed password: $_senhaConfirmada');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                    child: const Text('Redefinir senha'),
                  )),
            ],
          )),
    ));
  }
}
