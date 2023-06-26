import 'dart:developer';
import 'package:alleventstask/components/dialogs/exception_dialog.dart';
import 'package:alleventstask/config/packages/toast/k_toast.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirebaseService {
  final Ref _ref;
  FirebaseService(this._ref);

  // Future<void> signInAnon() async {
  //   try {
  //     User? currentUser = _ref.read(firebaseProvider).currentUser;
  //     if (currentUser == null) {
  //       log("========anonymous user loggin in...=======");
  //       await _ref.read(firebaseProvider).signInAnonymously();
  //       await signInAnon();
  //     } else {
  //       log("========anonymous user found ${currentUser.uid}=======");
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     log("========anonymous error ${signInErrorCodes[e.code] ?? 'Database Error Occured'}=======");
  //     await signInAnon();
  //   } catch (e) {
  //     log("========anonymous error occurred ${e.toString()}=======");
  //     await signInAnon();
  //   }
  // }

  Future<UserCredential?> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential result = await _ref
          .read(firebaseProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // throw ErrorExceptionDialog("The password provided is too weak.");
        log(e.toString());
        kToast(
            style: ToastStyle.error,
            message: "The password provided is too weak.");
        _ref.read(authViewProvider).configLoginFetch(false);
        return null;
      } else if (e.code == 'invalid-email') {
        // throw ErrorExceptionDialog("The Email Provided is invalid");
        log(e.toString());
        kToast(
            style: ToastStyle.error, message: "The Email Provided is invalid");
        _ref.read(authViewProvider).configLoginFetch(false);
        return null;
      } else if (e.code == 'email-already-in-use') {
        // throw ErrorExceptionDialog("The account already exists for that email.");
        log(e.toString());
        kToast(
            style: ToastStyle.error,
            message: "The account already exists for that email.");
        _ref.read(authViewProvider).configLoginFetch(false);
        return null;
      } else {
        // throw ErrorExceptionDialog(e.toString());
        log(e.toString());
        kToast(style: ToastStyle.error, message: e.toString());
        _ref.read(authViewProvider).configLoginFetch(false);
        return null;
      }
    }
  }

  Stream<User?> get userChanges => _ref.read(firebaseProvider).userChanges();

  Future<void> signOut() async {
    try {
      await _ref.read(firebaseProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw ErrorExceptionDialog(e.toString());
    }
  }

  Future<UserCredential?> signinWithEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential result = await _ref
          .read(firebaseProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      kToast(style: ToastStyle.error, message: e.toString());
      _ref.read(authViewProvider).configLoginFetch(false);
      // throw ErrorExceptionDialog(e.toString());
      return null;
    }
  }

  // Future<UserCredential?> signInFacebook() async {
  //   return null;
  // }

  Future<UserCredential?> signInFacebook() async {
    try {
      final plugin = FacebookLogin(debug: true);
      await plugin.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email
      ]);
      final FacebookAccessToken? token = await plugin.accessToken;
      FacebookUserProfile? profile;
      String? fbMail;
      String? imageUrl;
      if (token != null) {
        profile = await plugin.getUserProfile();
        log("Facebook Profile Map: ${profile!.toMap()}");
        if (token.permissions.contains(FacebookPermission.email.name)) {
          fbMail = await plugin.getUserEmail();
          // sendLogsToFacebook('', fbMail!);
        }
        imageUrl = await plugin.getProfileImageUrl(width: 100);
        log("FACEBOOK CRED: $fbMail +                ____________ $imageUrl");
        final credential = FacebookAuthProvider.credential(token.token);
        UserCredential result =
            await _ref.read(firebaseProvider).signInWithCredential(credential);
        if (result.user != null) {
          /// switch case for facebook to be added later
          /// result success here
          return result;
        } else {
          _ref.read(authViewProvider).configFacebookLoginFetch(false);
          log('result not found facebook');
          kToast(
            style: ToastStyle.error,
            message: "Facebook Result not found",
          );
          return null;
          // throw ErrorExceptionDialog("No Result Found!");
        }
      } else {
        log('Facebook token is null error:');
        kToast(
          style: ToastStyle.error,
          message: "Facebook token not found",
        );
        _ref.read(authViewProvider).configFacebookLoginFetch(false);
        return null;
        // throw ErrorExceptionDialog("Facebook token not found");
      }
    } on FacebookError catch (e) {
      log('Facebook error: $e');
      kToast(
        style: ToastStyle.error,
        message: e.toString(),
      );
      _ref.read(authViewProvider).configFacebookLoginFetch(false);
      return null;
      // throw ErrorExceptionDialog(e.toString());
    } on PlatformException catch (e) {
      log('Platform exception facebook error: $e');
      kToast(
        style: ToastStyle.error,
        message: e.toString(),
      );
      _ref.read(authViewProvider).configFacebookLoginFetch(false);
      return null;
      // throw ErrorExceptionDialog(e.toString());
    } on FirebaseAuthException catch (e) {
      log('Firebase facebook auth : ${e.code} ${e.toString()}');
      kToast(
        style: ToastStyle.error,
        message: e.toString(),
      );
      _ref.read(authViewProvider).configFacebookLoginFetch(false);
      return null;
      // throw ErrorExceptionDialog(e.toString());
    } catch (e) {
      log('Error: $e');
      kToast(
        style: ToastStyle.error,
        message: e.toString(),
      );
      _ref.read(authViewProvider).configFacebookLoginFetch(false);
      return null;
      // throw ErrorExceptionDialog(e.toString());
    }
  }
}
