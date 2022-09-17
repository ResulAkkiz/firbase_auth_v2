import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

mixin ConvertUser {
  UserModel? convertUser(User? user) {
    return UserModel(userID: user!.uid, userEmail: user.email ?? '');
  }
}
