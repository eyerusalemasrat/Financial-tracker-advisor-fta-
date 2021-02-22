import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:login/News/models/record_model.dart';
import 'package:http/http.dart' as http;

class RecordDataProvider {
  final _baseUrl = 'http://192.168.43.190';
  final http.Client httpClient;

  RecordDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Record> createRecord(Record record) async {
    final response = await httpClient.post(
      Uri.http('192.168.56.1:3000', '/records'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': record.title,
        'body': record.body,
      }),
    );

    if (response.statusCode == 200) {
      return Record.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create record.');
    }
  }

  Future<List<Record>> getRecords() async {
    final response = await httpClient.get('$_baseUrl/records');

    if (response.statusCode == 200) {
      final records = jsonDecode(response.body) as List;
      return records.map((record) => Record.fromJson(record)).toList();
    } else {
      throw Exception('Failed to load records');
    }
  }

  Future<void> deleteRecord(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/records/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete record.');
    }
  }

  Future<void> updateRecord(Record record) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/records/${record.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': record.id,
        'title': record.title,
        'body': record.body
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update record.');
    }
  }
}
