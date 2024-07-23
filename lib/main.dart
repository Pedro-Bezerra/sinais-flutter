import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_prototipo/db/db.dart';
import 'package:teste_prototipo/paginas/historico_page.dart';
import 'package:teste_prototipo/widgets/progresso.dart';

import 'paginas/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.realizarConexao();

  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TelaLoginCadastro()),
        //ChangeNotifierProvider(create: (context) => ProgressManager(),), 
      ],
        child: MaterialApp(
            title: 'Login',
            theme: ThemeData(
                fontFamily: 'Inter',
                scaffoldBackgroundColor: Color.fromARGB(255, 237, 228, 222),
                navigationBarTheme: NavigationBarThemeData(
                  indicatorColor: Colors.transparent,
                  labelTextStyle: WidgetStateProperty.all(TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 183, 179, 179))),
                )),
            home: HomePage()));
  }
}
