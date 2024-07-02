import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Supabase.initialize(
      url: 'https://kkivucsqhstulgguszaz.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtraXZ1Y3NxaHN0dWxnZ3VzemF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk1MjQzNjUsImV4cCI6MjAzNTEwMDM2NX0.3ayxbq4KIvRqvEheF_suJSFLku8LRj7pAewxVK6-lfo',
    );
  } catch (e) {
    print('Error initializing Supabase: $e');
    // Handle initialization error as needed
    return; // Exit main function if initialization fails
  }

  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TelaLoginCadastro(),
        child: MaterialApp(
            title: 'Login',
            theme: ThemeData(
                scaffoldBackgroundColor: Color.fromARGB(255, 237, 228, 222)),
            home: HomePage()));
  }
}
