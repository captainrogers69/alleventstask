import 'package:alleventstask/domain/models/json_models/user_model.dart';

abstract class AuthBaseModel {
  void configCurrentUser(UserModel ccv);
  // Stream<User?> get userChanges;
  Future<void> signInFacebook();
  Future<void> signinWithEmail(
      {required String email, required String password});
  Future<void> signupWithEmail(
      {required String email, required String password});
  Future<void> signOut();
}
