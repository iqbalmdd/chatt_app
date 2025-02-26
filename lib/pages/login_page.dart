import 'package:chatt_app/services/auth/auth_service.dart';
import 'package:chatt_app/components/auth_button.dart';
import 'package:chatt_app/components/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signIn(_emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.logo_dev,
              size: 80,
            ),

            // Email
            AuthField(
              hintText: "Enter your Email/No. HP",
              isCensored: false,
              controller: _emailController,
            ),

            // Password
            AuthField(
              hintText: "Enter your Password",
              isCensored: true,
              controller: _passwordController,
            ),

            // Login button
            AuthButton(name: "Login", onTap: () => login(context)),

            // Register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun? "),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Buat akun Sekarang!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 26, 91, 143))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
