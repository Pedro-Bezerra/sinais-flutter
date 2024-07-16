import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teste_prototipo/db/db.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/paginas/nova_senha.dart';

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
              Text("Log in",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 47, 47, 47))),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 5, 74, 145)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Circular border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
                    borderRadius: BorderRadius.circular(8.0), // Circular border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
                    borderRadius: BorderRadius.circular(8.0), // Circular border
                  ),
                  prefixIcon:
                      Icon(Icons.email, color: Color.fromARGB(255, 5, 74, 145)),
                  hintText: 'Insira seu email',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um email';
                  }
                  if (!value.contains('@')) {
                    return 'Informe um email válido';
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
                    child: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color.fromARGB(255, 5, 74, 145),
                    ),
                  ),
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 5, 74, 145)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Circular border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
                    borderRadius: BorderRadius.circular(8.0), // Circular border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 42, 54, 66)),
                    borderRadius: BorderRadius.circular(8.0), // Circular border
                  ),
                  prefixIcon:
                      Icon(Icons.lock, color: Color.fromARGB(255, 5, 74, 145)),
                  hintText: 'Insira sua senha',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a sua senha';
                  }
                  return null;
                },
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TelaNovaSenha()),
                      );
                    },
                    child: Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 5, 74, 145),
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 5, 74, 145),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        DB.getUserByEmail(_email).then((value) {
                          print(value!);
                          if (listEquals(value!, [])) {
                            print("Não há nenhum cadastro com esse e-mail");
                            return;
                          }
                          if (_password == value![4]) {
                            print("login com sucesso");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InicioPage(
                                    usuario: value![2],
                                    email: _email,
                                  ),
                                ));
                          } else {
                            print(value);
                            print("login sem sucesso");
                          }
                        });
                      }
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.5),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
