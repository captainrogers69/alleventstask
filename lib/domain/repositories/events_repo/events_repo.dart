import 'package:alleventstask/domain/services/events_service/events_service.dart';
import 'package:dio/dio.dart';

class EventsRepository {
  final EventsService _eventsApis = EventsService();
  // EventsRepo(this._ref);
  // final Ref _ref;

  Future<Response?> fetchTestCategories() => _eventsApis.fetchTestCategories();
  Future<Response?> fetchEventFromUrl({required String eventUrl}) =>
      _eventsApis.fetchEventFromUrl(eventUrl: eventUrl);
}
