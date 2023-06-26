import 'dart:developer';

import '../../manager/event_manager.dart';
import 'package:dio/dio.dart';

class EventsService {
  final EventApiManager _events = EventApiManager();
  // final Navigate _nav = Navigate.instance;

  Future<Response?> fetchTestCategories() async {
    Response? response;
    try {
      Dio responseFromManager = await _events.dio();
      response = await responseFromManager.get(EventApiManager.testCategories);
      log("Response Data: ${response.data!}");
      log("Response Extra: ${response.extra}");
      return response;
    } on DioError catch (e) {
      log("Event Dio Error: $e");
      return e.response!;
    }
  }

  Future<Response?> fetchEventFromUrl({required String eventUrl}) async {
    Response? response;
    try {
      Dio responseFromManager = await _events.dio();
      response = await responseFromManager.get(eventUrl);
      log("Response Data: ${response.data!}");
      log("Response Extra: ${response.extra}");
      return response;
    } on DioError catch (e) {
      log("Event Dio Error: $e");
      return e.response!;
    }
  }
}
