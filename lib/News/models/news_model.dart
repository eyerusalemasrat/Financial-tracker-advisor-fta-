import 'package:flutter/material.dart';

@immutable
class News {
  News(
      {this.id,
      @required this.title,
      @required this.body});

  final String id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() => 'News { id: $id, body: $body }';
}
