import 'package:flutter/material.dart';

class RegisterUI extends StatelessWidget {
  final Widget emailField;
  final Widget passwordField;
  final Widget stateField;
  final VoidCallback? onRegister;

  const RegisterUI({
    super.key,
    required this.emailField,
    required this.passwordField,
    required this.stateField,
    this.onRegister,
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 14,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.arrow_back_ios_new, color: Colors.blue),
                      Icon(Icons.arrow_forward_ios, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/MJPZiAVfzb/bfl3z99z_expires_30_days.png",
                    height: 76,
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  const SizedBox(height: 22),
                  emailField,
                  const SizedBox(height: 16),
                  passwordField,
                  const SizedBox(height: 16),
                  stateField,
                  const SizedBox(height: 32),
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
                      onPressed: onRegister,
                      child: const Text('Register', style: TextStyle(fontSize: 18)),
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

// --------- MAIN for standalone testing ---------
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterUI(
        emailField: const TextField(decoration: InputDecoration(labelText: "Email")),
        passwordField: const TextField(decoration: InputDecoration(labelText: "Password")),
        stateField: const TextField(decoration: InputDecoration(labelText: "State")),
        onRegister: null, // no logic here
      ),
    ),
  );
}
