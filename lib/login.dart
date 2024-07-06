import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teste_prototipo/inicio.dart';
import 'package:teste_prototipo/licao_flashcard.dart';
import 'package:teste_prototipo/main.dart';
import 'package:teste_prototipo/nova_senha.dart';
import 'package:teste_prototipo/video_player.dart';

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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _obscurePassword = true;

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
            children: <Widget>[
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
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
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
                      onTap: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      child: Icon(_obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 5, 74, 145))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 5, 74, 145)))),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  _password = value;
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaNovaSenha()),
                  );
                },
                child: Text('Esqueceu sua senha?'),
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        getUserByEmail(_email).then((value) {
                          if (listEquals(value!, [])) {
                            print("Não há nenhum cadastro com esse e-mail");
                            return;
                          }
                          if (_password == value![4]) {
                            print("login com sucesso");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LicaoFlashcard(),
                                ));
                          } else {
                            print(value);
                            print("login sem sucesso");
                          }
                        });
                      }
                    },
                    child: const Text('Log in'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
