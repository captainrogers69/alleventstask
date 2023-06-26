// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/foundation.dart';

class EventItemModel {
  final String? event_id;
  final String? eventname;
  final String? eventname_raw;
  final String? owner_id;
  final String? thumb_url;
  final String? thumb_url_large;
  final num? start_time;
  final String? start_time_display;
  final String? end_time_display;
  final num? end_time;
  final String? location;
  final Map<String, dynamic>? venue;
  final String? label;
  final num? featured;
  final String? event_url;
  final String? share_url;
  final String? banner_url;
  final num? score;
  final List? categories;
  final List? tags;
  final Map<String, dynamic>? tickets;
  final List? custom_params;
  EventItemModel({
    required this.event_id,
    required this.eventname,
    required this.eventname_raw,
    required this.owner_id,
    required this.thumb_url,
    required this.thumb_url_large,
    required this.start_time,
    required this.start_time_display,
    required this.end_time_display,
    required this.end_time,
    required this.location,
    required this.venue,
    required this.label,
    required this.featured,
    required this.event_url,
    required this.share_url,
    required this.banner_url,
    required this.score,
    required this.categories,
    required this.tags,
    required this.tickets,
    required this.custom_params,
  });

  EventItemModel copyWith({
    String? event_id,
    String? eventname,
    String? eventname_raw,
    String? owner_id,
    String? thumb_url,
    String? thumb_url_large,
    num? start_time,
    String? start_time_display,
    String? end_time_display,
    num? end_time,
    String? location,
    Map<String, dynamic>? venue,
    String? label,
    num? featured,
    String? event_url,
    String? share_url,
    String? banner_url,
    num? score,
    List? categories,
    List? tags,
    Map<String, dynamic>? tickets,
    List? custom_params,
  }) {
    return EventItemModel(
      event_id: event_id ?? this.event_id,
      eventname: eventname ?? this.eventname,
      eventname_raw: eventname_raw ?? this.eventname_raw,
      owner_id: owner_id ?? this.owner_id,
      thumb_url: thumb_url ?? this.thumb_url,
      thumb_url_large: thumb_url_large ?? this.thumb_url_large,
      start_time: start_time ?? this.start_time,
      start_time_display: start_time_display ?? this.start_time_display,
      end_time_display: end_time_display ?? this.end_time_display,
      end_time: end_time ?? this.end_time,
      location: location ?? this.location,
      venue: venue ?? this.venue,
      label: label ?? this.label,
      featured: featured ?? this.featured,
      event_url: event_url ?? this.event_url,
      share_url: share_url ?? this.share_url,
      banner_url: banner_url ?? this.banner_url,
      score: score ?? this.score,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      tickets: tickets ?? this.tickets,
      custom_params: custom_params ?? this.custom_params,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'event_id': event_id,
      'eventname': eventname,
      'eventname_raw': eventname_raw,
      'owner_id': owner_id,
      'thumb_url': thumb_url,
      'thumb_url_large': thumb_url_large,
      'start_time': start_time,
      'start_time_display': start_time_display,
      'end_time_display': end_time_display,
      'end_time': end_time,
      'location': location,
      'venue': venue,
      'label': label,
      'featured': featured,
      'event_url': event_url,
      'share_url': share_url,
      'banner_url': banner_url,
      'score': score,
      'categories': categories?.toList(),
      'tags': tags?.toList(),
      'tickets': tickets,
      'custom_params': custom_params?.toList(),
    };
  }

  factory EventItemModel.fromMap(Map<String, dynamic> map) {
    return EventItemModel(
      event_id: map['event_id'] != null ? map['event_id'] as String : null,
      eventname: map['eventname'] != null ? map['eventname'] as String : null,
      eventname_raw:
          map['eventname_raw'] != null ? map['eventname_raw'] as String : null,
      owner_id: map['owner_id'] != null ? map['owner_id'] as String : null,
      thumb_url: map['thumb_url'] != null ? map['thumb_url'] as String : null,
      thumb_url_large: map['thumb_url_large'] != null
          ? map['thumb_url_large'] as String
          : null,
      start_time: map['start_time'] != null ? map['start_time'] as num : null,
      start_time_display: map['start_time_display'] != null
          ? map['start_time_display'] as String
          : null,
      end_time_display: map['end_time_display'] != null
          ? map['end_time_display'] as String
          : null,
      end_time: map['end_time'] != null ? map['end_time'] as num : null,
      location: map['location'] != null ? map['location'] as String : null,
      venue: map['venue'] != null
          ? Map<String, dynamic>.from((map['venue'] as Map<String, dynamic>))
          : null,
      label: map['label'] != null ? map['label'] as String : null,
      featured: map['featured'] != null ? map['featured'] as num : null,
      event_url: map['event_url'] != null ? map['event_url'] as String : null,
      share_url: map['share_url'] != null ? map['share_url'] as String : null,
      banner_url:
          map['banner_url'] != null ? map['banner_url'] as String : null,
      score: map['score'] != null ? map['score'] as num : null,
      categories: map['categories'] != null
          ? List.from(map['categories'] as List)
          : null,
      tags: map['tags'] != null ? List.from(map['tags'] as List) : null,
      tickets: map['tickets'] != null
          ? Map<String, dynamic>.from((map['tickets'] as Map<String, dynamic>))
          : null,
      custom_params: map['custom_params'] != null
          ? List.from(map['custom_params'] as List)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventItemModel.fromJson(String source) =>
      EventItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventItemModel(event_id: $event_id, eventname: $eventname, eventname_raw: $eventname_raw, owner_id: $owner_id, thumb_url: $thumb_url, thumb_url_large: $thumb_url_large, start_time: $start_time, start_time_display: $start_time_display, end_time_display: $end_time_display, end_time: $end_time, location: $location, venue: $venue, label: $label, featured: $featured, event_url: $event_url, share_url: $share_url, banner_url: $banner_url, score: $score, categories: $categories, tags: $tags, tickets: $tickets, custom_params: $custom_params)';
  }

  @override
  bool operator ==(covariant EventItemModel other) {
    if (identical(this, other)) return true;

    return other.event_id == event_id &&
        other.eventname == eventname &&
        other.eventname_raw == eventname_raw &&
        other.owner_id == owner_id &&
        other.thumb_url == thumb_url &&
        other.thumb_url_large == thumb_url_large &&
        other.start_time == start_time &&
        other.start_time_display == start_time_display &&
        other.end_time_display == end_time_display &&
        other.end_time == end_time &&
        other.location == location &&
        mapEquals(other.venue, venue) &&
        other.label == label &&
        other.featured == featured &&
        other.event_url == event_url &&
        other.share_url == share_url &&
        other.banner_url == banner_url &&
        other.score == score &&
        other.categories == categories &&
        other.tags == tags &&
        mapEquals(other.tickets, tickets) &&
        other.custom_params == custom_params;
  }

  @override
  int get hashCode {
    return event_id.hashCode ^
        eventname.hashCode ^
        eventname_raw.hashCode ^
        owner_id.hashCode ^
        thumb_url.hashCode ^
        thumb_url_large.hashCode ^
        start_time.hashCode ^
        start_time_display.hashCode ^
        end_time_display.hashCode ^
        end_time.hashCode ^
        location.hashCode ^
        venue.hashCode ^
        label.hashCode ^
        featured.hashCode ^
        event_url.hashCode ^
        share_url.hashCode ^
        banner_url.hashCode ^
        score.hashCode ^
        categories.hashCode ^
        tags.hashCode ^
        tickets.hashCode ^
        custom_params.hashCode;
  }
}
