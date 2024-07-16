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
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 47, 47, 47))),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Usuário',
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
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 5, 74, 145)),
                  hintText: 'Insira seu usuário',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o seu usuário';
                  }
                  return null;
                },
                onChanged: (value) {
                  _username = value;
                },
              ),
              const SizedBox(height: 20),
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
              Focus(
                focusNode: _passwordFocusNode,
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscurePasswordCreation = !_obscurePasswordCreation;
                        });
                      },
                      child: Icon(
                        _obscurePasswordCreation
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color.fromARGB(255, 5, 74, 145),
                      ),
                    ),
                    labelText: 'Senha',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 5, 74, 145)),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Circular border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
                      borderRadius:
                          BorderRadius.circular(8.0), // Circular border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
                      borderRadius:
                          BorderRadius.circular(8.0), // Circular border
                    ),
                    prefixIcon: Icon(Icons.lock,
                        color: Color.fromARGB(255, 5, 74, 145)),
                    hintText: 'Insira sua senha',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color.fromARGB(255, 240, 240, 240),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
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
                    child: Icon(
                      _obscurePasswordConfirmation
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color.fromARGB(255, 5, 74, 145),
                    ),
                  ),
                  labelText: 'Confirme sua senha',
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
                      Icon(Icons.lock, color: Color.fromARGB(255, 5, 74, 145)),
                  hintText: 'Insira sua senha',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
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
                        elevation: 10, // The elevation/shadow of the button
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
                    child: const Text(
                      'Cadastrar',
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
