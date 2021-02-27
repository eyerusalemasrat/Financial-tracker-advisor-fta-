import 'package:meta/meta.dart';
import 'package:FTA/Record/Record.dart';

class RecordRepository {
  final RecordDataProvider dataProvider;

  RecordRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Record> createRecord(Record Record) async {
    return await dataProvider.createRecord(Record);
  }

  Future<List<Record>> getRecords() async {
    return await dataProvider.getRecords();
  }

  Future<void> updateRecord(Record Record) async {
    await dataProvider.updateRecord(Record);
  }

  Future<void> deleteRecord(String id) async {
    await dataProvider.deleteRecord(id);
  }
}
