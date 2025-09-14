import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RegisterProvider(), // your ChangeNotifier class
      child: const MyApp(),
    ),
  );
}

Widget ChangeNotifierProvider({required RegisterProvider Function(dynamic _) create, required MyApp child}) {
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

class RegisterProvider extends ChangeNotifier {
  String email = "";
  String password = "";

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<RegisterProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                TextField(
                  onChanged: provider.setEmail,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  onChanged: provider.setPassword,
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                Text("Email: ${provider.email}"),
                Text("Password: ${provider.password}"),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget? Consumer({required Column Function(dynamic context, dynamic provider, dynamic child) builder}) {}
}
