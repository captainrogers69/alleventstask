import 'dart:developer';

import 'package:alleventstask/domain/models/json_models/user_model.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirestoreService {
  final Ref _ref;
  FirestoreService(this._ref);

  Future<Map<String, dynamic>> createNewUser(
      {required String uUid,
      required String emailing,
      required String password}) async {
    final UserModel usering = UserModel(
      dateOfBirth: null,
      dateOfJoining: Timestamp.now(),
      facebookVerified: "",
      githubVerified: "",
      googleMail: emailing,
      googleVerified: "",
      isUserDeleted: false,
      microsoftVerified: "",
      password: password,
      profileCover: "",
      profileName: "",
      profileUpdated: false,
      profileUrl: "",
      twitterVerified: "",
      userBio: "",
      userId: uUid,
      userName: "",
      userPhone: "",
    );
    await _ref
        .read(firestoreProvider)
        .collection("users")
        .doc(uUid)
        .set(usering.toMap());
    log("created User data: ${usering.toMap()}");
    return usering.toMap();
  }

  Future<Map<String, dynamic>?> fetchUser({required String uUid}) async {
    DocumentSnapshot<Map<String, dynamic>> userData =
        await _ref.read(firestoreProvider).collection("users").doc(uUid).get();
    if (userData.exists) {
      log("fetched User data: ${userData.data()!}");
      return userData.data()!;
    } else {
      return null;
    }
  }
}
