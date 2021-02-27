import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:FTA/Record/Model/Record.dart';
import 'package:http/http.dart' as http;

class RecordDataProvider {
  final _baseUrl = 'http://192.168.56.1:3000';
  final http.Client httpClient;

  RecordDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Record> createRecord(Record Record) async {
    final response = await httpClient.post(
      Uri.http('192.168.56.1:3000', '/Records'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': Record.title,
        'code': Record.code,
        'description': Record.description,
        'ects': Record.ects,
      }),
    );

    if (response.statusCode == 200) {
      return Record.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Record.');
    }
  }

  Future<List<Record>> getRecords() async {
    final response = await httpClient.get('$_baseUrl/Records');

    if (response.statusCode == 200) {
      final Records = jsonDecode(response.body) as List;
      return Records.map((Record) => Record.fromJson(Record)).toList();
    } else {
      throw Exception('Failed to load Records');
    }
  }

  Future<void> deleteRecord(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/Records/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete Record.');
    }
  }

  Future<void> updateRecord(Record Record) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/Records/${Record.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': Record.id,
        'title': Record.title,
        'code': Record.code,
        'description': Record.description,
        'ects': Record.ects,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update Record.');
    }
  }
}
