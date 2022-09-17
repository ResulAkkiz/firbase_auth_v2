import 'package:firbase_auth_v2/core/model/user_model.dart';
import 'package:firbase_auth_v2/core/services/auth_base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthBase>(context, listen: false);
    final user = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () async {
                authService.signOut();
              },
              icon: const Icon(Icons.add_to_home_screen_sharp))
        ],
      ),
      body: Center(
        child: Text(user.userEmail),
      ),
    );
  }
}
