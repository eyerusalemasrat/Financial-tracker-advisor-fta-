import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:FTA/News/Model/News.dart';
import 'package:http/http.dart' as http;

class NewsDataProvider {
  final _baseUrl = 'http://192.168.56.1:3000';
  final http.Client httpClient;

  NewsDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<News> createNews(News News) async {
    final response = await httpClient.post(
      Uri.http('192.168.56.1:3000', '/Newss'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': News.title,
        'code': News.code,
        'description': News.description,
        'ects': News.ects,
      }),
    );

    if (response.statusCode == 200) {
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create News.');
    }
  }

  Future<List<News>> getNewss() async {
    final response = await httpClient.get('$_baseUrl/Newss');

    if (response.statusCode == 200) {
      final Newss = jsonDecode(response.body) as List;
      return Newss.map((News) => News.fromJson(News)).toList();
    } else {
      throw Exception('Failed to load Newss');
    }
  }

  Future<void> deleteNews(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/Newss/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete News.');
    }
  }

  Future<void> updateNews(News News) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/Newss/${News.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': News.id,
        'title': News.title,
        'code': News.code,
        'description': News.description,
        'ects': News.ects,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update News.');
    }
  }
}
