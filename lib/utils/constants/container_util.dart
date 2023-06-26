import 'package:flutter/material.dart';

final List<BoxShadow> witBoxShadow = [
  const BoxShadow(
    offset: Offset(6, 4),
    blurRadius: 8,
    // offset: Offset(2, 2),
    // blurRadius: 12,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  )
];

final List<BoxShadow> darkShadow = [
  BoxShadow(
    offset: const Offset(2, 2),
    blurRadius: 12,
    color: Colors.grey[400]!,
  )
];

final List<BoxShadow> lightShadow = [
  const BoxShadow(
    offset: Offset(1, 1),
    blurRadius: 12,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  )
];

const List<BoxShadow> topShadow = [
  BoxShadow(
    offset: Offset(-12, -12),
    blurRadius: 12,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  )
];

final Border bororder = Border.all(color: Colors.black, width: 1.5);
final Border smallBorder = Border.all(color: Colors.blue);

final BorderRadius witRadiusSmall = BorderRadius.circular(5);
final BorderRadius witRadiusStan = BorderRadius.circular(11);
final BorderRadius witRadiusMid = BorderRadius.circular(21);
final BorderRadius witRadiusCircular = BorderRadius.circular(81);
const BorderRadius witSmallShape = BorderRadius.only(
  topLeft: Radius.circular(5),
  topRight: Radius.circular(5),
);
const BorderRadius witRoundedShape = BorderRadius.only(
  topLeft: Radius.circular(11),
  topRight: Radius.circular(11),
);

const ShapeBorder roundedShapeSmall = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(5),
    topRight: Radius.circular(5),
  ),
);

const ShapeBorder roundedShapeStan = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(11),
    topRight: Radius.circular(11),
  ),
);

final ShapeBorder standardMidShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(11),
);

const ShapeBorder roundedShapeMid = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(21),
    topRight: Radius.circular(21),
  ),
);

const marginSymmetric = EdgeInsets.symmetric(vertical: 10, horizontal: 15);
