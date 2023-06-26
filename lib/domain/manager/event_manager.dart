import 'package:dio/dio.dart';

class EventApiManager {
  static const String baseUrl = 'https://allevents.s3.amazonaws.com/tests/';

  /// Event Api End Points
  static const String testCategories = 'categories.json';

  Future<Dio> dio() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          //'Authorization': 'Zoho-oauthtoken',
          "Accept": "application/json",
        },
      ),
    );
    return dio;
  }
}
