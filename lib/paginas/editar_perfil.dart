import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:teste_prototipo/db/db.dart';
import 'package:teste_prototipo/paginas/inicio.dart';

final regexSpecial = RegExp('[!@#\$%^&*(),.?":{}|<>]');

class EditarPerfil extends StatefulWidget {
  final String email;

  EditarPerfil({required this.email});

  @override
  _EditarPerfilState createState() => _EditarPerfilState(email);
}

class _EditarPerfilState extends State<EditarPerfil> {
  final String email;

  _EditarPerfilState(this.email);

  final _formKey = GlobalKey<FormState>();
  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Editar perfil",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
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
                      backgroundColor: const Color.fromARGB(255, 133, 199, 242),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w900)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DB.atualizarUsuario(_username, email).then((value) {
                        if (listEquals(value, [])) {
                          print("Erro na atualização dos dados");
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InicioPage(
                              usuario: _username,
                              email: email,
                            ),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text('Editar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
