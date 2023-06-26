import 'dart:math';

abstract class BaseRandomIdGenerator {
  Future<String> getDigitsID(int length);
  Future<String> getAlphabetID(int length);
}

class RandomIdGenerator implements BaseRandomIdGenerator {
  static const String _digits = '1234567890';
  static const _charsAlpha =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rn = Random();
  @override
  Future<String> getDigitsID(int length) async {
    String id = String.fromCharCodes(Iterable.generate(
        length, (_) => _digits.codeUnitAt(_rn.nextInt(_digits.length))));
    return id;
  }

  @override
  Future<String> getAlphabetID(int length) async {
    String id = String.fromCharCodes(Iterable.generate(length,
        (_) => _charsAlpha.codeUnitAt(_rn.nextInt(_charsAlpha.length))));
    return id;
  }
}
