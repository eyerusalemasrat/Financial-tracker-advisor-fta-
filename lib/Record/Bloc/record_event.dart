import 'package:FTA/Record/Record.dart';
import 'package:equatable/equatable.dart';

abstract class RecordEvent extends Equatable {
  const RecordEvent();
}

class RecordLoad extends RecordEvent {
  const RecordLoad();

  @override
  List<Object> get props => [];
}

class RecordCreate extends RecordEvent {
  final Record Record;

  const RecordCreate(this.Record);

  @override
  List<Object> get props => [Record];

  @override
  String toString() => 'Record Created {Record: $Record}';
}

class Record {}

class RecordUpdate extends RecordEvent {
  final Record Record;

  const RecordUpdate(this.Record);

  @override
  List<Object> get props => [Record];

  @override
  String toString() => 'Record Updated {Record: $Record}';
}

class RecordDelete extends RecordEvent {
  final Record Record;

  const RecordDelete(this.Record);

  @override
  List<Object> get props => [Record];

  @override
  toString() => 'Record Deleted {Record: $Record}';
}
