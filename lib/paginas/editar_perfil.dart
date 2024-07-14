import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:teste_prototipo/paginas/inicio.dart';
import 'package:teste_prototipo/main.dart'; // Assuming this is where 'supabase' is defined

Future<List<dynamic>?> atualizarUsuario(String usuario, String email) async {
  try {
    final response = await supabase
        .from('cadastro')
        .update({'usuario': usuario}).eq('email', email);

    return response;
  } catch (e) {
    print("Erro no processamento dos dados");
    return [];
  }
}

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
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 5, 74, 145)),
                  ),
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
                    backgroundColor: const Color.fromARGB(255, 133, 199, 242),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w900),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      atualizarUsuario(_username, email).then((value) {
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
                  child: const Text('Editar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
