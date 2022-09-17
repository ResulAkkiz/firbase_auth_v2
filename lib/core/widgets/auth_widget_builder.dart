import 'package:firbase_auth_v2/core/model/user_model.dart';
import 'package:firbase_auth_v2/core/services/auth_base.dart';
import 'package:firbase_auth_v2/core/widgets/auth_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseService = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder(
      stream: firebaseService.onAuthStateChange,
      builder: (context, AsyncSnapshot<UserModel?> snapshot) {
        return Provider.value(
          value: snapshot.data,
          child: AuthWidget(
            asyncSnapshot: snapshot,
          ),
        );
      },
    );
  }
}
