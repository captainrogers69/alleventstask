import 'dart:developer';
import 'package:alleventstask/config/packages/toast/k_toast.dart';
import 'package:alleventstask/domain/models/json_models/user_model.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/view_model/auth_view_model/auth_base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthViewModel with ChangeNotifier implements AuthBaseModel {
  // final Navigate _nav = Navigate.instance;
  final Ref _ref;
  AuthViewModel(this._ref);

  bool _loggingIn = false;
  bool get loggingIn => _loggingIn;

  bool _facebookLoggingIn = false;
  bool get facebookLoggingIn => _facebookLoggingIn;

  void configFacebookLoginFetch(bool vvb) {
    _facebookLoggingIn = vvb;
    notifyListeners();
  }

  void configLoginFetch(bool vvb) {
    _loggingIn = vvb;
    notifyListeners();
  }

  /// variables to store current logged in user
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser!;

  @override
  void configCurrentUser(UserModel ccv) {
    _currentUser = ccv;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  /// helper to login
  Future<void> validateLogin(
      {required TextEditingController password,
      required TextEditingController email,
      bool signgingUp = false}) async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      configLoginFetch(true);
      if (signgingUp) {
        await signupWithEmail(
          password: password.text.trim(),
          email: email.text.trim(),
        );
      } else {
        await signinWithEmail(
          password: password.text.trim(),
          email: email.text.trim(),
        );
      }
    } else {
      if (email.text.isEmpty) {
        configLoginFetch(false);
        kToast(style: ToastStyle.error, message: "Please enter your email");
      } else {
        configLoginFetch(false);
        kToast(style: ToastStyle.error, message: "Please enter your password");
      }
    }
  }

  /// functions to store current logged in user

  @override
  Future<void> signInFacebook() async {
    configFacebookLoginFetch(true);
    UserCredential? result =
        await _ref.read(firebaseServiceProvider).signInFacebook();
    if (result != null) {
      log("Got User Result Id: ${result.user!.uid}");
      configLoginFetch(false);
      Map<String, dynamic>? tempUser = await _ref
          .read(firestoreServiceProvider)
          .fetchUser(uUid: result.user!.uid);
      _currentUser = UserModel.fromMap(tempUser!);
      kToast(message: "Facebook Login Successful");
    } else {
      log("result not found auth view model with faecbook sign in");
    }
    notifyListeners();
  }

  @override
  Future<void> signOut() async {
    _ref.read(firebaseServiceProvider).signOut();
    _currentUser = null;
  }

  @override
  Future<void> signinWithEmail(
      {required String email, required String password}) async {
    UserCredential? result = await _ref
        .read(firebaseServiceProvider)
        .signinWithEmail(email: email, password: password);
    if (result != null) {
      log("Got User Result Id: ${result.user!.uid}");
      configLoginFetch(false);
      Map<String, dynamic>? tempUser = await _ref
          .read(firestoreServiceProvider)
          .fetchUser(uUid: result.user!.uid);
      _currentUser = UserModel.fromMap(tempUser!);
      kToast(message: "Login Successful");
    } else {
      log("result not found auth view model with signn in");
    }
    notifyListeners();
  }

  @override
  Future<void> signupWithEmail(
      {required String email, required String password}) async {
    UserCredential? result = await _ref
        .read(firebaseServiceProvider)
        .signUpWithEmail(email: email, password: password);
    if (result != null) {
      log("create User Result Id: ${result.user!.uid}");
      configLoginFetch(false);
      Map<String, dynamic>? tempUser =
          await _ref.read(firestoreServiceProvider).createNewUser(
                uUid: result.user!.uid,
                password: password,
                emailing: email,
              );
      _currentUser = UserModel.fromMap(tempUser);
      kToast(message: "Sign Up Successful");
    } else {
      log("result not found auth view model with sign up");
    }
    notifyListeners();
  }

  Future<void> fetchCurrentUser() async {
    if (_ref.read(firebaseProvider).currentUser != null) {
      Map<String, dynamic>? tempUser = await _ref
          .read(firestoreServiceProvider)
          .fetchUser(uUid: _ref.read(firebaseProvider).currentUser!.uid);
      _currentUser = UserModel.fromMap(tempUser!);
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        notifyListeners();
      });
    }
  }
}
