import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'licaoptl2.dart';
import 'licaoptl22.dart';
import 'licaoptl23.dart';
import 'licaoptl24.dart';
import 'licaoptl25.dart';
import 'teladeresultado.dart';
import 'progresso.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProgressManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SINAIS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/licaoPTL2': (context) => LicaoPTL2(),
        '/licaoPTL22': (context) => LicaoPTL22(),
        '/licaoPTL23': (context) => LicaoPTL23(),
        '/licaoPTL24': (context) => LicaoPTL24(),
        '/licaoPTL25': (context) => LicaoPTL25(),
        '/telaDeResultado': (context) => TelaDeResultado(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<ProgressManager>(context, listen: false).reset();
            Navigator.pushNamed(context, '/licaoPTL2');
          },
          child: Text('Lições Português L2'),
        ),
      ),
    );
  }
}
