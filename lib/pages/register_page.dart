import 'package:chatt_app/services/auth/auth_service.dart';
import 'package:chatt_app/components/auth_button.dart';
import 'package:chatt_app/components/text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap});

  void register (BuildContext context) {
    final authService = AuthService();

    if (_passwordController.text == _passwordConfirmController.text) {
      try {
        authService.signUp(_emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
      } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Password don't match!"),
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
              size: 80,),
        
            // Email
            AuthField(
              hintText: "Enter your Email/No. HP", 
              isCensored: false,
              controller: _emailController,),
        
            // Password
            AuthField(
              hintText: "Enter your Password",
              isCensored: true,
              controller: _passwordController,),

            // Confirm Password
            AuthField(
              hintText: "Confirm your Password",
              isCensored: true,
              controller: _passwordConfirmController,),

            // Login button
            AuthButton(name: "Register", onTap: () => register(context)),
        
            // Register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun? "),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Sekarang!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 26, 91, 143)
                    )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}