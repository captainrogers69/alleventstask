// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';

class EventsModel {
  final Map<String, dynamic> request;
  final num? count;
  final List? item;
  EventsModel({
    required this.request,
    this.count,
    this.item,
  });

  EventsModel copyWith({
    Map<String, dynamic>? request,
    num? count,
    List? item,
  }) {
    return EventsModel(
      request: request ?? this.request,
      count: count ?? this.count,
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'request': request,
      'count': count,
      'item': item?.toList(),
    };
  }

  factory EventsModel.fromMap(Map<String, dynamic> map) {
    return EventsModel(
      request:
          Map<String, dynamic>.from((map['request'] as Map<String, dynamic>)),
      count: map['count'] != null ? map['count'] as num : null,
      item: map['item'] != null ? List.from(map['item'] as List) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventsModel.fromJson(String source) =>
      EventsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'EventsModel(request: $request, count: $count, item: $item)';

  @override
  bool operator ==(covariant EventsModel other) {
    if (identical(this, other)) return true;

    return mapEquals(other.request, request) &&
        other.count == count &&
        other.item == item;
  }

  @override
  int get hashCode => request.hashCode ^ count.hashCode ^ item.hashCode;
}
