import 'package:firbase_auth_v2/core/model/user_model.dart';
import 'package:firbase_auth_v2/views/errorpage_view.dart';
import 'package:firbase_auth_v2/views/homepage_view.dart';
import 'package:firbase_auth_v2/views/singinpage_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key, required this.asyncSnapshot});
  final AsyncSnapshot<UserModel?> asyncSnapshot;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if (asyncSnapshot.connectionState == ConnectionState.active) {
      return asyncSnapshot.hasData
          ? const HomePageView()
          : const SigninPageView();
    } else {
      return const ErrorPageView();
    }
  }
}
