import 'package:flutter/material.dart';
import 'package:ifitapp/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final AuthService authService;

  LoginScreen({required this.authService});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = '';

  void _login() {
    final result = widget.authService.login(
      _usernameController.text,
      _passwordController.text,
    );

    setState(() {
      _message = result;
    });

    if (result == 'Login realizado com sucesso') {
      // Navegar para a tela Home
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Definindo a cor de fundo da tela
      appBar: AppBar(
        backgroundColor: Colors.white, // Cor de fundo do título (AppBar)
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Centraliza os widgets verticalmente
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Nome de usuário'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Entrar'),
              ),
              SizedBox(height: 20),
              Text(
                _message,
                style: TextStyle(
                    color: Colors.red), // Mensagem de erro em vermelho
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Não tem uma conta? Cadastre-se aqui'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
