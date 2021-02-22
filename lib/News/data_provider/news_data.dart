import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:login/News/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsDataProvider {
  final _baseUrl = 'http://192.168.43.190';
  final http.Client httpClient;

  NewsDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<News> createNews(News news) async {
    final response = await httpClient.post(
      Uri.http('192.168.56.1:3000', '/newss'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': news.title,
        'body': news.body,
      }),
    );

    if (response.statusCode == 200) {
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create news.');
    }
  }

  Future<List<News>> getNewss() async {
    final response = await httpClient.get('$_baseUrl/newss');

    if (response.statusCode == 200) {
      final newss = jsonDecode(response.body) as List;
      return newss.map((news) => News.fromJson(news)).toList();
    } else {
      throw Exception('Failed to load newss');
    }
  }

  Future<void> deleteNews(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/newss/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete news.');
    }
  }

  Future<void> updateNews(News news) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/newss/${news.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': news.id,
        'title': news.title,
        'body': news.body
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update news.');
    }
  }
}
