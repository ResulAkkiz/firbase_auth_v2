import 'package:firbase_auth_v2/core/model/user_model.dart';

abstract class AuthBase {
  Future<UserModel?> createUserwithEmailandPassword(
      String email, String password);

  Future<UserModel?> signInwithEmailandPassword(String email, String password);

  Future<bool> signOut();

  Stream<UserModel?> get onAuthStateChange;
}
