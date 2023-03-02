import 'package:flutter/foundation.dart';

@immutable
class Event {
  const Event({this.title = 'Title'});
  final String title;

  @override
  bool operator ==(Object other) => other is Event && title == other.title;

  @override
  String toString() => title;
}
