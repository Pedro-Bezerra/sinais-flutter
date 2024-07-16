import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DB {
  static final supabase = Supabase.instance.client;

  static Future<void> realizarConexao() async {
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
  }

  static void inserirDadosCadastro(String usuario, String email, String senha,
      String curso, int idade, String fluencia, String escolaridade) async {
    await supabase.from('cadastro').insert({
      'usuario': usuario,
      'email': email,
      'senha': senha,
      'curso': curso,
      'idade': idade,
      'fluencia': fluencia,
      'escolaridade': escolaridade
    });
  }

  static void inserirDadosHistorico(String usuario, String email, int acertos, int erros) async {
    await supabase.from('historico').insert({
      'usuario': usuario,
      'email': email,
      'acertos': acertos,
      'erros': erros,
    });
  }

  static Future<List<dynamic>?> getUserByEmail(String email) async {
    try {
      final response = await supabase
          .from('cadastro')
          .select()
          .eq('email', email)
          .limit(1)
          .single();

      return response.values.toList();
    } catch (e) {
      print("Erro na obtenção dos dados");
      return [];
    }
  }

  static Future<List<dynamic>?> getHistoricoByEmail(String email) async {
    try {
      final response = await supabase
          .from('historico')
          .select()
          .eq('email', email)
          .limit(1)
          .single();

      return response.values.toList();
    } catch (e) {
      print("Erro na obtenção dos dados");
      return [];
    }
  }

  static bool haCadastro(String email) {
    getUserByEmail(email).then((value) {
      if (listEquals(value!, [])) {
        return false;
      }
    });
    return true;
  }

  static Future<bool> removerCadastro(String email) async {
    try {
      final response =
          await supabase.from('cadastro').delete().eq('email', email);

      return true;
    } catch (e) {
      print("Erro no processamento dos dados");
      return false;
    }
  }

  static Future<List<dynamic>?> atualizarUsuario(
      String usuario, String email) async {
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

  static void redefinirSenha(String novaSenha, String email) async {
    try {
      await supabase
          .from('cadastro')
          .update({'senha': novaSenha}).eq('email', email);
    } catch (e) {
      print('Erro na obtenção dos dados');
    }
  }
}
