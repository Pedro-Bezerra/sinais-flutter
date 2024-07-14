import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_prototipo/paginas/curso.dart';

final regexUpper = RegExp('[A-Z]');
final regexSpecial = RegExp('[!@#\$%^&*(),.?":{}|<>]');
final regexNumber = RegExp(r'\d');

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _obscurePasswordCreation = true;
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.sizeOf(context).width,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Cadastro",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Usuario',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 5, 74, 145))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 5, 74, 145)))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onChanged: (value) {
                  _username = value;
                },
              ),
              const SizedBox(height: 20),
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
              Focus(
                focusNode: _passwordFocusNode,
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePasswordCreation =
                                !_obscurePasswordCreation;
                          });
                        },
                        child: Icon(_obscurePasswordCreation
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      labelText: 'Senha',
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 5, 74, 145))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 5, 74, 145)))),
                  obscureText: _obscurePasswordCreation,
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
                    _password = value;
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
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() {
                        _obscurePasswordConfirmation =
                            !_obscurePasswordConfirmation;
                      }),
                      child: Icon(_obscurePasswordConfirmation
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    labelText: 'Confirme sua senha',
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
                    return 'Confirme sua senha';
                  }
                  if (value != _password) {
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
                  _confirmPassword = value;
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Curso(_username, _email, _password),
                            ));
                        print(
                            'Email: $_email, Password: $_password, Confirm Password: $_confirmPassword');
                      }
                      // _formKey.currentState!.save();
                      //inserirDado( _username, _email, _password);
                    },
                    child: const Text('Sign up'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
