import 'package:flutter/material.dart';
import 'register_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  void _onRegister() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String state = _stateController.text.trim();

    if (email.isEmpty || password.isEmpty || state.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Registered with $email from $state")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RegisterUI(
      emailField: TextField(
        controller: _emailController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          labelText: "Email",
          border: OutlineInputBorder(),
        ),
      ),
      passwordField: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: Icon(Icons.visibility_off),
          labelText: "Password",
          border: OutlineInputBorder(),
        ),
      ),
      stateField: TextField(
        controller: _stateController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.location_city),
          labelText: "State",
          border: OutlineInputBorder(),
        ),
      ),
      onRegister: _onRegister,
    );
  }
}
