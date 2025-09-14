import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questify Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // Implement login logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login button pressed for Email: ${_emailController.text}')),
    );
    print('Login button pressed! Email: ${_emailController.text}, Password: ${_passwordController.text}');
  }

  void _handleForgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Forgot password tapped!')),
    );
    print('Forgot password tapped!');
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _handleSkip() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Skip tapped!')),
    );
    print('Skip tapped!');
  }

  @override
  Widget build(BuildContext context) {
    return LoginUI(
      emailField: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email',
          prefixIcon: const Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        keyboardType: TextInputType.emailAddress,
      ),
      passwordField: TextField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _togglePasswordVisibility,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
      onLogin: _handleLogin,
      onForgotPassword: _handleForgotPassword,
      onTogglePassword: _togglePasswordVisibility, // This might not be needed if handled by suffixIcon
      onSkip: _handleSkip,
      obscurePassword: _obscurePassword,
    );
  }
}

class LoginUI extends StatelessWidget {
  final VoidCallback? onLogin;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onTogglePassword;
  final VoidCallback? onSkip;
  final bool obscurePassword;

  // These can be replaced with TextEditingControllers or similar as needed.
  final Widget emailField;
  final Widget passwordField;

  const LoginUI({
    super.key,
    required this.emailField,
    required this.passwordField,
    this.onLogin,
    this.onForgotPassword,
    this.onTogglePassword,
    this.onSkip,
    this.obscurePassword = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f7fa),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 14,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Top bar icons and Skip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onSkip,
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                color: Color(0xFF0386D0),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Logo
                  Image.network(
                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/MJPZiAVfzb/bfl3z99z_expires_30_days.png", // Placeholder URL, replaced from original imgur link
                    height: 76,
                  ),
                  const SizedBox(height: 22),
                  // Login header
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  const SizedBox(height: 22),
                  // Email field widget
                  emailField,
                  const SizedBox(height: 24),
                  // Password field widget
                  passwordField,
                  const SizedBox(height: 10),
                  // Forget password link
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: onForgotPassword,
                      child: const Text(
                        "Forget password",
                        style: TextStyle(
                          color: Color(0xFF0386D0),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Login button
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 3,
                      ),
                      onPressed: onLogin,
                      child: const Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Bottom graphics (curve)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}