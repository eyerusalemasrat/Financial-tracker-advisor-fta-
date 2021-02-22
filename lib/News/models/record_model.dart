import 'package:flutter/material.dart';

@immutable
class Record {
  Record(
      {this.id,
      @required this.title,
      @required this.body});

  final String id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() => 'Record { id: $id, body: $body }';
}
