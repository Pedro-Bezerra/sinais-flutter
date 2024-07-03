import 'package:flutter/material.dart';
import 'licaoptl2.dart';
import 'licaoptl22.dart';
import 'licaoptl23.dart';

void main() {
  runApp(MyApp());
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
            Navigator.pushNamed(context, '/licaoPTL2'); 
          },
          child: Text('Lições Português L2'),
        ),
      ),
    );
  }
}
