import 'package:alleventstask/all_events_app/all_events_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: false,
        builder: (context) {
          return const AllEventsApp();
        },
      ),
    ),
  );
}
