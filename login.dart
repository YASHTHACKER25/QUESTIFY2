import 'package:flutter/material.dart';
import 'login_ui.dart'; // Import the UI file

class LoginLogic extends StatefulWidget {
  const LoginLogic({super.key});

  @override
  State<LoginLogic> createState() => _LoginLogicState();
}

class _LoginLogicState extends State<LoginLogic> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool _obscurePassword = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Email: ${emailController.text}\nPassword: ${passController.text}',
          ),
        ),
      );
      // Implement login API or navigation here
    }
  }

  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _forgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Forgot password pressed!')),
    );
  }

  void _skip() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Skip pressed!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LoginUI(
        obscurePassword: _obscurePassword,
        onLogin: _login,
        onForgotPassword: _forgotPassword,
        onTogglePassword: _togglePassword,
        onSkip: _skip,
        emailField: TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'Email Address',
            border: UnderlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(val)) {
              return 'Enter a valid email';
            }
            return null;
          },
        ),
        passwordField: TextFormField(
          controller: passController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            hintText: 'Password',
            border: UnderlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: _togglePassword,
            ),
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Please enter your password';
            }
            if (val.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ),
    );
  }
}
