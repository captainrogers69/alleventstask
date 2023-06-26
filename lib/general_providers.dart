import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/domain/repositories/events_repo/events_repo.dart';
import 'package:alleventstask/domain/services/firebase_service/firebase_service.dart';
import 'package:alleventstask/domain/services/firebase_service/firestore_service.dart';
import 'package:alleventstask/view_model/auth_view_model/auth_view_model.dart';
import 'package:alleventstask/view_model/bottom_view_model/bottom_view_model.dart';
import 'package:alleventstask/view_model/event_view_model/events_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<Navigate> navProvider = Provider<Navigate>((ref) {
  return Navigate.instance;
});

final Provider<FirebaseAuth> firebaseProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final Provider<FirebaseFirestore> firestoreProvider =
    Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final Provider<FirestoreService> firestoreServiceProvider =
    Provider<FirestoreService>((ref) {
  return FirestoreService(ref);
});

final Provider<FirebaseService> firebaseServiceProvider =
    Provider<FirebaseService>((ref) {
  return FirebaseService(ref);
});

final AutoDisposeStreamProvider<dynamic> authStreamProvider =
    StreamProvider.autoDispose<User?>((ref) {
  ref.keepAlive();
  final Stream<User?> userStream =
      ref.read(firebaseServiceProvider).userChanges;
  return userStream;
});

final ChangeNotifierProvider<AuthViewModel> authViewProvider =
    ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel(ref));

final ChangeNotifierProvider<BottomViewModel> bottomProvider =
    ChangeNotifierProvider<BottomViewModel>((ref) {
  return BottomViewModel();
});

final ChangeNotifierProvider<EventsViewModel> eventsViewProvider =
    ChangeNotifierProvider<EventsViewModel>((ref) {
  return EventsViewModel(ref);
});

final Provider<EventsRepository> eventsProvider =
    Provider<EventsRepository>((ref) {
  return EventsRepository();
});

// final Provider<EventsService> eventsServiceProvider =
//     Provider<EventsService>((ref) {
//   return EventsService();
// });
