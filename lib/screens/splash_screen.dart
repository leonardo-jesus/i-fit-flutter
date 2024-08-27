import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the login screen when the screen is touched
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(39, 174, 96, 1.000),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png', // Add your logo image here
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'I-Fit',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(24, 131, 69, 1.000),
                ),
              ),
              const SizedBox(
                  height:
                      200), // Space to push "Touch to continue" to the bottom
              const Text(
                'Touch to continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(24, 131, 69, 1.000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
