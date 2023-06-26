import 'dart:math';

extension NumberExtension on dynamic {
  String numberFormat(int a) {
    if (a.toString().length > 3) {
      return NumberFormat('#,##,000').format(a);
    } else {
      return a.toString();
    }
  }

  double doubleRound(double val, int places) {
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }
}
