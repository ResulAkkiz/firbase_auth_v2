import 'package:firbase_auth_v2/core/services/auth_base.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninPageView extends StatefulWidget {
  const SigninPageView({super.key});

  @override
  State<SigninPageView> createState() => _SigninPageViewState();
}

class _SigninPageViewState extends State<SigninPageView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = Provider.of<AuthBase>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  firebaseAuthService.createUserwithEmailandPassword(
                      emailController.text, passwordController.text);
                },
                child: const Text('Sign Up')),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  firebaseAuthService.signInwithEmailandPassword(
                      emailController.text, passwordController.text);
                },
                child: const Text('Sign In')),
          ],
        ),
      ),
    );
  }
}
