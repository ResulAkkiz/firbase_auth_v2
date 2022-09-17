import 'package:firbase_auth_v2/core/services/auth_base.dart';
import 'package:firbase_auth_v2/core/services/firebase_auth_service.dart';

import 'package:firbase_auth_v2/core/widgets/auth_widget_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthBase>(
          create: (_) {
            return FirebaseAuthService();
          },
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: AuthWidgetBuilder());
  }
}
