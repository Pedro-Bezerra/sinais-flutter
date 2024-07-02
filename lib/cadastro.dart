import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_prototipo/curso.dart';

final regexUpper = RegExp('[A-Z]');
final regexSpecial = RegExp('[!@#\$%^&*(),.?":{}|<>]');

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
                    labelText: 'Username',
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
              Focus(
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
                      labelText: 'Password',
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
                      return 'Please enter your password';
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
                    _password = value;
                  },
                ),
                onFocusChange: (hasFocus) {},
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
                    labelText: 'Confirm Password',
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
                  if (value != _password) {
                    return 'Passwords do not match';
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
