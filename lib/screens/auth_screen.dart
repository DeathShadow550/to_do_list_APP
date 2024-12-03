import 'package:flutter/material.dart';
import '../firebase/firebase_auth_service.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = FirebaseAuthService();

  void _authenticate(bool isSignUp) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final user = isSignUp
        ? await _authService.signUp(email, password)
        : await _authService.signIn(email, password);

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print('Authentication failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authenticate')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _authenticate(false),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => _authenticate(true),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
