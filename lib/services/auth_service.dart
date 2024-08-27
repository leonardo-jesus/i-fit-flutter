import 'dart:convert';

import 'package:ifitapp/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  List<User> _users = [];

  AuthService() {
    _loadUsers();
  }

  // Método para carregar os usuários salvos
  Future<void> _loadUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usersString = prefs.getString('users');
    if (usersString != null) {
      List<dynamic> jsonUsers = jsonDecode(usersString);
      _users = jsonUsers.map((json) => User.fromJson(json)).toList();
    }
  }

  // Método para salvar os usuários
  Future<void> _saveUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString =
        jsonEncode(_users.map((user) => user.toJson()).toList());
    await prefs.setString('users', jsonString);
  }

  // Método para registrar um novo usuário
  Future<String> register(String username, String password) async {
    final existingUser = _users.any((user) => user.username == username);
    if (existingUser) {
      return 'Usuário já cadastrado';
    } else {
      _users.add(User(username: username, password: password));
      await _saveUsers();
      return 'Cadastro realizado com sucesso';
    }
  }

  // Método para login
  String login(String username, String password) {
    final user = _users.firstWhere(
      (user) => user.username == username && user.password == password,
      orElse: () => User(username: '', password: ''),
    );

    if (user.username.isNotEmpty) {
      return 'Login realizado com sucesso';
    } else {
      return 'Nome de usuário ou senha incorretos';
    }
  }
}
