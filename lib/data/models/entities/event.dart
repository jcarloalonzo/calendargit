import 'package:flutter/foundation.dart';

@immutable
class Event {
  final String title;

  const Event({this.title = "Title"});

  @override
  bool operator ==(Object other) => other is Event && title == other.title;


  @override
  String toString() => title;

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;



}
